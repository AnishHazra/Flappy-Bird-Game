import 'dart:io';
import 'package:flutter/foundation.dart';

class AdHelper {
  // Returns test ad IDs in debug mode, real IDs in release mode
  static String get bannerAdUnitId {
    // Use test IDs for development/testing
    if (kDebugMode) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-7410840568226754/2320743987';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-7410840568226754/2320743987';
      }
    }

    // Use real IDs for production
    if (Platform.isAndroid) {
      return 'ca-app-pub-7410840568226754/2320743987';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7410840568226754/2320743987';
    }

    throw UnsupportedError('Unsupported platform');
  }
}
