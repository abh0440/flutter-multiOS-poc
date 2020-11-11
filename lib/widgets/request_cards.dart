import 'package:flutter/material.dart';

class RequestCard extends StatefulWidget {
  final bool status;
  final String displayIcon;
  final String reqId;
  final String reqName;
  final String type;
  final bool grid;

  RequestCard(
      {Key key,
      this.status,
      this.displayIcon,
      this.reqId,
      this.reqName,
      this.type,
      this.grid})
      : super(key: key);

  @override
  _RequestCardState createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    return widget.grid
        ? Card(
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: widget.status
                              ? Image.asset('assets/complete.png')
                              : Image.asset('assets/closed.png'),
                        ),
                        Text(
                          widget.status ? "Completed" : "Closed",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.star,
                          size: 20.0,
                          color: Colors.orange,
                        )
                      ],
                    ),
                    Image.asset(
                      widget.displayIcon,
                      color: Color(0xff0f61fd),
                    ),
                    Text(
                      "ID: " + widget.reqId,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.reqName,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.type,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Image.asset(
                                widget.displayIcon,
                                color: Color(0xff0f61fd),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ID: " + widget.reqId,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  widget.reqName,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  widget.type,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.star,
                          size: 20.0,
                          color: Colors.orange,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5.0),
                              child: widget.status
                                  ? Image.asset('assets/complete.png')
                                  : Image.asset('assets/closed.png'),
                            ),
                            Text(
                              widget.status ? "Completed" : "Closed",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
