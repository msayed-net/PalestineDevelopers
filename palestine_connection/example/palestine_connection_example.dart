import 'package:palestine_connection/palestine_connection.dart';

void main() {
  final PalestineConnection connection = PalestineConnection();
  connection.initialize(periodicInSeconds: 3); // 3 seconds
}
