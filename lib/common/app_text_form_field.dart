import 'package:flutter/material.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/util/ultility.dart';
import 'package:get/get.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    this.label,
    this.isRequired,
  }) : super(
          key: key,
        );

  final Alignment? alignment;
  final double? width;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final String? label;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null ?Row(
          children: [
            space(width: 10),
            Text(
              label ?? "",
              style: TextStyle(color: Colors.white),
            ),
            space(width: 10),
            isRequired == true
                ? Icon(
                    Icons.ac_unit,
                    color: Colors.red,
                    size: 10,
                  )
                : SizedBox()
          ],
        ): SizedBox(),
        //space(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(color: AppColors.mainColor),
              borderRadius: BorderRadius.circular(22)),
          child: alignment != null
              ? Align(
                  alignment: alignment ?? Alignment.center,
                  child: textFormFieldWidget,
                )
              : textFormFieldWidget,
        ),
      ],
    );
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
          controller: controller,
          //focusNode: focusNode ?? FocusNode(),
         // autofocus: autofocus!,
          style: textStyle ?? TextStyle(color: Colors.black),
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );

  InputDecoration get decoration => InputDecoration(
      hintText: hintText ?? ".",
      hintStyle: hintStyle ?? TextStyle(color: Colors.white),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      isDense: true,
      contentPadding: contentPadding ?? EdgeInsets.all(8),
      fillColor: fillColor,
      filled: filled,
      border: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
      enabledBorder: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
      focusedBorder: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ));
}
