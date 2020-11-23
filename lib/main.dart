import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_os_poc/widgets/add_location.dart';
import 'package:multi_os_poc/widgets/customAppBar.dart';
import 'package:multi_os_poc/widgets/custom_button.dart';
import 'package:multi_os_poc/widgets/custom_dropdown.dart';
import 'package:multi_os_poc/widgets/custom_textarea.dart';
import 'package:multi_os_poc/widgets/request_cards.dart';
import 'package:multi_os_poc/widgets/request_topics.dart';
import 'package:multi_os_poc/widgets/search_bar.dart';
import 'package:multi_os_poc/widgets/service_req_sections.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/auth_strings.dart';

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
      home:
          // Biometrics(),
          MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  AndroidAuthMessages androidAuthMessages = const AndroidAuthMessages(
      cancelButton: "Dismiss", signInTitle: "this is a message");

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: "Touch your fingerprint scanner to authenticate",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _authorized = authenticated ? 'Authorized' : 'Not Authorized';
    });

    if (authenticated) {
      print("user is authenticated");
    }
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

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
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SearchBar(),
                          ),
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
                                    child: RequestTopics(
                                      bgColor: Colors.green,
                                      iconColor: Colors.white,
                                      iconData: Icons.local_shipping,
                                      topicName: "Product Request",
                                      onPressed: () {
                                        print("icon button");
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: AddLocation(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: RequestCard(
                                      grid: false,
                                      displayIcon: "assets/enterprise.png",
                                      reqId: "1234564",
                                      reqName: "Buidling interior",
                                      status: true,
                                      type: "General Repairs",
                                    ),
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
                            btnText: "Login",
                            btnColor: Color(0xff0f61fd),
                            textColor: Colors.white,
                            btnFunction: () {
                              print("Login");
                              _openModal("touch");
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

  void _openModal(String type) {
    switch (type) {
      case "touch":
        _buildModal(
          Icons.fingerprint,
          "Place Your Finger for Login Setup",
          "Lift and rest the edge of your finger\non the Home button repeatedly.",
          () {
            Navigator.pop(context);
            _isAuthenticating ? _cancelAuthentication() : _authenticate();
            // _openModal("face");
          },
          false,
        );
        break;
      case "face":
        _buildModal(
          Icons.face,
          "Face ID Login Setup",
          "You can use facial recognition to log\n into your account instead of your password.",
          () {
            Navigator.pop(context);
            // Navigator.of(context).pushReplacement(
            //   new MaterialPageRoute(
            //     builder: (context) => HomeScreen(),
            //   ),
            // );
          },
          true,
        );
        break;
      default:
    }
  }

  void _buildModal(IconData iconData, String label, String subLabel,
      Function onClick, bool hasActions) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white10,
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1.5,
            sigmaY: 1.5,
          ),
          child: Container(
            height: 275,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.teal,
                  Colors.blue,
                  Colors.amber,
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75.0),
                topRight: Radius.circular(75.0),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: onClick,
                    child: Icon(
                      iconData,
                      size: 100.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subLabel,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  hasActions
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("Enter password");
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Enter Password",
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("Cancel");
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
