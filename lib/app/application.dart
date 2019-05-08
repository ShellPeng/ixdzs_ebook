library public;


// Utility
export '../common/screen.dart';
export '../common/styles.dart';
export '../common/toast.dart';

import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;

class Application {
  static Router router;
}

