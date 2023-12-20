import 'package:dice_game_companion/models/player.model.dart';
import 'package:flutter/material.dart';

class GameView extends StatefulWidget {
  final List<Player> players;
  const GameView({super.key, required this.players});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  int currentPlayerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://api.dicebear.com/7.x/bottts/svg?scale=120&flip=true&seed=${widget.players[currentPlayerIndex].name}",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Current Player: ${widget.players[currentPlayerIndex].name}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Score: ${widget.players[currentPlayerIndex].score}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ],
    );
  }
}
