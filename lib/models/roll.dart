class Roll {
  final List<int> dices = [];

  final int diceCount;
  Roll({required this.diceCount}) {
    for (var i = 0; i < diceCount; i++) {
      dices.add(-1);
    }
  }

  List<int> lockedIndexes() {
    Set<int> diceSet = dices.toSet();
    // if all dices are different, lock all (straight)
    if (diceSet.length == 6) {
      return diceSet.toList();
    }
    List<int> lockedIndexes = [];
    // if all dices are the same, lock all (quint)
    if (diceSet.length == 1) {
      lockedIndexes.addAll([0, 1, 2, 3, 4, 5]);
    }

    for (var diceIndex = 0; diceIndex < diceCount; diceIndex++) {
      if (lockedIndexes.contains(diceIndex)) continue;

      var values = dices.where((diceValue) => diceValue == dices[diceIndex]);
      // are tripples, quads or quints
      if (values.length == 3 || values.length == 4 || values.length == 5) {
        lockedIndexes.add(diceIndex);
        // else are singles or doubles
      } else if (values.isNotEmpty &&
          (dices[diceIndex] == 1 || dices[diceIndex] == 5)) {
        lockedIndexes.add(diceIndex);
      }
    }
    return lockedIndexes.toSet().toList();
  }

  int get score {
    // todo fix 100 before multi entries
    int output = 0;
    // check for 1-6 straight
    var setList = dices.toSet();
    if (setList.length == 6) {
      output += 2500;
      return output;
    }

    // check for multiple entries of the same value
    for (var diceValue = 1; diceValue <= 6; diceValue++) {
      int pointValue = diceValue;
      if (pointValue == 1) pointValue = 100;
      if (pointValue == 5) pointValue = 50;
      var dicesWithValueI = dices.where((element) => element == diceValue);

      // One or Two dices with value 1 or 5
      if ((diceValue == 1 || diceValue == 5) && dicesWithValueI.length < 3) {
        output += pointValue * dicesWithValueI.length;
      }

      // Tripple
      if (diceCount >= 3 && dicesWithValueI.length >= 3) {
        if (pointValue == 100) {
          output += 500;
        } else {
          output += pointValue * 100;
        }
      }
      // Quad
      if (diceCount >= 4 && dicesWithValueI.length >= 4) {
        output *= 2;
      }
      // Quint
      if (diceCount >= 5 && dicesWithValueI.length >= 5) {
        output *= 2;
      }

      // no need to check for sextuplet because
      // it is already checked in the straight check
    }

    return output;
  }

  void setDiceValue(int diceIndex, int value) {
    if (diceIndex + 1 > diceCount) {
      throw Exception("Dice index larger than permitted dice count");
    }
    dices[diceIndex] = value;
  }

  bool canReroll() {
    return score <= 0;
  }
}
