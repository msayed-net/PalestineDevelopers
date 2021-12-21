import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

class PalestineConnection {
  factory PalestineConnection() => _singleton;
  PalestineConnection._internal() {
    developer.log('--PalestineConnection-- (Instance Created --> Singleton)');
  }
  static final PalestineConnection _singleton = PalestineConnection._internal();

  bool hasConnection = false;
  late Timer timer;

  void initialize({
    required int periodicInSeconds,
    required onConnectionLost,
    required onConnectionRestored,
  }) {
    bool notifyConnectionRestore = false;
    bool notifyConnectionLost = true;

    timer = Timer.periodic(Duration(seconds: periodicInSeconds), (Timer timer) async {
      final bool state = await checkConnection();

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

  void dispose() {
    timer.cancel();
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');

      hasConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      hasConnection = false;
    }

    return hasConnection;
  }
}
