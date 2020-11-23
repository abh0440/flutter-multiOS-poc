import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Biometrics extends StatefulWidget {
  Biometrics({Key key}) : super(key: key);

  @override
  _BiometricsState createState() => _BiometricsState();
}

class _BiometricsState extends State<Biometrics> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Can check biometrics: $_canCheckBiometrics\n'),
              RaisedButton(
                child: const Text('Check biometrics'),
                onPressed: _checkBiometrics,
              ),
              Text('Available biometrics: $_availableBiometrics\n'),
              RaisedButton(
                child: const Text('Get available biometrics'),
                onPressed: _getAvailableBiometrics,
              ),
              Text('Current State: $_authorized\n'),
              RaisedButton(
                child: Text(_isAuthenticating ? 'Cancel' : 'Authenticate'),
                onPressed:
                    _isAuthenticating ? _cancelAuthentication : _authenticate,
              )
            ],
          ),
        ),
      ),
    );
  }
}
