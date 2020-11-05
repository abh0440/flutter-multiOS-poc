import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  String selectedItem;
  List<String> dList;

  CustomDropdown({Key key, this.title, this.selectedItem, this.dList})
      : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isDropdownOpened = false;
  GlobalKey actionKey;
  double height, width, xPosition, yPosition;
  OverlayEntry floatingDropdown;

  @override
  void initState() {
    super.initState();
    actionKey = LabeledGlobalKey(widget.selectedItem);
  }

  void findDropdownData() {
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    print(" $height, $width, $xPosition, $yPosition ");
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          left: xPosition,
          width: width,
          top: yPosition + height,
          child: Card(
            elevation: 5,
            child: Container(
              child: Column(
                children: buildDropdownItemList(
                    itemList: widget.dList,
                    itemHeight: height,
                    itemWidth: width),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GestureDetector(
              key: actionKey,
              onTap: () {
                setState(() {
                  if (isDropdownOpened) {
                    floatingDropdown.remove();
                  } else {
                    findDropdownData();
                    floatingDropdown = _createFloatingDropdown();
                    Overlay.of(context).insert(floatingDropdown);
                  }
                  isDropdownOpened = !isDropdownOpened;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: Colors.grey,
                  )),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Text(widget.selectedItem),
                    Spacer(),
                    Icon(isDropdownOpened
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildDropdownItemList(
      {List<String> itemList, double itemHeight, double itemWidth}) {
    List<Widget> itemWidgetList = new List();
    itemList.forEach(
      (element) {
        //building individual item widget and adding it to the items widget list
        itemWidgetList.add(
          GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedItem = element;
                floatingDropdown.remove();
                isDropdownOpened = !isDropdownOpened;
              });
            },
            child: new Container(
              height: itemHeight,
              width: itemWidth,
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: itemHeight - 0.25,
                    padding: EdgeInsets.only(left: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      element,
                    ),
                  ),
                  Container(
                    height: 0.25,
                    width: itemWidth,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    return itemWidgetList;
  }
}
