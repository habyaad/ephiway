import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(
      {Key? key,
      required this.buttonText,
      required this.icon,
      required this.onPressed,
      required this.backgroundColor})
      : super(key: key);

  final String buttonText;
  final IconData icon;
  final void Function() onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.all(16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(buttonText,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          Icon(icon),
        ],
      ),
    );
  }
}
