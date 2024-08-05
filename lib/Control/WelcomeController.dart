import 'package:get/get.dart';

class WelcomeController extends GetxController {
  int selecte = 0;

  void selected(int v) {
    selecte = v;
    update();
  }

}
