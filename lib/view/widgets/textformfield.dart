import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final IconData icon;
  final String hint;
  bool isPass;
  TextEditingController controller;
  bool suffixWidget;
  String? Function(String?)? validator;

  CustomTextFormField({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.hint,
    required this.validator,
    this.isPass = false,
    this.suffixWidget = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            obscureText: widget.isPass,
            // cursorColor: Colors.teal,
            decoration: InputDecoration(
              focusedBorder:
                  const UnderlineInputBorder(borderSide: BorderSide(width: 2)),
              border:
                  const UnderlineInputBorder(borderSide: BorderSide(width: 2)),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide(width: 1)),

              ///
              prefixIcon: Icon(
                widget.icon,
              ),
              suffixIcon: widget.suffixWidget
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isPass = !widget.isPass;
                        });
                      },
                      child: Icon(widget.isPass
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined))
                  : null,
              hintText: widget.hint,
            ),
          ),
        )
      ],
    );
  }
}
