import 'package:maps_launcher/maps_launcher.dart';

class MapsService {
  launch(double lat, double long) async {
    await MapsLauncher.launchCoordinates(lat, long);
  }
}
