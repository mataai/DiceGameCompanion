import 'package:dice_game_companion/models/turn.dart';
import 'package:dice_game_companion/models/player.model.dart';
import 'package:dice_game_companion/models/roll.dart';
import 'package:dice_game_companion/widgets/button.dart';
import 'package:dice_game_companion/widgets/dice.selector.dart';
import 'package:flutter/material.dart';

class GameView extends StatefulWidget {
  final List<Player> players;
  const GameView({super.key, required this.players});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  int currentPlayerIndex = 0;
  Turn currentTurn = Turn();
  Roll currentRoll = Roll(diceCount: 6);

  bool _canReRoll() {
    bool isDead = false;
    return currentRoll.lockedIndexes().length < 6;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Current Player: ${widget.players[currentPlayerIndex].name}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Current Turn Score: ${currentTurn.score}")],
        ),
        ...List.generate(
          6,
          (diceIndex) => DiceSelector(
            isLocked: currentRoll.dices[diceIndex] >= 0,
            onDiceSelected: (value) => {
              setState(() {
                currentRoll.setDiceValue(diceIndex, value);
              })
            },
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SimpleButton(
              isDisabled: !_canReRoll(),
              onPressed: () => {
                if (currentRoll.lockedIndexes().length == 6)
                  {
                    setState(() {
                      currentTurn.rolls.add(currentRoll);
                      currentRoll = Roll(
                        diceCount:
                            6 - currentTurn.rolls.last.lockedIndexes().length,
                      );
                    })
                  }
              },
              text: 'Reroll dices',
            ),
            SimpleButton(
              onPressed: () => {
                setState(() {
                  widget.players[currentPlayerIndex].turns.add(currentTurn);
                  currentTurn = Turn();
                  currentPlayerIndex =
                      (currentPlayerIndex + 1) % widget.players.length;
                })
              },
              text: "Pass to next player",
            ),
          ],
        ),
      ],
    );
  }
}
