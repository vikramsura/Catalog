import 'package:digicat/all.dart';
import 'package:digicat/screenUi/details/controller.dart';
import 'package:digicat/screenUi/home/homePage.dart';
import 'package:digicat/screenUi/myList/controller.dart';
import 'package:flutter/cupertino.dart';

class MyListPage extends StatelessWidget {
  var noValue;
  MyListPage({super.key, this.noValue});
  final proDataController = Get.put(DetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "My List".tr,
        onTap: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, right: 20.w, left: 20.w),
          child: GetBuilder<MyListController>(
            builder: (dataController) {
              return Obx(() => dataController.cartGetList.value.cart!.isEmpty
                  ? Column(
                      children: [
                        const NoDataWidget(
                          message: " Your cart list is empty!",
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
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              dataController.cartGetList.value.cart?.length,
                          itemBuilder: (context, index) {
                            var item =
                                dataController.cartGetList.value.cart![index];
                            var number = item.quantity as int;
                            var finalNo = item.moq as int;
                            return dataController
                                    .cartGetList.value.cart!.isEmpty
                                ? NoDataWidget()
                                : Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 100.h,
                                          width: 1.sw,
                                          decoration: BoxDecoration(
                                              color: AppBodyColor.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(8.r)),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.w),
                                            child: Row(
                                              children: [
                                                buildConGradient(
                                                    width: 80.w,
                                                    height: 80.h,
                                                    widget: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.w),
                                                        child:
                                                            CachedNetworkImage(
                                                          fit: BoxFit.fill,
                                                          imageUrl: item.image
                                                              .toString(),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                        ))),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                SizedBox(
                                                  width: 0.34.sw,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      buildText(
                                                          text: item.productName
                                                              .toString(),
                                                          fontSize: 16.w,
                                                          color: AppBodyColor
                                                              .deepGrey),
                                                      // buildText(
                                                      //     text: "Modern and Soft",
                                                      //     fontSize: 12.w,
                                                      //     color: AppBodyColor.deepGrey),
                                                      buildText(
                                                          text:
                                                              "${SymbolRupee.rupee} ${item.productPrice}",
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        dataController
                                                            .cartDelete(
                                                                index, item.id);
                                                      },
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .delete_solid,
                                                        color: AppBodyColor
                                                            .deepGrey,
                                                        size: 28.w,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10.w),
                                                      child: Container(
                                                        height: 28.h,
                                                        width: item.quantity! <=
                                                                finalNo
                                                            ? 60.w
                                                            : 90.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.r),
                                                          border: Border.all(
                                                              color:
                                                                  AppBodyColor
                                                                      .deepGrey,
                                                              width: 2.w),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            item.quantity! <=
                                                                    finalNo
                                                                ? const SizedBox()
                                                                : GestureDetector(
                                                                    onTap: () {
                                                                      number--;
                                                                      if (item.quantity !=
                                                                          number) {
                                                                        dataController.cartAdd(
                                                                            index,
                                                                            id: item
                                                                                .id,
                                                                            min:
                                                                                number,
                                                                            product_id:
                                                                                item.productId);
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      CupertinoIcons
                                                                          .minus,
                                                                      color: AppBodyColor
                                                                          .deepGrey,
                                                                      size:
                                                                          22.h,
                                                                    ),
                                                                  ),
                                                            item.quantity! <=
                                                                    finalNo
                                                                ? const SizedBox()
                                                                : Container(
                                                                    width: 2.w,
                                                                    height: double
                                                                        .infinity,
                                                                    color: AppBodyColor
                                                                        .deepGrey,
                                                                  ),
                                                            SizedBox(
                                                              width: 30.w,
                                                              child: Center(
                                                                child: buildText(
                                                                    text: item
                                                                        .quantity
                                                                        .toString()),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 2.w,
                                                              height: double
                                                                  .infinity,
                                                              color:
                                                                  AppBodyColor
                                                                      .deepGrey,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                number++;
                                                                if (item.quantity !=
                                                                    number) {
                                                                  dataController.cartAdd(
                                                                      index,
                                                                      id: item
                                                                          .id,
                                                                      min:
                                                                          number,
                                                                      product_id:
                                                                          item.productId);
                                                                }
                                                              },
                                                              child: Icon(
                                                                Icons.add,
                                                                color:
                                                                    AppBodyColor
                                                                        .deepGrey,
                                                                size: 22.h,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                          },
                        ),
                        SizedBox(height: 30.h),
                        buildText(
                            text: "Related Items".tr,
                            fontSize: 18.w,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 120.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: dataController
                                .cartGetList.value.similar?.length,
                            itemBuilder: (context, index) {
                              var item = dataController
                                  .cartGetList.value.similar![index];
                              return dataController
                                      .cartGetList.value.similar!.isEmpty
                                  ? NoDataWidget()
                                  : GestureDetector(
                                      onTap: () {
                                        proDataController.productsDerails(
                                            item.productsUniId,
                                            no: noValue);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.w, top: 15.h),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100.h,
                                              width: 250.w,
                                              decoration: BoxDecoration(
                                                  color: AppBodyColor.yellow,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r)),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.w),
                                                child: Row(
                                                  children: [
                                                    buildConGradient(
                                                        width: 80.w,
                                                        height: 80.h,
                                                        widget: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.w),
                                                          child:
                                                              CachedNetworkImage(
                                                            fit: BoxFit.fill,
                                                            imageUrl: item.image
                                                                .toString(),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error),
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    SizedBox(
                                                      width: 0.34.sw,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          buildText(
                                                              text: item.name
                                                                  .toString(),
                                                              fontSize: 16.w,
                                                              color: AppBodyColor
                                                                  .deepGrey),
                                                          // buildText(
                                                          //     text: "Modern and Soft",
                                                          //     fontSize: 12.w,
                                                          //     color: AppBodyColor.deepGrey),
                                                          buildText(
                                                              text:
                                                                  "${SymbolRupee.rupee} ${item.productPrice}",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                            },
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Container(
                          height: 100.h,
                          width: 1.sw,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppBodyColor.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppBodyColor.grey,
                                    spreadRadius: 0,
                                    offset: Offset(0, 1.w),
                                    blurRadius: 10.w)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildText(
                                        text: "Sub Total",
                                        color: AppTextColor.deepGrey),
                                    buildText(
                                        text: dataController.itemA.value
                                            .toString(),
                                        color: AppTextColor.deepGrey),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildText(
                                        text: "Delivery",
                                        color: AppTextColor.deepGrey),
                                    buildText(
                                        text: "2",
                                        color: AppTextColor.deepGrey),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildText(
                                        text: "Total",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.w),
                                    buildText(
                                        text: ((dataController.itemA.value) + 2)
                                            .toString(),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.w),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h),
                        GestureDetector(
                          onTap: () {
                            dataController.orderCreate();
                          },
                          child: buildConGradient(
                            borderRadius: 28.r,
                            widget: Center(
                              child: buildText(
                                  text: "Order".tr,
                                  fontSize: 18.w,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h),
                      ],
                    ));
            },
          ),
        ),
      ),
    );
  }
}
