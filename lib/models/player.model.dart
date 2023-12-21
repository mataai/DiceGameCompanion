import 'package:dice_game_companion/models/current_turn.dart';
import 'package:uuid/uuid.dart';

class Player {
  final Uuid id = const Uuid();
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
