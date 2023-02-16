import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:migacy_app/resources/app_strings/app_strings.dart';
import 'package:migacy_app/resources/app_themes/app_themes.dart';

import '../../resources/app_constants/app_constants.dart';

class AuthEditText extends StatelessWidget {
  final IconData? icon;
  final String? preFixImage;
  final String? surFixImage;
  final Widget? preWidget;
  final Widget? postWidget;
  final String? label;
  final double? topPadding;
  final String? initialValue;
  final Iterable<String>? autofill;
  final int lines;
  final bool isPassword;

  final Function()? onSurFixPress;

  final double? width;
  final int? maxLength;
  final TextInputType type;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final double? radius;
  final Color? surFixColor;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final String? helperText;

  final List<TextInputFormatter>? format;

  final String? hintText;
  final bool read;
  final TextAlign? align;
  final double? containSize;

  const AuthEditText({super.key,
    this.icon,
    this.read = false,
    this.align,
    this.maxLength,
    this.containSize,
    this.preFixImage,
    this.surFixImage,
    this.preWidget,
    this.topPadding,
    this.surFixColor,
    this.postWidget,
    this.label = '',
    this.type = TextInputType.text,
    this.isPassword = false,
    this.width,
    this.onSurFixPress,
    this.lines: 1,
    this.margin,
    this.padding,
    this.validate,
    this.onSaved,
    this.onTap,
    this.initialValue,
    this.autofill,
    this.radius,
    this.focusNode,
    this.textEditingController,
    this.format,
    this.helperText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width ?? 130,
            height: 40,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              child: TextFormField(
                style: TextStyle(
                    fontSize: containSize,
                    color: AppThemes.lightBlueTextColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppConstants.fontFamily),
                textAlign: align ?? TextAlign.start,
                readOnly: read,
                maxLength: maxLength ?? 50,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: hintText ?? "",
                    counterText: "",
                    hintStyle: TextStyle(
                        fontSize: containSize,
                        color: AppThemes.lightBlueTextColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppConstants.fontFamily),
                    labelStyle: TextStyle(
                        fontSize: containSize,
                        color: AppThemes.lightBlueTextColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppConstants.fontFamily),
                    suffixIcon: surFixImage != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: InkWell(
                                onTap: onSurFixPress,
                                child: Image.asset(
                                  surFixImage!,
                                  color: surFixColor ?? Colors.grey,
                                )),
                          )
                        : null,
                    prefixIcon: preFixImage != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Image.asset(
                              preFixImage!,
                              color: Colors.indigo,
                            ),
                          )
                        : null,
                    contentPadding: const EdgeInsets.only(
                        top: 1.0, bottom: 1.0, left: 5.0)),
                keyboardType: type,
                obscureText: isPassword,
                onChanged: onSaved,
                minLines: isPassword ? null : lines,
                maxLines: isPassword ? 1 : lines + 1,
                validator: validate,
                initialValue: initialValue,
                autofillHints: autofill,
                focusNode: focusNode,
                controller: textEditingController,
                inputFormatters: format,
                onTap: onTap,
              ),
            ),
          ),
          helperText != null
              ? Text(helperText ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 11))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
