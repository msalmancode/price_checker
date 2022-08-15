import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String? hint;
  bool? obscure;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final IconData? leadingIcon;

  TextInput(
      {Key? key,
      this.obscure = false,
      this.hint,
      this.controller,
      this.suffixIcon,
      this.leadingIcon})
      : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasError ? Colors.red : Colors.white,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) {
          if (value != '' || value.isNotEmpty) {
            setState(() {
              hasError = false;
            });
          }
        },
        obscureText: widget.obscure!,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hint!,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          icon: widget.leadingIcon != null
              ? Icon(widget.leadingIcon, size: 16)
              : null,
          suffixIcon: widget.suffixIcon != null
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget.obscure = !widget.obscure!;
                    });
                  },
                  child: Icon(
                      widget.obscure!
                          ? widget.suffixIcon
                          : Icons.visibility_off,
                      size: 16),
                )
              : null,
        ),
        style: TextStyle(color: Colors.grey.shade700),
        validator: (value) {
          setState(() {
            hasError = false;
          });
          if (value == null || value.isEmpty) {
            setState(() {
              hasError = true;
            });
            return null;
          }

          return null;
        },
      ),
    );
  }
}
