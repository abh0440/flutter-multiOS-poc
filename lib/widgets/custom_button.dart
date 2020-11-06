import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String btnText;
  Color btnColor;
  Color textColor;
  Function btnFunction;

  CustomButton({
    Key key,
    this.btnText,
    this.btnColor,
    this.textColor,
    this.btnFunction,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: widget.btnColor,
      child: MaterialButton(
        onPressed: widget.btnFunction,
        child: Container(
          width: MediaQuery.of(context).size.width / 2.85,
          child: Text(
            widget.btnText,
            style: TextStyle(
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
