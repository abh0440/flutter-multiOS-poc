import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarTitle;

  const CustomAppBar({Key key, this.appBarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/black.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  appBarTitle,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: Image.asset(
                      "assets/settings.png",
                      width: 25.0,
                      height: 25.0,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
