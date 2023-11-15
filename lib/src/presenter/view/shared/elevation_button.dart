import 'package:flutter/material.dart';

class ElevationButton extends StatelessWidget {
  final Function()? onPressed;
  final String child;
  const ElevationButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 8,
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 130,
          vertical: 15,
        ),
      ),
      onPressed: onPressed,
      child: Text(child),
    );
  }
}
