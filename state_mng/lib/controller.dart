import 'package:get/get.dart';
import 'package:state_mng/model.dart';

class AppData extends GetxController {
  var contact = [].obs;
  addContact(ModelOfAppData modelOfAppData) async {
    contact.add(modelOfAppData);
    // Get.back();
  }

  removeContact(ModelOfAppData modelOfAppData) {
    contact.remove(modelOfAppData);
  }
}
