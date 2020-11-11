import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool clearSearch = false;

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
        color: Colors.white,
      ),
      height: 40.0,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              controller: _searchController,
              onTap: () {
                setState(() {
                  clearSearch = true;
                });
              },
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: "Search for requests",
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          clearSearch
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    _searchController.text = "";
                    setState(() {
                      clearSearch = false;
                    });
                  },
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
