// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dice_game_companion/models/roll.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Roll a straight (1,2,3,4,5,6)',
    () {
      Roll roll = Roll(diceCount: 6);
      roll.setDiceValue(0, 1);
      roll.setDiceValue(1, 2);
      roll.setDiceValue(2, 3);
      roll.setDiceValue(3, 4);
      roll.setDiceValue(4, 5);
      roll.setDiceValue(5, 6);
      expect(roll.score, 2500);
      expect(roll.lockedIndexes().length, 6);
    },
  );

  test('Roll 1', () {
    Roll roll = Roll(diceCount: 6);
    roll.setDiceValue(0, 1);
    roll.setDiceValue(1, 4);
    roll.setDiceValue(2, 6);
    roll.setDiceValue(3, 4);
    roll.setDiceValue(4, 2);
    roll.setDiceValue(5, 6);
    expect(roll.score, 100);
    expect(roll.lockedIndexes().length, 1);
  });

  test('Roll 3 times 1', () {
    Roll roll = Roll(diceCount: 6);
    roll.setDiceValue(0, 1);
    roll.setDiceValue(1, 4);
    roll.setDiceValue(2, 6);
    roll.setDiceValue(3, 1);
    roll.setDiceValue(4, 2);
    roll.setDiceValue(5, 1);
    expect(roll.score, 500);
    expect(roll.lockedIndexes().length, 3);
  });

  test('Roll nothing', () {
    Roll roll = Roll(diceCount: 6);
    roll.setDiceValue(0, 2);
    roll.setDiceValue(1, 4);
    roll.setDiceValue(2, 6);
    roll.setDiceValue(3, 2);
    roll.setDiceValue(4, 4);
    roll.setDiceValue(5, 6);
    expect(roll.score, 0);
    expect(roll.lockedIndexes().length, 0);
  });

  test('Roll full hand', () {
    Roll roll = Roll(diceCount: 6);
    roll.setDiceValue(0, 2);
    roll.setDiceValue(1, 2);
    roll.setDiceValue(2, 2);
    roll.setDiceValue(3, 2);
    roll.setDiceValue(4, 2);
    roll.setDiceValue(5, 2);
    expect(roll.score, 2500);
    expect(roll.lockedIndexes().length, 6);
  });

  test('Four dice 50 roll', () {
    Roll roll = Roll(diceCount: 4);
    roll.setDiceValue(0, 2);
    roll.setDiceValue(1, 5);
    roll.setDiceValue(2, 3);
    roll.setDiceValue(3, 2);
    expect(roll.score, 50);
    expect(roll.lockedIndexes().length, 1);
  });

  test('Four dice 100 roll', () {
    Roll roll = Roll(diceCount: 4);
    roll.setDiceValue(0, 1);
    roll.setDiceValue(1, 1);
    roll.setDiceValue(2, 1);
    roll.setDiceValue(3, 2);
    expect(roll.score, 500);
    expect(roll.lockedIndexes().length, 3);
  });

  // six dice with double tripples
  test('Six dice with double tripples', () {
    Roll roll = Roll(diceCount: 6);
    roll.setDiceValue(0, 1);
    roll.setDiceValue(1, 1);
    roll.setDiceValue(2, 1);
    roll.setDiceValue(3, 2);
    roll.setDiceValue(4, 2);
    roll.setDiceValue(5, 2);
    expect(roll.score, 500 + 200);
    expect(roll.lockedIndexes().length, 6);
  });

  // six dice with double quads
  test('Six dice with quad', () {
    Roll roll = Roll(diceCount: 6);
    roll.setDiceValue(0, 1);
    roll.setDiceValue(1, 1);
    roll.setDiceValue(2, 1);
    roll.setDiceValue(3, 1);
    roll.setDiceValue(4, 2);
    roll.setDiceValue(5, 2);
    expect(roll.score, 1000);
    expect(roll.lockedIndexes().length, 4);
  });

  test('Six dices: Quad + two randoms', () {
    Roll roll = Roll(diceCount: 6);
    roll.setDiceValue(0, 1);
    roll.setDiceValue(1, 1);
    roll.setDiceValue(2, 1);
    roll.setDiceValue(3, 1);
    roll.setDiceValue(4, 5);
    roll.setDiceValue(5, 5);
    expect(roll.score, 1100);
    expect(roll.lockedIndexes().length, 6);
  });
}
