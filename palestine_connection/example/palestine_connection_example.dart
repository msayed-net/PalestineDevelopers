import 'dart:developer' as developer;

import 'package:palestine_connection/palestine_connection.dart';

void main() {
  final PalestineConnection connection = PalestineConnection();
  connection.initialize(
    domain: PalestineConnectionDomain.google, // Domain To Test On (optional)
    periodicInSeconds: 3, // 3 seconds
    onConnectionLost: () {
      developer.log('No Internet');
    },
    onConnectionRestored: () {
      developer.log('Connection Restored');
    },
  );
}
