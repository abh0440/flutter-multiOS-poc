import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_os_poc/widgets/add_location.dart';
import 'package:multi_os_poc/widgets/customAppBar.dart';
import 'package:multi_os_poc/widgets/custom_button.dart';
import 'package:multi_os_poc/widgets/custom_dropdown.dart';
import 'package:multi_os_poc/widgets/custom_textarea.dart';
import 'package:multi_os_poc/widgets/service_req_sections.dart';

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
      backgroundColor: Colors.grey[250],
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              snap: false,
              expandedHeight: 125,
              flexibleSpace: CustomAppBar(
                appBarTitle: "New Service Request",
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          ServiceRequestSections(),
                          Card(
                            elevation: 0.0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 10.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Where is the problem?",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: AddLocation(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: CustomDropdown(
                                      title: "Floor",
                                      selectedItem: "02- Second Floor",
                                      dList: <String>[
                                        "02- Second Floor",
                                        "03- Third Floor",
                                        "04- Fourth Floor",
                                        "05- Fifth Floor"
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: CustomDropdown(
                                      title: "Room",
                                      selectedItem: "AM-220",
                                      dList: <String>[
                                        "AM-12",
                                        "AM-323",
                                        "AM-21"
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: CustomCountingTextarea(
                                      title: "Description",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            btnText: "Back",
                            btnColor: Colors.black87,
                            textColor: Colors.white,
                            btnFunction: () {
                              print("Back");
                            },
                          ),
                          CustomButton(
                            btnText: "Next",
                            btnColor: Color(0xff0f61fd),
                            textColor: Colors.white,
                            btnFunction: () {
                              print("Next");
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
