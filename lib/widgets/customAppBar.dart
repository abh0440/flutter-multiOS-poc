import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String appBarTitle;
  Function isListSelected;

  bool isList = true;

  CustomAppBar({Key key, this.appBarTitle, this.isListSelected})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  bool viewVal() {
    return isList;
  }
}

class _CustomAppBarState extends State<CustomAppBar> {
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
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: Text(
                  widget.appBarTitle,
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
                    onPressed: () {
                      _customizeView(context);
                    },
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Image.asset(
                      "assets/notification.png",
                      width: 25.0,
                      height: 25.0,
                    ),
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

  void _customizeView(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => new Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width / 5,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Please select the view",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("List View");
                  setState(() {
                    widget.isList = true;
                  });
                  Navigator.of(context).pop();
                },
                child:
                    _buildItems("assets/list.png", "List View", widget.isList),
              ),
              GestureDetector(
                onTap: () {
                  print("Grid View");
                  setState(() {
                    widget.isList = false;
                  });
                  Navigator.of(context).pop();
                },
                child:
                    _buildItems("assets/grid.png", "Grid View", !widget.isList),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItems(String imageAsset, String text, bool status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            imageAsset,
            width: 40.0,
            height: 40.0,
            color: status ? Color(0xff0f61fd) : Colors.grey[500],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              color: status ? Color(0xff0f61fd) : Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }
}
