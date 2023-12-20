import 'package:dice_game_companion/components/add_player.dialog.dart';
import 'package:dice_game_companion/components/player.list.dart';
import 'package:dice_game_companion/views/game.view.dart';
import 'package:dice_game_companion/widgets/button.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/player.model.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Game Companion',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final List<Player> players = [];
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addPlayer() async {
    String playerName = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddPlayerDialog();
      },
    );
    if (playerName.isNotEmpty) {
      setState(() {
        widget.players.add(Player(name: playerName));
      });
    }
  }

  void _startGame() {
    if (widget.players.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You need at least 2 players to start a game"),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameView(players: widget.players),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            children: [
              PlayerList(players: widget.players),
              const SizedBox(height: 24),
              widget.players.length >= 2
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SimpleButton(
                          onPressed: _startGame,
                          text: 'Start Game',
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPlayer,
        tooltip: 'Add Player',
        child: const Icon(Icons.add),
      ),
    );
  }
}
