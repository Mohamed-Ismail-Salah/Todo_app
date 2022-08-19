import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({
    Key? key,
    required this.colour,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final Color colour;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,


          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}