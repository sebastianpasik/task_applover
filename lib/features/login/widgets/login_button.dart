import 'package:flutter/material.dart';
import 'package:task_applover/utilities/appl_colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double height;
  final double width;
  final Color textColor;
  final BorderRadiusGeometry? borderRadius;

  const LoginButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.height = 50,
    this.width = double.infinity,
    this.textColor = Colors.white,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(ApplColor.appLoverGreen),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.pressed) ? textColor.withAlpha(128) : null,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              side: const BorderSide(color: ApplColor.appLoverGreen),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
