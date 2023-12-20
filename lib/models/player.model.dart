import 'package:uuid/uuid.dart';

class Player {
  final Uuid id = const Uuid();
  final String name;
  int score;
  Player({required this.name, this.score = 0});
}
