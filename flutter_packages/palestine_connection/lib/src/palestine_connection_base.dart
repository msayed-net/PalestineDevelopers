import 'dart:async';
import 'dart:developer' as developer;
import 'dart:html';
import 'dart:io';

class PalConnection {
  factory PalConnection() => _singleton;
  PalConnection._internal() {
    developer.log('--PalConnection-- (Instance Created --> Singleton)');
  }
  static final PalConnection _singleton = PalConnection._internal();

  /// Connection check variable
  bool hasConnection = false;

  /// Timer object
  late Timer timer;

  ///---
  /// initialize package
  ///---
  /// Start periodic process to check connection..
  void initialize({
    String domain = PalDomain.random,
    required int periodicInSeconds,
    required VoidCallback onConnectionLost,
    required VoidCallback onConnectionRestored,
  }) {
    bool notifyConnectionRestore = false;
    bool notifyConnectionLost = true;

    timer = Timer.periodic(Duration(seconds: periodicInSeconds),
        (Timer timer) async {
      if (domain == PalDomain.random) {
        final List<String> _domainsList = <String>[
          PalDomain.google,
          PalDomain.github,
          PalDomain.yahoo,
          PalDomain.facebook,
          PalDomain.microsoft,
          PalDomain.youtube,
          PalDomain.twitter,
          PalDomain.wikipedia,
          PalDomain.instagram,
        ];
        domain = (_domainsList..shuffle()).first;
      }
      final bool state = await checkConnection(domain);

      if (!state && notifyConnectionLost) {
        notifyConnectionRestore = true;
        notifyConnectionLost = false;
        onConnectionLost();
      }

      if (state && notifyConnectionRestore) {
        notifyConnectionRestore = false;
        notifyConnectionLost = true;
        onConnectionRestored();
      }
    });
  }

  /// Stop the process..
  void dispose() {
    timer.cancel();
  }

  ///---
  /// Connection Check
  ///---
  /// Should not be invoked directly
  Future<bool> checkConnection(String domain) async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup(domain);

      hasConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      hasConnection = false;
    }

    return hasConnection;
  }
}

class PalDomain {
  static const String random = 'random';
  static const String google = 'google.com';
  static const String github = 'github.com';
  static const String yahoo = 'yahoo.com';
  static const String facebook = 'facebook.com';
  static const String microsoft = 'microsoft.com';
  static const String youtube = 'youtube.com';
  static const String twitter = 'twitter.com';
  static const String wikipedia = 'wikipedia.com';
  static const String instagram = 'instagram.com';

  /// CHINA
  static const String baidu = 'baidu.com';
}
