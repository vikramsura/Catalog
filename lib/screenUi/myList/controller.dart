import 'dart:convert';

import 'package:digicat/all.dart';
import 'package:digicat/model/cartGetModel.dart';
import 'package:digicat/model/createModel.dart';
import 'package:digicat/screenUi/details/controller.dart';
import 'package:digicat/screenUi/myList/myList.dart';
import 'package:digicat/screenUi/myList/orderConfirmation.dart';
import 'package:vibration/vibration.dart';

class MyListController extends GetxController {
  Rx<CartGetModelData> cartGetList = Rx<CartGetModelData>(CartGetModelData());
  var context = ApiData.navigatorKey.currentContext!;
  RxList cartId = [].obs;
  var itemA = 0.0.obs;
  addSum() {
    cartId.clear();
    itemA.value = 0.0;
    if (cartGetList.value.cart != null) {
      cartGetList.value.cart?.forEach((element) {
        cartId.add(element.id);
        itemA.value = (itemA.value +
            ((element.quantity)! * (element.productPrice as int)));
      });
      update();
    }
  }

  Future<void> cartGet(no) async {
    if (cartGetList.value.similar != null) {
      cartGetList.value.similar!.clear();
      cartId.clear();
    }
    if (cartGetList.value.cart != null) {
      cartGetList.value.cart!.clear();
    }
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.cartGet);
    if (response["success"] == true) {
      CartGetModel cartGetModel = CartGetModel.fromJson(response);
      cartGetList.value = cartGetModel.data!;
      addSum();
      Get.to(MyListPage(
        noValue: no,
      ));
    }
  }

  final dataController = Get.put(DetailsController());
  Future<void> cartAdd(index, {id, product_id, min}) async {
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.cartAdd, body: {
      "product_id": product_id.toString(),
      "quantity": min.toString(),
      "id": id.toString(),
    });
    if (response["success"] == true) {
      cartGetList.value.cart?[index].quantity = min;
      addSum();
      update();
    }
  }

  Future<void> cartDelete(index, id) async {
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.cartDelete, body: {
      "id": id.toString(),
    });
    if (response["success"] == true) {
      cartGetList.value.cart?.removeAt(index);
      if (cartGetList.value.cart!.isEmpty) {
        dataController.isValue.value = true;
        Get.back();
      }
      addSum();
    }
    update();
  }

  CreateModelData dataCreate = CreateModelData();
  Future<void> orderCreate() async {
    Vibration.vibrate();
    Map body = {
      "cart_ids": cartId.value,
    };
    late Map<String, dynamic> response;
    response = await ApiData().postApi(
        url: ApiConstant.orderCreate,
        headerValue: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body));
    if (response["success"] == true) {
      CreateModel createModel = CreateModel.fromJson(response);
      dataCreate = createModel.data!;
      cartId.clear();
      dataController.isValue.value = true;
      Get.to(OrderConfirmation());
    }
  }
}
