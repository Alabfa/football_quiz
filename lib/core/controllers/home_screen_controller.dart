import 'package:football_quiz/view/change_lang_screen.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController extends GetxController {
  onChangeLangPressed() {
    Get.to(() => ChangeLangScreen());
  }

  onDevNamePressed() async {
    String url = 'https://www.instagram.com/alabfa/';
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
