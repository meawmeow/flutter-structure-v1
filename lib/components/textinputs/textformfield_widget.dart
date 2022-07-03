import 'package:flutter/material.dart';
import 'package:flutter_structure_v1/utils/input_validator.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Function? validator;
  final String? hintText;
  final String? helpText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? isPassword;
  final bool? enabled;
  final bool? readOnly;
  final Color? borderColor;

  const TextFormFieldWidget(
      {this.controller,
      this.validator,
      this.hintText,
      this.helpText,
      this.prefixIcon,
      this.suffixIcon,
      this.isPassword,
      this.enabled,
      this.readOnly,
      this.borderColor});

  @override
  _TextFormFieldWidget createState() => _TextFormFieldWidget();
}

class _TextFormFieldWidget extends State<TextFormFieldWidget> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (value) => widget.validator!(value),
        controller: widget.controller,
        readOnly: null == widget.readOnly ? false : true,
        obscureText: null == widget.isPassword ? false : isPasswordVisible,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlue,
              width: 1.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 1.0,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey,
              width: 1.0,
            ),
          ),
          hintText: widget.hintText ?? '',
          helperText: widget.helpText ?? '',
          prefixIcon:
              null == widget.prefixIcon ? null : Icon(widget.prefixIcon),
          suffixIcon: null == widget.isPassword
              ? null
              : IconButton(
                  icon: isPasswordVisible
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () =>
                      setState(() => isPasswordVisible = !isPasswordVisible),
                ),
          enabled: null == widget.enabled ? true : false,
        ),
      ),
    );
  }
}
