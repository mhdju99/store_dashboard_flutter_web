import 'package:get/get.dart';
import 'package:store_dashbord/controllers/brandController..dart';
import 'package:store_dashbord/controllers/categoryController.dart';
import 'package:store_dashbord/controllers/inventoryController.dart';
import 'package:store_dashbord/controllers/productController.dart';
import 'package:store_dashbord/controllers/suplayerController.dart';

class injection {
 static void init() {
    Get.lazyPut(()=>inventoryController());
    Get.lazyPut(()=> BrandController());
    Get.lazyPut(()=> categoryController());
    Get.lazyPut(()=> ProductController());
    Get.lazyPut(()=> suplayerController());

    
  }
  
}