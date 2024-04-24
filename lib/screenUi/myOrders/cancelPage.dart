import 'package:digicat/all.dart';
import 'package:digicat/screenUi/myOrders/controller.dart';
import 'package:intl/intl.dart';

class CancelPage extends StatefulWidget {
  var orderId;
  CancelPage({super.key, this.orderId});

  @override
  State<CancelPage> createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {
  final dataController = Get.put(MyOrdersController());
  @override
  void initState() {
    dataController.timeShow.value =
        DateFormat('hh:mm a').format(DateTime.now());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        dataController.selectedItem.value = 0;
        dataController.otherController.clear();
      },
      child: Scaffold(
        appBar: buildAppBar(
          title: "Order Cancel ",
          onTap: () {
            Get.back();
            dataController.selectedItem.value = 0;
            dataController.otherController.clear();
          },
        ),
        body: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 22.w, top: 30.h, left: 22.w),
                child: Form(
                  key: dataController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          buildText(
                              text: "Order no: ${widget.orderId}",
                              fontSize: 18.w,
                              fontWeight: FontWeight.w500),
                          buildText(text: " (Running order)", fontSize: 16.w),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildText(
                              text: UserData.userName.toString(),
                              fontSize: 16.w),
                          buildText(
                              text: "Today: ${dataController.timeShow.value}",
                              fontSize: 16.w),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      buildText(
                          text: "You can cancel order anytime before accepted.",
                          fontSize: 18.w),
                      SizedBox(height: 25.h),
                      buildText(
                          text: "Why do you want to cancel your order?",
                          fontSize: 18.w,
                          fontWeight: FontWeight.w500),
                      dataController.buildRadioListTile(
                          text: dataController.a.value,
                          value: 1,
                          groupValue: dataController.selectedItem.value),
                      dataController.buildRadioListTile(
                          text: dataController.b.value,
                          value: 2,
                          groupValue: dataController.selectedItem.value),
                      dataController.buildRadioListTile(
                          text: dataController.c.value,
                          value: 3,
                          groupValue: dataController.selectedItem.value),
                      dataController.buildRadioListTile(
                          text: dataController.d.value,
                          value: 4,
                          groupValue: dataController.selectedItem.value),
                      dataController.buildRadioListTile(
                          text: "Other",
                          value: 5,
                          groupValue: dataController.selectedItem.value),
                      dataController.selectedItem.value == 5
                          ? Padding(
                              padding: EdgeInsets.only(left: 50.w),
                              child: buildTextField(context,
                                  focusNode: dataController.otherFocus,
                                  controllerData:
                                      dataController.otherController,
                                  maxLength: 120, validator: (p0) {
                                if (p0!.trim().isEmpty) {
                                  return 'Other message is required';
                                }
                                if (p0.trim().length < 50) {
                                  return 'Other message must be at least 50 characters long';
                                }
                                return null;
                              },
                                  hintText: "Message",
                                  maxLines: 5,
                                  borderRadius: 8.r),
                            )
                          : SizedBox(),
                      SizedBox(height: 40.h),
                      GestureDetector(
                        onTap: () {
                          if (dataController.selectedItem.value != 0) {
                            if (dataController.formKey.currentState!
                                .validate()) {}
                            if (dataController.selectedItem.value == 5 &&
                                (dataController.otherController.text
                                        .trim()
                                        .isEmpty ||
                                    dataController.otherController.text
                                            .trim()
                                            .length <
                                        50)) {
                              dataController.otherFocus.requestFocus();
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actionsPadding: REdgeInsets.all(0),
                                    title: Center(
                                        child: buildText(
                                            text: "Cancel Order",
                                            fontSize: 25.w,
                                            fontWeight: FontWeight.w500)),
                                    content: buildTextCen(
                                        text:
                                            "This will cancel the order which has been placed",
                                        color: AppBodyColor.deepGrey,
                                        fontSize: 18.w),
                                    actions: [
                                      Column(
                                        children: [
                                          Divider(
                                            thickness: 1.w,
                                            color: AppBodyColor.black,
                                            height: 0,
                                          ),
                                          SizedBox(
                                            height: 50.h,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      dataController
                                                          .orderCancel(
                                                              widget.orderId);
                                                    },
                                                    child: buildText(
                                                        text: "Yes",
                                                        color:
                                                            AppTextColor.deepY2,
                                                        fontSize: 18.w)),
                                                Container(
                                                  width: 1.w,
                                                  height: double.infinity,
                                                  color: AppBodyColor.black,
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: buildText(
                                                        text: "No",
                                                        fontSize: 18.w)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        child: buildConGradient(
                          borderRadius: 28.r,
                          widget: Center(
                            child: buildText(
                                text: "Cancel Order".tr,
                                fontSize: 18.w,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
