import 'dart:async';

import 'package:digicat/all.dart';
import 'package:digicat/model/orderGetModel.dart';
import 'package:digicat/screenUi/myOrders/cancelOrder.dart';
import 'package:digicat/screenUi/myOrders/myOrdersPage.dart';

class MyOrdersController extends GetxController {
  RxList<OrderGetModelData> orderGetList = <OrderGetModelData>[].obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode otherFocus = FocusNode();
  var context = ApiData.navigatorKey.currentContext!;
  RxInt selectedItem = 0.obs;
  RxString timeShow = "".obs;
  TextEditingController otherController = TextEditingController();

  RxString a = "I want to change the contact details".obs;
  RxString b = "Price of the product has now decreased".obs;
  RxString c = "I want hoping for a shorter time".obs;
  RxString d = "I want to change the delivery address ".obs;

  Future<void> orderGet({no = 0}) async {
    orderGetList.clear();
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.orderGet);
    if (response["success"] == true) {
      OrderGetModel orderGetModel = OrderGetModel.fromJson(response);
      orderGetList.addAll(orderGetModel.data!);
      no == 0 ? Get.to(MyOrdersPage()) : null;
    }
    update();
  }

  Future<void> orderCancel(id) async {
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.orderCancel, body: {
      "order_id": id.toString(),
      "reason": selectedItem.value == 1
          ? a.value
          : selectedItem.value == 2
              ? b.value
              : selectedItem.value == 3
                  ? c.value
                  : selectedItem.value == 4
                      ? d.value
                      : otherController.text.trim()
    });
    if (response["success"] == true) {
      selectedItem.value = 0;
      otherController.clear();
      Get.to(CancelOrder());
      update();
    }
  }

  Widget buildRadioListTile(
      {required String text, required int value, required int? groupValue}) {
    return RadioListTile<int>(
      contentPadding: REdgeInsets.all(0),
      title: Text(
        text,
        style: TextStyle(fontSize: 16.w),
      ),
      activeColor: AppBodyColor.deepY2,
      value: value,
      hoverColor: AppBodyColor.deepY2,
      groupValue: groupValue,
      onChanged: (int? newValue) {
        if (newValue != null) {
          selectedItem.value = newValue;
        }
      },
      // controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
