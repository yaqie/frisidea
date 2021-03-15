import 'package:flutter/material.dart';

class ButtonSimpan extends StatelessWidget {
  ButtonSimpan(
      {@required this.color, @required this.press, this.text, this.circle});

  String circle = '';
  String text;
  Color color;
  Function press;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.9,
      buttonColor: color,
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: circle == ''
              ? BorderRadius.circular(8.0)
              : BorderRadius.circular(30.0),
          // side: BorderSide(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            text == null ? "Simpan" : text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: press,
      ),
    );
  }
}
