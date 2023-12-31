import 'package:dice_game_companion/models/turn.dart';

class Player {
  final String id = DateTime.now().millisecondsSinceEpoch.toString();
  final String name;
  final List<Turn> turns = [];
  bool isCurrentPlayer = false;

  Player({
    required this.name,
  });

  int get score {
    return turns.fold(
        0, (previousValue, element) => previousValue + element.score);
  }
}
