import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final Color color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
   final IconData icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.color = Colors.blue,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
    this.textStyle,
    this.icon = Icons.arrow_right_alt,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? color : Colors.grey,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // center both text and icon
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: textStyle ??
                const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(width: 8),
          Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
        ],
      ),
    );
  }
}
