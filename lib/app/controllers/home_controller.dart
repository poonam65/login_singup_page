import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  // Observable user info
  RxString userName = "Poonam".obs;

  // SOS state
  RxBool isSendingSOS = false.obs;
  RxBool isAlertActive = false.obs;

  // Recent alerts for badge
  RxList<String> recentAlerts = <String>[].obs;

  // Trigger SOS

  void triggerSOS() async {
    if (isSendingSOS.value) return;

    isSendingSOS.value = true;
    isAlertActive.value = true;

    // Example: send SMS to emergency contact
    const emergencyNumber = '1234567890';
    final smsUri = Uri.parse('sms:$emergencyNumber?body=I am in emergency. Please help!');

    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    }

    // Add to alerts list
    recentAlerts.add("SOS sent at ${DateTime.now().hour}:${DateTime.now().minute}");

    isSendingSOS.value = false;
  }



  Future<void> shareLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  }

}
