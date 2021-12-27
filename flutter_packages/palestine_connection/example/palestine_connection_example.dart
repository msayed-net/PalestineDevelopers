import 'dart:developer' as developer;

import 'package:palestine_connection/palestine_connection.dart';

void main() {
  final PalConnection connection = PalConnection();
  connection.initialize(
    domain: PalDomain.google, // Domain To Test On (optional)
    periodicInSeconds: 3, // 3 seconds
    onConnectionLost: () {
      developer.log('No Internet');
    },
    onConnectionRestored: () {
      developer.log('Connection Restored');
    },
  );
}
