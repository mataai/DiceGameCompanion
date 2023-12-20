import 'package:dice_game_companion/components/player.list_item.dart';
import 'package:dice_game_companion/models/player.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayerList extends StatefulWidget {
  final List<Player> players = [];
  PlayerList({super.key, required players}) {
    this.players.clear();
    this.players.addAll(players);
  }

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.players.map(
          (e) => PlayerListItem(
            playerName: e.name,
            score: e.score,
          ),
        ),
      ],
    );
  }
}
