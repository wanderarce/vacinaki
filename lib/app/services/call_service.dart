import 'package:url_launcher/url_launcher.dart';

class CallService {
  Future openTel(String phone) async {
    final Uri telLaunchUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (!await launchUrl(telLaunchUri)) {
      throw 'Could not launch $telLaunchUri';
    }
  }

  Future launchMapsUrl(double lat, double lon) async {
    final Uri uri = Uri(
      scheme: 'geo',
      path: 'https://www.google.com/maps/search/?api=1&query=$lat,$lon',
    );
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }
}
