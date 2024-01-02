import 'package:flutter/material.dart';

class CustomIconBtn extends StatelessWidget {
  final Color? color;
  final Function onPressed;
  final Widget icon;
  const CustomIconBtn({
    super.key,
    this.color,
   required this.onPressed,
   required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        onPressed: () => onPressed(),
        icon: icon,
      ),
    );
  }
}
