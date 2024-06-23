import 'package:get/get.dart';
import 'package:phonechakra/controller/searchs.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchsController());
  }
}
