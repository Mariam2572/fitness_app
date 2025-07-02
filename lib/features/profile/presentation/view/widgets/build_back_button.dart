import 'package:flutter/material.dart';

class BuildBackButton extends StatelessWidget {
  const BuildBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image(image: AssetImage("assets/images/Back.png")),
          ),
        ),
      ),
    );
  }
}
