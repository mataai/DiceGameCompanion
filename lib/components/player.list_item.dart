import 'package:flutter/material.dart';

class PlayerListItem extends StatelessWidget {
  const PlayerListItem({
    super.key,
    required this.playerName,
    required this.score,
    this.imgUrl = "",
    this.color = Colors.grey,
  });
  final String playerName;
  final int score;
  final Color color;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SizedBox(
        width: 50,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imgUrl.isNotEmpty
                      ? imgUrl
                      : "https://api.dicebear.com/7.x/bottts/svg?scale=120&flip=true&seed=$playerName",
                ),
              ),
            ),
          ),
        ),
      ),
      title: Text(playerName),
      subtitle: Row(
        children: [
          const Icon(Icons.savings, color: Colors.orange, size: 20),
          const SizedBox(
            width: 3,
          ),
          Text(score.toString()),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(width: 4, height: 4),
            ),
          ),
          Text("${(10000 - score).toString()} points to victory")
        ],
      ),
      // trailing: LikeButton(onPressed: () {}, color: Colors.orange),
    );
  }
}
