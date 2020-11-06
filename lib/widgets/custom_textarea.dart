import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomCountingTextarea extends StatefulWidget {
  String title;
  CustomCountingTextarea({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _CustomCountingTextStatearea createState() => _CustomCountingTextStatearea();
}

class _CustomCountingTextStatearea extends State<CustomCountingTextarea> {
  int textCount = 0;

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.title),
              Spacer(),
              Text("$textCount/100"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              color: Colors.grey[200],
              child: TextField(
                maxLines: 5,
                controller: _textFieldController,
                onChanged: (value) {
                  List<String> totalWords = value.trim().split(" ");
                  if (_textFieldController.text.isEmpty) {
                    setState(() {
                      textCount = 0;
                    });
                  } else {
                    if (totalWords.length > 100) {
                      totalWords.removeLast();

                      print(totalWords.last);
                      print(totalWords.length);

                      print(totalWords.join(" "));

                      _textFieldController.text = totalWords.join(" ");
                    } else {
                      setState(() {
                        textCount = totalWords.length;
                      });
                    }
                  }
                },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  hintText: "Enter Description here",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
