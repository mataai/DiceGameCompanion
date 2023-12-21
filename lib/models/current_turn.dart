import 'package:dice_game_companion/models/roll.dart';

class Turn {
  List<Roll> rolls;

  Turn({
    this.rolls = const [],
  });

  int get score {
    return rolls.fold(
        0, (previousValue, element) => previousValue + element.score);
  }
}
