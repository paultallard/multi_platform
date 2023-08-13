// added per Medium article
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// added later in the process
import 'platform_helper.dart' if (dart.library.html) './web_platform.dart' if (dart.library.io) './other_platform.dart';

abstract class CustomPlatform{
  // added later in the process
  factory CustomPlatform() => getInstance();
  Future<void> displayAlert(BuildContext context,String message);
}