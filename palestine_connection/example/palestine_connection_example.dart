import 'dart:developer' as developer;

import 'package:palestine_connection/palestine_connection.dart';

void main() {
  final PalestineConnection connection = PalestineConnection();
  connection.initialize(
    periodicInSeconds: 3,
    onConnectionLost: () {
      developer.log('No Internet');
    },
    onConnectionRestored: () {
      developer.log('Connection Restored');
    },
  ); // 3 seconds
}
