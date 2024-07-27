import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_dashbord/controllers/suplayerController.dart';
import 'package:store_dashbord/model/invoice_data.dart';
import 'package:store_dashbord/service/incoiceService.dart';

class invoiceController extends GetxController {
  final _invoiceLIst = <InvoiceData>[].obs;
  List<InvoiceData> get invoices => _invoiceLIst;
  suplayerController ss = Get.put(suplayerController());

  var loading = F.obs;
  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      loading(T);
      var data = await InvoiceService().getInvoice();
      if (data != null) {
        _invoiceLIst.value = data;
      }
    } finally {
      loading(F);
    }
  }

  @override
  void refresh() async {
    loading(T);
    fetchProduct();
  }
}
