// import 'package:flutter/material.dart';

// class PrimaryButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final bool isEnabled;
//   final Color color;
//   final double borderRadius;
//   final EdgeInsetsGeometry padding;
//   final TextStyle? textStyle;
//   final IconData? icon; // made nullable so you can skip the icon
//   final bool iconBeforeText; // new flag to control icon placement

//   const PrimaryButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.isEnabled = true,
//     this.color = Colors.blue,
//     this.borderRadius = 10,
//     this.padding = const EdgeInsets.symmetric(vertical: 14),
//     this.textStyle,
//     this.icon,
//     this.iconBeforeText = false, // default: icon after text
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: isEnabled ? onPressed : null,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isEnabled ? color : Colors.grey,
//         padding: padding,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min, 
//         children: [
//           // icon before text
//           if (icon != null && iconBeforeText) ...[
//             Icon(icon, color: Colors.white, size: 22),
//             const SizedBox(width: 8),
//           ],
//           Text(
//             text,
//             style: textStyle ??
//                 const TextStyle(
//                   fontSize: 16,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//           ),
//           // icon after text
//           if (icon != null && !iconBeforeText) ...[
//             const SizedBox(width: 8),
//             Icon(icon, color: Colors.white, size: 22),
//           ],
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final Color color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final IconData? icon;
  final bool iconBeforeText;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.color = Colors.blue,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(vertical: 14 ,horizontal: 24),
    this.textStyle,
    this.icon,
    this.iconBeforeText = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth, // ✅ forces full width
          ),
          child: ElevatedButton(
            clipBehavior: Clip.hardEdge, // ✅ prevents 1px overflow
            onPressed: isEnabled ? onPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isEnabled ? color : Colors.grey,
              padding: padding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Center( // ✅ ensures perfect centering
              child: FittedBox( // ✅ prevents overflow text scaling
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null && iconBeforeText) ...[
                      Icon(icon, color: Colors.white, size: 22),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (icon != null && !iconBeforeText) ...[
                      const SizedBox(width: 8),
                      Icon(icon, color: Colors.white, size: 22),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
