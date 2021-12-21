import 'dart:developer' as developer;

import 'package:palestine_connection/palestine_connection.dart';

void main() {
  final PalestineConnection connection = PalestineConnection();
  connection.initialize(
    periodicInSeconds: 3,
    onNotConnected: () {
      developer.log('No Internet');
    },
  ); // 3 seconds
}
