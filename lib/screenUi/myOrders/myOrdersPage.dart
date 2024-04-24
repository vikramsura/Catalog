import 'package:digicat/all.dart';
import 'package:digicat/screenUi/home/homePage.dart';
import 'package:digicat/screenUi/myOrders/cancelPage.dart';
import 'package:digicat/screenUi/myOrders/controller.dart';
import 'package:digicat/screenUi/myOrders/pdf.dart';

class MyOrdersPage extends StatelessWidget {
  MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrdersController>(builder: (dataController) {
      return Scaffold(
          appBar: buildAppBar(
            title: "My Orders".tr,
            onTap: () {
              Get.back();
            },
          ),
          body: RefreshIndicator(
            onRefresh: () {
              return dataController.orderGet(no: 1);
            },
            child: SingleChildScrollView(
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 22.w, top: 40.h, right: 22.w),
                    child: dataController.orderGetList.isEmpty
                        ? Column(
                            children: [
                              const NoDataWidget(
                                message: "Order list is empty",
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offAll(HomePage());
                                },
                                child: buildConGradient(
                                  height: 35.h,
                                  width: 0.3.sw,
                                  borderRadius: 28.r,
                                  widget: Center(
                                    child: buildText(
                                        text: "Shop now",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: dataController.orderGetList.length,
                            itemBuilder: (context, index) {
                              var item = dataController.orderGetList[index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(PdfPage(
                                        value: 0,
                                        id: item.orderId.toString(),
                                        userId: item.userId.toString(),
                                      ));
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 90.h,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                              color: AppBodyColor.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(8.w)),
                                          child: Center(
                                            child: ImageIcon(
                                              const AssetImage(
                                                  "assets/image/orderList.png"),
                                              size: 70.w,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        SizedBox(
                                          width: 0.4.sw,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              buildText(
                                                  text: item.orderId.toString(),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.w),
                                              Text(
                                                item.items.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 16.w,
                                                    color: AppTextColor.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              buildText(
                                                  text:
                                                      "${SymbolRupee.rupee} ${item.amount}",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.w),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        item.status == 0 || item.status == 4
                                            ? Text(
                                                "Order\n cancelled.. ",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppBodyColor.deepGrey),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  Get.to(CancelPage(
                                                    orderId: item.orderId,
                                                  ));
                                                },
                                                child: buildConGradient(
                                                  height: 35.h,
                                                  width: 80.w,
                                                  borderRadius: 28.r,
                                                  widget: Center(
                                                    child: buildText(
                                                        text: "Cancel",
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.h,
                                    color: AppBodyColor.grey,
                                    height: 15.h,
                                  )
                                ],
                              );
                            },
                          ))),
          ));
    });
  }
}
