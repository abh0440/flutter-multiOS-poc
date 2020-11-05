import 'package:flutter/material.dart';

class AddLocation extends StatelessWidget {
  const AddLocation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[350],
            ),
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.location_on,
              size: 35,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Add Location"),
          )
        ],
      ),
    );
  }
}
