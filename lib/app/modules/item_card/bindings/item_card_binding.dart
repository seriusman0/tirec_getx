import 'package:get/get.dart';

import '../controllers/item_card_controller.dart';

class ItemCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemCardController>(
      () => ItemCardController(),
    );
  }
}
