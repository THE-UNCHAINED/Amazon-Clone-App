import 'package:amazon_clone/utils/color_themes.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String tittle;
  final TextEditingController controller;
  final bool obsecureText;
  final String hintText;

  const TextFieldWidget(
      {Key? key,
      required this.tittle,
      required this.controller,
      required this.obsecureText,
      required this.hintText})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.tittle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          maxLines: 1,
          obscureText: widget.obsecureText,
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: yellowColor, width: 1))),
        )
      ],
    );
  }
}
