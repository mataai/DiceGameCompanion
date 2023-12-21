import 'package:dice_game_companion/models/current_turn.dart';
import 'package:dice_game_companion/models/player.model.dart';
import 'package:dice_game_companion/models/roll.dart';
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
  Roll currentRoll = Roll();

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
      ],
    );
  }
}
