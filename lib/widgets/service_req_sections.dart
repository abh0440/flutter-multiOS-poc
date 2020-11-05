import 'package:flutter/material.dart';

class ServiceRequestSections extends StatefulWidget {
  ServiceRequestSections({Key key}) : super(key: key);

  @override
  ServiceRequestSectionsState createState() => ServiceRequestSectionsState();
}

class ServiceRequestSectionsState extends State<ServiceRequestSections> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSections(Icons.check_circle_outline, "People"),
          _buildSections(Icons.check_circle_outline, "Location"),
          _buildSections(Icons.check_circle_outline, "Problem"),
          _buildSections(Icons.check_circle_outline, "Details"),
          _buildSections(Icons.check_circle_outline, "Comments"),
        ],
      ),
    );
  }

  Widget _buildSections(IconData iconData, String section) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 15,
            color: Colors.blue,
          ),
          Text(
            section,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
