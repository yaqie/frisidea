import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  InputText(
      {@required this.label,
      this.hint,
      @required this.controller,
      this.type,
      this.max,
      this.maxLine,
      this.formatInput,
      this.change});

  final label, hint, controller, type, max, maxLine;
  Function change;
  List<TextInputFormatter> formatInput;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine == null ? null : maxLine,
      maxLength: max == null ? null : max,
      inputFormatters: formatInput == null ? null : formatInput,
      onChanged: change,
      keyboardType: type == null ? TextInputType.text : type,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: '$label',
        hintText: hint == null ? '' : '$hint',
        // labelStyle: GoogleFonts.lato(),
      ),
    );
  }
}
