import 'package:dice_game_companion/widgets/button.dart';
import 'package:dice_game_companion/widgets/text.input.dart';
import 'package:flutter/material.dart';

class AddPlayerDialog extends StatelessWidget {
  const AddPlayerDialog({super.key});
  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    String _playerName = "";

    _onChanged(value) {
      _playerName = value;
    }

    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 26, right: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "What's the new player's name?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3.5,
              ),
              TextInput(onChanged: _onChanged),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SimpleButton(
                    text: "Cancel",
                    onPressed: () => Navigator.pop(context, ""),
                    invertedColors: true,
                  ),
                  SimpleButton(
                    text: "  Add  ",
                    isDisabled: false,
                    onPressed: () => Navigator.pop(context, _playerName),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
