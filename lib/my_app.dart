import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
// import 'dart:js' as js; // removed later in Medium article
import 'package:flutter/services.dart';
// added later in the article
import 'custom_platform.dart';

/// See https://medium.com/@ajay.kamble119/adding-conditional-imports-in-flutter-for-cross-platform-development-5d7b6bff689c
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

/// Multi-platform requires different imports and handling of system features
/// like Alerts.  The following is a naive implementation.  It is replaced
/// by the other files in this folder which handle alerts for each platform
class _MyAppState extends State<MyApp> {

  // Removed later in the Medium article
  // displayAlert(String message) async {
  //   if (!kIsWeb) {
  //     switch (defaultTargetPlatform) {
  //       case TargetPlatform.iOS:
  //         showDialog(
  //           context: context,
  //           builder: (_) => CupertinoAlertDialog(
  //             content: Text(message),
  //           ),
  //         );
  //         break;
  //       case TargetPlatform.windows:
  //         const methodChannel = MethodChannel('dev.fluttercrew');
  //         await methodChannel.invokeMethod("displayAlert", {"message": message});
  //         break;
  //       case TargetPlatform.android:
  //         showDialog(
  //           context: context,
  //           builder: (_) => AlertDialog(
  //             content: Text(message),
  //           ),
  //         );
  //         break;
  //       default:
  //         break;
  //     }
  //   } else {
  //     js.context.callMethod("displayAlert", [message]); // Comment out for non-web targets
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FilledButton(
              onPressed: () {
                // displayAlert("This is sample alert");
                CustomPlatform().displayAlert(context,"This is sample alert");
              },
              child: const Text("Show Alert"),
            ),
          ),
        ],
      ),
    );
  }
}
