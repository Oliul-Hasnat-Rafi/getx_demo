import 'package:get/get.dart';

class fontcontroller extends GetxController {
  RxDouble fontsize = 10.0.obs;
  RxBool notification = false.obs;

  RxList<String> fruitslist = [
    'Apple',
    'Mango',
    'Orange',
    'Strawberry',
    'Avocado',
    'Kiwifruit',
    'Grape',
    'Banana',
    'Cherry'
  ].obs;

  RxList favtfruits = [].obs;

  updatefontsize(RxDouble updatefontsize) {
    fontsize.value = updatefontsize.value;
    print(fontsize.value);
  }

  notificationcontroller(bool value) {
    notification.value = value;
    print(notification.value);
  }
}
