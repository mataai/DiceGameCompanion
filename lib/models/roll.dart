class Roll {
  final List<int> dices;

  Roll({this.dices = const [-1, -1, -1, -1, -1, -1]});

  List<int> lockedIndexes() {
    List<int> lockedIndexes = [];
    for (var i = 0; i < 6; i++) {
      // is straight
      var setList = dices.toSet();
      if (setList.length == 6) {
        lockedIndexes.addAll(dices);
        break;
      }
      // are tripples, quads or quints
      var values = dices.where((element) => element == i + 1);
      if (values.length == 3 || values.length == 4 || values.length == 5) {
        lockedIndexes.add(i);
      }

      // is 1 or 5
      if (dices[i] == 1 || dices[i] == 5) {
        lockedIndexes.add(i);
      }
    }
    return lockedIndexes.toSet().toList();
  }

  int get score {
    // todo fix 100 before multi entries

    int output = 0;
    for (var i = 0; i < 6; i++) {
      if (dices[i] == 1) {
        output += 100;
      } else if (dices[i] == 5) {
        output += 50;
      }
    }

    // check for 3 entries of the same value
    for (var i = 0; i < 6; i++) {
      var values = dices.where((element) => element == i + 1);
      if (values.length == 3) {
        output += (i + 1) * 100;
      } else if (values.length == 4) {
        output += (i + 1) * 100 * 2;
      } else if (values.length == 5) {
        output += (i + 1) * 100 * 4;
      } else if (values.length == 6) {
        output += (i + 1) * 100 * 8;
      }
    }

    // check for 1-6 straight
    var setList = dices.toSet();
    if (setList.length == 6) {
      output += 2500;
    }

    return output;
  }

  void setDiceValue(int diceIndex, int value) {
    dices[diceIndex] = value;
  }

  void lockRoll() {
    if (dices.contains(-1)) {
      throw Exception("Not all dices are set");
    }
    for (var i = 0; i < 6; i++) {
      // is straight
      var setList = dices.toSet();
      if (setList.length == 6) {
        return;
      }
      // are tripples, quads or quints
      var values = dices.where((element) => element == i + 1);
      if (values.length == 3 || values.length == 4 || values.length == 5) {
        return;
      }

      // is 1 or 5
      if (dices[i] == 1 || dices[i] == 5) {
        return;
      }

      dices[i] = 0;
    }
  }
}
