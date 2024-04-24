import 'dart:convert';

import 'package:digicat/all.dart';
import 'package:digicat/model/filterOptionModel.dart';
import 'package:digicat/model/productsModel.dart';
import 'package:digicat/screenUi/sortFilter/sortFilter.dart';

class SortFilterController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<ProductsModelData> searchProductsList = <ProductsModelData>[].obs;
  RxInt selectedItem = 0.obs;
  var metalItem = [].obs;
  var metalTypeItem = [].obs;
  var metalColorItem = [].obs;
  var stoneGroupItem = [].obs;
  var stoneNameItem = [].obs;
  var stoneShapeItem = [].obs;
  var stoneQualityItem = [].obs;
  var context = ApiData.navigatorKey.currentContext!;

  dataClean() {
    searchController.clear();
    selectedItem.value = 0;
    searchProductsList.clear();
    metalItem.clear();
    metalTypeItem.clear();
    metalColorItem.clear();
    stoneGroupItem.clear();
    stoneNameItem.clear();
    stoneShapeItem.clear();
    stoneQualityItem.clear();
  }

  searchNames(String query) {
    query = query.toLowerCase();
    searchProductsList.value = productsList.where(
      (item) {
        final fullName = item.name.toString().toLowerCase();
        return fullName.contains(query);
      },
    ).toList();
    update();
  }

  metalItemData(text) {
    if (metalItem.contains(text)) {
      metalItem.removeWhere((element) => element == text);
    } else {
      metalItem.add(text);
    }
  }

  metalTypeItemData(text) {
    if (metalTypeItem.contains(text)) {
      metalTypeItem.removeWhere((element) => element == text);
    } else {
      metalTypeItem.add(text);
    }
  }

  metalColorItemData(text) {
    if (metalColorItem.contains(text)) {
      metalColorItem.removeWhere((element) => element == text);
    } else {
      metalColorItem.add(text);
    }
  }

  stoneGroupItemData(text) {
    if (stoneGroupItem.contains(text)) {
      stoneGroupItem.removeWhere((element) => element == text);
    } else {
      stoneGroupItem.add(text);
    }
  }

  stoneNameItemData(text) {
    if (stoneNameItem.contains(text)) {
      stoneNameItem.removeWhere((element) => element == text);
    } else {
      stoneNameItem.add(text);
    }
  }

  stoneQualityItemData(text) {
    if (stoneQualityItem.contains(text)) {
      stoneQualityItem.removeWhere((element) => element == text);
    } else {
      stoneQualityItem.add(text);
    }
  }

  stoneShapeItemData(text) {
    if (stoneShapeItem.contains(text)) {
      stoneShapeItem.removeWhere((element) => element == text);
    } else {
      stoneShapeItem.add(text);
    }
  }

  RxList<ProductsModelData> productsList = <ProductsModelData>[].obs;

  Future<void> products() async {
    productsList.clear();
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.products, body: {
      "main_category": UserData.userCategoriesId.toString(),
      "category": UserData.userSubCategoriesId.toString(),
      "sub_category": UserData.userSolitaireId.toString(),
    });
    if (response["success"] == true) {
      ProductsModel productsModel = ProductsModel.fromJson(response);
      productsList.addAll(productsModel.data!);
      dataClean();
      Get.to(SortFilter());
      update();
    }
  }

  FilterOptionModelData filterList = FilterOptionModelData();

  Future<void> filter() async {
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.filterOption);
    if (response["success"] == true) {
      FilterOptionModel filterOptionModel =
          FilterOptionModel.fromJson(response);
      filterList = filterOptionModel.data!;
      Get.toNamed("FilterPage");
      update();
    }
  }

  void chekValue({int no = 1}) {
    if (metalItem.isEmpty ||
        metalTypeItem.isEmpty ||
        metalColorItem.isEmpty ||
        stoneGroupItem.isEmpty ||
        stoneNameItem.isEmpty ||
        stoneShapeItem.isEmpty ||
        stoneQualityItem.isEmpty) {
      addFilter(no: no);
    } else {
      if (no == 1) {
        Get.back();
      }
    }
  }

  Future<void> addFilter({int no = 1}) async {
    productsList.clear();
    Map body = {
      "main_category": UserData.userCategoriesId.toString(),
      "category": UserData.userSubCategoriesId.toString(),
      "sub_category": UserData.userSolitaireId.toString(),
      "metal": metalItem,
      "metal_type": metalTypeItem,
      "metal_color": metalColorItem,
      "stone_group": stoneGroupItem,
      "stone_name": stoneNameItem,
      "stone_shape": stoneShapeItem,
      "stone_quality": stoneQualityItem,
    };
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
        url: ApiConstant.products,
        headerValue: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body));
    if (response["success"] == true) {
      ProductsModel productsModel = ProductsModel.fromJson(response);
      productsList.addAll(productsModel.data!);
      if (no == 1) {
        Get.back();
      }

      update();
    }
  }

  Future<void> sort(number) async {
    productsList.clear();
    Map body = {
      "main_category": UserData.userCategoriesId.toString(),
      "category": UserData.userSubCategoriesId.toString(),
      "sub_category": UserData.userSolitaireId.toString(),
      "order_by": number,
    };
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
        url: ApiConstant.products,
        headerValue: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body));
    if (response["success"] == true) {
      ProductsModel productsModel = ProductsModel.fromJson(response);
      productsList.addAll(productsModel.data!);
      selectedItem.value = 0;
      Get.back();
      update();
    }
  }
}
