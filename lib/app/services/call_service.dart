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
}
