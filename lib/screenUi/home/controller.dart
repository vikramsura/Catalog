import 'package:digicat/all.dart';
import 'package:digicat/model/categoryModel.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<CategoryModelData> searchCategoryList = <CategoryModelData>[].obs;

  RxList<CategoryModelData> categoryList = <CategoryModelData>[].obs;

  Future<void> category() async {
    categoryList.clear();
    searchCategoryList.clear();
    searchController.clear();
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.category);
    if (response["success"] == true) {
      CategoryModel categoryModel = CategoryModel.fromJson(response);
      categoryList.addAll(categoryModel.data!);
      searchController.clear();
      update();
    }
  }

  searchNames(String query) {
    query = query.toLowerCase();
    searchCategoryList.value = categoryList.where(
      (name) {
        final fullName = '${name.name}'.toLowerCase();
        return fullName.contains(query);
      },
    ).toList();
    update();
  }

  Future<void> deviceInfoPhone() async {
    PermissionStatus status = await Permission.notification.status;
    if (!status.isGranted) {
      status = await Permission.notification.request();
    }
  }

  @override
  void onInit() {
    category();
    deviceInfoPhone();
    // TODO: implement onInit
    super.onInit();
  }
}
