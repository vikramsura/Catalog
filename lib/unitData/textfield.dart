import 'dart:async';

import 'package:digicat/all.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

Widget buildTextField(context,
    {controllerData,
    color,
    String? Function(String?)? validator,
    top,
    colorBorder,
    borderRadius,
    keyboardType,
    obscureText,
    hintText,
    suffixIcon,
    maxLines,
    textColor,
    hintColor,
    labelText,
    focusNode,
    prefixIcon,
    maxLength,
    prefix,
    readOnly,
    Function(String)? onChanged}) {
  return Padding(
    padding: EdgeInsets.only(top: top ?? 20.h),
    child: TextFormField(
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      focusNode: focusNode,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      maxLines: maxLines ?? 1,
      // minLines: 1,
      // textCapitalization: keyboardType == TextInputType.number
      //     ? TextCapitalization.none
      //     : TextCapitalization.sentences,
      maxLength: maxLength ?? 200,
      textAlignVertical: suffixIcon != null || prefixIcon != null
          ? TextAlignVertical.center
          : null,
      validator: validator,
      style: TextStyle(color: textColor ?? AppTextColor.black),
      keyboardType: keyboardType ?? TextInputType.multiline,
      textInputAction:
          hintText == "Enter Shop Address" || labelText == "Enter Shop Address"
              ? TextInputAction.newline
              : TextInputAction.next,
      controller: controllerData,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          isDense: false,
          filled: true,
          errorMaxLines: 2,
          contentPadding:
              EdgeInsets.only(left: 20.w, right: 10.w, top: 4.h, bottom: 4.h),
          counterText: "",
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefix: prefix,
          hintStyle: TextStyle(color: hintColor ?? AppTextColor.grey),
          hintText: hintText,
          labelText: labelText,
          fillColor: color ?? AppBodyColor.yellow,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder ?? AppBodyColor.yellow),
              borderRadius: BorderRadius.circular(borderRadius ?? 28.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder ?? AppBodyColor.yellow),
              borderRadius: BorderRadius.circular(borderRadius ?? 28.r)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder ?? AppBodyColor.yellow),
              borderRadius: BorderRadius.circular(borderRadius ?? 28.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder ?? AppBodyColor.yellow),
              borderRadius: BorderRadius.circular(borderRadius ?? 28.r))),
    ),
  );
}

Widget buildIntlPhoneField(context,
    {controllerData,
    void Function(Country)? onCoChanged,
    FutureOr<String?> Function(PhoneNumber?)? validator,
    color,
    top,
    colorBorder,
    borderRadius,
    keyboardType,
    obscureText,
    hintText,
    suffixIcon,
    textColor,
    hintColor,
    labelText,
    focusNode,
    prefixIcon,
    prefix,
    readOnly,
    enabled,
    initialCountryCode,
    void Function(PhoneNumber)? onChanged}) {
  return Padding(
    padding: EdgeInsets.only(top: top ?? 20.h),
    child: IntlPhoneField(
      enabled: enabled ?? true,
      autofocus: false,
      onCountryChanged: onCoChanged,
      validator: validator,
      initialCountryCode: initialCountryCode ?? 'IN',
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      focusNode: focusNode,
      textAlignVertical: suffixIcon != null || prefixIcon != null
          ? TextAlignVertical.center
          : null,
      style: TextStyle(color: textColor ?? AppTextColor.black),
      keyboardType: keyboardType ?? TextInputType.multiline,
      textInputAction: TextInputAction.next,
      controller: controllerData,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          isDense: false,
          filled: true,
          errorMaxLines: 2,
          contentPadding:
              EdgeInsets.only(left: 20.w, right: 10.w, top: 4.h, bottom: 4.h),
          counterText: "",
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefix: prefix,
          hintStyle: TextStyle(color: hintColor ?? AppTextColor.grey),
          hintText: hintText,
          labelText: labelText,
          fillColor: color ?? AppBodyColor.yellow,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder ?? AppBodyColor.yellow),
              borderRadius: BorderRadius.circular(borderRadius ?? 28.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder ?? AppBodyColor.yellow),
              borderRadius: BorderRadius.circular(borderRadius ?? 28.r)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder ?? AppBodyColor.yellow),
              borderRadius: BorderRadius.circular(borderRadius ?? 28.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder ?? AppBodyColor.yellow),
              borderRadius: BorderRadius.circular(borderRadius ?? 28.r))),
    ),
  );
}
