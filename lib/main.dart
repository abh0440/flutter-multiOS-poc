import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'My Requests'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              floating: false,
              pinned: true,
              snap: false,
              expandedHeight: 125,
              flexibleSpace: Stack(
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
                            "My Requests",
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
              )),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, i) {
              return ListTile(title: Text("Item $i"));
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}
