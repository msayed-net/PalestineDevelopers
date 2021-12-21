import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

class PalestineConnection {
  factory PalestineConnection() => _singleton;
  PalestineConnection._internal();
  static final PalestineConnection _singleton = PalestineConnection._internal();

  bool hasConnection = false;
  late Timer timer;

  void initialize({required int periodicInSeconds}) {
    timer = Timer.periodic(Duration(seconds: periodicInSeconds), (Timer timer) {
      checkConnection();
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

    developer.log('--AppConnection-- (state): ${hasConnection ? "Connected" : "Not Connected"}');

    return hasConnection;
  }
}
