import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/colors.dart';

typedef CustomFunc<T> = T Function(T);

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    this.value = "",
    this.suffixIcon,
    this.hideText = false,
    this.controller,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.keyboardType,
    this.inputFormatters,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
  }) : super(key: key);
  final String label;
  final String value;
  final Widget? suffixIcon;
  final bool hideText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    print("Value: ${value}");
    final _ctr = TextEditingController(text: value);
    return TextField(
      obscureText: hideText,
      controller: _ctr,
      decoration: _inputDecoration(
        label: label,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      cursorColor: AppColor.black100,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.label,
    this.suffixIcon,
    this.hideText = false,
    this.controller,
    this.validator,
    this.onSaved,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);
  final String label;
  final Widget? suffixIcon;
  final bool hideText;
  final TextEditingController? controller;
  final CustomFunc<String?>? validator;
  final ValueChanged<String?>? onSaved;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hideText,
      controller: controller,
      keyboardType: keyboardType,
      decoration: _inputDecoration(label: label, suffixIcon: suffixIcon),
      cursorColor: AppColor.black100,
      validator: validator,
      onSaved: onSaved,
      onChanged: onSaved,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}

InputDecoration _inputDecoration({
  required String label,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) =>
    InputDecoration(
        filled: true,
        fillColor: AppColor.white200,
        label: Text(
          label,
          style: const TextStyle(
            color: Color(0XFF808080),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(
          color: AppColor.black100,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 15.0,
        ),
        suffixIcon: suffixIcon,
        prefix: prefixIcon,
        counter: Container()
      // floatingLabelBehavior: FloatingLabelBehavior.auto
    );
