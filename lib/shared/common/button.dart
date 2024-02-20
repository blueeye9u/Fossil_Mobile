// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fossil_mobile/shared/common/label.dart';

enum IconPosition { beforeText, afterText }

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String buttonText;
  final double btnWidth;
  final double btnHeight;
  final Icon? icon;
  final IconPosition iconPosition;
  final Color color;
  final Color? textColor;
  final Color color_1;
  final Border? border;
  final BorderRadius borderRadius;
  final Offset iconPaddingRight;
  final double? fontSize;
  final bool isLoading; // Add isLoading parameter

  CustomButton({
    super.key,
    required this.onPress,
    required this.buttonText,
    required this.color,
    required this.color_1,
    this.icon,
    this.iconPosition = IconPosition.beforeText,
    this.border,
    BorderRadius? borderRadius,
    Color? textColor,
    Offset? iconPaddingRight,
    this.fontSize = 20.0,
    this.btnWidth = 280.0,
    this.btnHeight = 50.0,
    this.isLoading = false, // Initialize isLoading parameter
  })  : borderRadius = borderRadius ?? BorderRadius.circular(30),
        textColor = textColor ?? Colors.white70,
        iconPaddingRight = iconPaddingRight ?? Offset(8, 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth,
      height: btnHeight,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [color, color_1],
            stops: [0.0, 1.0],
          ),
          borderRadius: borderRadius,
          border: border),
      child: Stack(
        // Use a Stack to overlay the button and progress indicator
        children: [
          Visibility(
            visible: !isLoading, // Show the button if isLoading is false
            child: Center(
              child: TextButton(
                onPressed: isLoading ? null : onPress,
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  fixedSize: const Size(250, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      if (icon != null &&
                          iconPosition == IconPosition.beforeText)
                        Transform.translate(
                          offset: Offset(0, 0),
                          child: icon,
                        ),
                      Label(
                        text: buttonText,
                        fontName: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: fontSize,
                        color: textColor,
                      ),
                      if (icon != null &&
                          iconPosition == IconPosition.afterText)
                        Transform.translate(
                          offset: iconPaddingRight,
                          child: icon,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible:
                isLoading, // Show the progress indicator if isLoading is true
            child: Center(
              child: Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
