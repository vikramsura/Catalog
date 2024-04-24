import 'package:digicat/all.dart';
import 'package:digicat/model/productDerails.dart';
import 'package:digicat/screenUi/details/details.dart';
import 'package:digicat/screenUi/sortFilter/controller.dart';
import 'package:vibration/vibration.dart';

class DetailsController extends GetxController {
  final dataSort = Get.put(SortFilterController());
  var context = ApiData.navigatorKey.currentContext!;
  RxInt sumValue = 0.obs;
  RxInt indexNo = 1.obs;
  Rx<int?> indexNoK = Rx<int?>(null);
  Rx<String?> valueK = Rx<String?>(null);
  Rx<String?> valueSize = Rx<String?>(null);
  RxBool onOff = false.obs;
  RxString tapImage = "null".obs;
  RxBool isValue = true.obs;
  var valueNo = 0.obs;

  RxList<int> nameK = [14, 16, 18, 20, 925].obs;
  dataClean() {
    indexNo.value = 1;
    indexNoK.value = null;
    valueK.value = null;
    valueSize.value = null;
    sumValue.value = 0;
    tapImage.value = "null";
    onOff.value = false;
    isValue.value = true;
  }

  ProductDerailsData productDerailsList = ProductDerailsData();

  Future<void> productsDerails(productId, {no}) async {
    isValue.value = true;
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
        url: ApiConstant.productsDetails,
        body: {"product_id": productId.toString()});
    if (response["success"] == true) {
      ProductDerails productDerails = ProductDerails.fromJson(response);
      productDerailsList = productDerails.data!;
      indexNoK.value = int.parse(productDerailsList.metal.toString());
      no == 0 ? Get.to(DetailsPage()) : Get.back();
      Future.delayed(
        const Duration(seconds: 1),
        () {
          dataSort.searchProductsList.clear();
          dataSort.searchController.clear();
        },
      );
      update();
    }
  }

  Future<void> cartAdd() async {
    Vibration.vibrate();
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.cartAdd, body: {
      "product_id": productDerailsList.productsUniId.toString(),
      "quantity": sumValue.value.toString(),
      "matel": valueK.value ?? productDerailsList.metal.toString(),
      "size":
          valueSize.value ?? productDerailsList.ringSize?[1].size.toString(),
    });
    if (response["success"] == true) {
      isValue.value = false;
      update();
    }
  }
}
