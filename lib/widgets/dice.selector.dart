import 'package:flutter/material.dart';

class DiceSelector extends StatelessWidget {
  final Function(int) onDiceSelected;
  final double diceSize = 75;
  final double diceMargin = 10;
  final bool isLocked;
  const DiceSelector(
      {super.key, required this.onDiceSelected, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController();
    return SizedBox(
      width: double.infinity,
      height: diceSize,
      child: RotatedBox(
        quarterTurns: 3,
        child: ListWheelScrollView(
          controller: scrollController,
          physics: isLocked
              ? const NeverScrollableScrollPhysics()
              : const FixedExtentScrollPhysics(),
          itemExtent: diceSize,
          onSelectedItemChanged: (index) {
            onDiceSelected(index + 1);
          },
          children: List.generate(
            6,
            (value) => RotatedBox(
              quarterTurns: 1,
              child: Container(
                margin: EdgeInsets.all(diceMargin),
                width: diceSize - diceMargin,
                height: diceSize - diceMargin,
                color: Colors.amber,
                alignment: Alignment.center,
                child: Text(
                  (value + 1).toString(),
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
