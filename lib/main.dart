import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'amplifyconfiguration.dart';
// MIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHkwdwIBAQQgwP0J7vYD/zBdU8RRZa1R0epIrWzxb1LAPM51h1DbgqegCgYIKoZIzj0DAQehRANCAATwPm2iMGmuoLVl4T7xmLbA5MMsRRh5t8r7pBm8wGqTyJBCVlbmud3+RUQ6rsvKm/Sb4wKq/StNLBkn6MDBzu6r

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      print('Successfully configured');
    } on Exception catch (e) {
      print('Error configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(children: const [
                Text('You are logged in!!!'),
                SignOutButton(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
