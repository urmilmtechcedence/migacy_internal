import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Color textColor, iconColor;
  final Function() press;
  final bool disabled;
  final bool colors;
  final String? icon;
  final int color;
  final double? containWidth;

  const AuthButton({
    Key? key,
    required this.text,
    this.colors = true,
    this.icon,
    this.containWidth,
    this.iconColor = Colors.grey,
    this.color = 0xffFFFFFF,
    this.textColor = Colors.white,
    required this.press,
    this.disabled: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: containWidth ?? 138,
        height: 56,
        decoration: colors
            ? BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(35),)
            : BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xff202A39),
                )),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colors ? textColor : const Color(0xff202A39),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
                if (icon != null) ...[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Image.asset(
                      icon!,
                      color: iconColor,
                      height: 20,
                      width: 20,
                    ),
                  )
                ] else ...[
                  const SizedBox.shrink()
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
