import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? disabledColor;
  final bool isLoading;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool expanded;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.disabledColor = Colors.grey,
    this.isLoading = false,
    this.height = 52,
    this.borderRadius = 14,
    this.padding,
    this.icon,
    this.expanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: onPressed == null
          ? disabledColor
          : (backgroundColor ?? Colors.redAccent.shade700),
      foregroundColor: textColor,
      elevation: 4,
      shadowColor: Colors.redAccent.shade700.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 24),
    );

    final buttonChild = isLoading
        ? SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: textColor,
      ),
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          icon!,
          SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );


    // Use this color scheme:
    const primaryRed = Colors.red; // MaterialColor with all shades

// Examples:
    primaryRed[700];      // For primary actions (buttons, titles)
    primaryRed[800];      // For important text
    primaryRed[100];      // For light backgrounds
    primaryRed.withOpacity(0.1); // For subtle effects

// Or define theme colors:
    const Color primaryColor = Color(0xFFD32F2F); // red[700]
    const Color primaryDark = Color(0xFFB71C1C);  // red[900]
    const Color primaryLight = Color(0xFFEF5350); // red[400]


    return expanded
        ? SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: buttonStyle,
        child: buttonChild,
      ),
    )
        : SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: buttonStyle,
        child: buttonChild,
      ),
    );
  }
}