import 'package:digicat/all.dart';
import 'package:digicat/model/solitaireModel.dart';

class SolitaireController extends GetxController {
  RxList<SolitaireModelData> solitaireList = <SolitaireModelData>[].obs;
  var context = ApiData.navigatorKey.currentContext!;

  Future<void> solitaire() async {
    solitaireList.clear();
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
        url: ApiConstant.solitaire,
        body: {"category": UserData.userSubCategoriesId.toString()});
    if (response["success"] == true) {
      SolitaireModel solitaireModel = SolitaireModel.fromJson(response);
      solitaireList.addAll(solitaireModel.data!);
      Get.toNamed("SolitairePage");
    }
  }
}
