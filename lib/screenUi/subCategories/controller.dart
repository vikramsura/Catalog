import 'package:digicat/all.dart';
import 'package:digicat/model/subCategoryModel.dart';

class SubCategoriesController extends GetxController {
  RxList<SubCategoryModelData> subCategoryList = <SubCategoryModelData>[].obs;
  var context = ApiData.navigatorKey.currentContext!;
  Future<void> subCategory() async {
    subCategoryList.clear();
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
        url: ApiConstant.subCategory,
        body: {"main_category": UserData.userCategoriesId});
    if (response["success"] == true) {
      SubCategoryModel subCategoryModel = SubCategoryModel.fromJson(response);
      subCategoryList.addAll(subCategoryModel.data!);
      Get.toNamed("SubCategoryPage");
      // showSnackMessage(context, response["message"], no: 2);
    }
  }
}
