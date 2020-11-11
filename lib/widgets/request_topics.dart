import 'package:flutter/material.dart';

class RequestTopics extends StatelessWidget {
  Color bgColor;
  Color iconColor;
  IconData iconData;
  String topicName;
  Function onPressed;

  RequestTopics(
      {Key key,
      this.bgColor,
      this.iconColor,
      this.iconData,
      this.topicName,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            radius: 30.0,
            child: Center(
              child: IconButton(
                icon: Icon(iconData),
                color: iconColor,
                onPressed: onPressed,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(topicName),
          )
        ],
      ),
    );
  }
}
