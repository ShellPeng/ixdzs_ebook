library public;


// Utility
export '../common/screen.dart';
export '../common/styles.dart';
export '../common/toast.dart';
export '../common/utility.dart';
export 'app_color.dart';
export 'api_service.dart';
export 'package:flutter/material.dart';


import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;

class Application {
  static Router router;
}

