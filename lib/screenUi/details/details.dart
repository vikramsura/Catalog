import 'package:carousel_slider/carousel_slider.dart';
import 'package:digicat/all.dart';
import 'package:digicat/screenUi/details/controller.dart';
import 'package:digicat/screenUi/details/imageViewPage.dart';
import 'package:digicat/screenUi/myList/controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  final getCartDataController = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (dataController) {
      var item = dataController.productDerailsList;
      dataController.sumValue.value = item.moq as int;
      var number = item.moq as int;
      return Scaffold(
        appBar: buildAppBar(
          title: "Details".tr,
          backgroundColor: AppBodyColor.yellow,
          onTap: () {
            Get.back();
            dataController.dataClean();
          },
        ),
        body: PopScope(
          onPopInvoked: (didPop) {
            dataController.dataClean();
          },
          child: SingleChildScrollView(
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.sw,
                      height: 300.h,
                      color: AppBodyColor.yellow,
                      child: dataController.onOff.value
                          ? Stack(
                              children: [
                                // Center(
                                //   child: Ci360View(
                                //     xImageModel: Ci360ImageModel.horizontal(
                                //       imageFolder:
                                //           'https://scaleflex.cloudimg.io/v7/demo/earbuds/',
                                //       imageName: (index) => '$index.jpg',
                                //       imagesLength: 233,
                                //     ),
                                //     options: const Ci360Options(
                                //       swipeSensitivity: 2,
                                //       autoRotate: true,
                                //       rotationCount: 5,
                                //       allowSwipeToRotate: true,
                                //     ),
                                //   ),
                                // ),
                                // GestureDetector(
                                //     onTap: () {
                                //       dataController.onOff.value = false;
                                //     },
                                //     child: Icon(
                                //       Icons.close,
                                //       size: 30.h,
                                //     ))
                              ],
                            )
                          : Column(
                              children: [
                                CarouselSlider.builder(
                                  options: CarouselOptions(
                                    height: 0.3.sh,
                                    initialPage: 0,
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 4),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index, reason) {
                                      dataController.valueNo.value = index;
                                    },
                                  ),
                                  itemCount: dataController
                                      .productDerailsList.productImage?.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(ImageView(data: index));
                                      },
                                      child: Center(
                                          child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl: dataController
                                            .productDerailsList
                                            .productImage![index]
                                            .image
                                            .toString(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      )),
                                    );
                                  },
                                ),
                                DotsIndicator(
                                  dotsCount: dataController
                                      .productDerailsList.productImage!.length,
                                  position: dataController.valueNo.value,
                                  decorator: DotsDecorator(
                                    color:
                                        AppBodyColor.deepY2, // Inactive color
                                    activeColor: AppBodyColor.black,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildText(
                                  text: item.name.toString(), fontSize: 16.w),
                              buildText(
                                  text:
                                      "${SymbolRupee.rupee} ${item.productPrice}",
                                  fontSize: 16.w,
                                  color: AppTextColor.deepY2),
                            ],
                          ),
                          SizedBox(
                            width: 300.w,
                            child: buildText(
                                text:
                                    "Description of the Product [Max Length's 100 Char]",
                                fontSize: 16.w),
                          ),
                          SizedBox(
                            height: 46.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildText(
                                  text: "Quantity :",
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w500),
                              Container(
                                margin: EdgeInsets.all(10.w),
                                height: 40.h,
                                width: dataController.sumValue.value == number
                                    ? 100.w
                                    : 150.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                      color: AppBodyColor.deepGrey, width: 2.w),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    dataController.sumValue.value == number
                                        ? const SizedBox()
                                        : GestureDetector(
                                            onTap: () {
                                              dataController.isValue.value =
                                                  true;
                                              dataController.sumValue.value--;
                                            },
                                            child: Icon(
                                              CupertinoIcons.minus,
                                              color: AppBodyColor.deepGrey,
                                              size: 28.h,
                                            ),
                                          ),
                                    dataController.sumValue.value == number
                                        ? const SizedBox()
                                        : Container(
                                            width: 2.w,
                                            height: double.infinity,
                                            color: AppBodyColor.deepGrey,
                                          ),
                                    SizedBox(
                                      width: 30.w,
                                      child: Center(
                                        child: buildText(
                                            text: dataController.sumValue
                                                .toString(),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: 2.w,
                                      height: double.infinity,
                                      color: AppBodyColor.deepGrey,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        dataController.isValue.value = true;
                                        dataController.sumValue.value++;
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: AppBodyColor.deepGrey,
                                        size: 28.w,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          dataController.productDerailsList.customize == true
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        buildText(
                                            text: "Metal: ".tr,
                                            fontSize: 16.w,
                                            color: AppTextColor.deepGrey),
                                        buildText(
                                          text: item.metalType.toString(),
                                          fontSize: 16.w,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: dataController.nameK.length,
                                        itemBuilder: (context, index) {
                                          var item =
                                              dataController.nameK[index];
                                          return Obx(() => GestureDetector(
                                                onTap: () {
                                                  dataController.isValue.value =
                                                      true;
                                                  dataController
                                                      .indexNoK.value = index;
                                                  dataController.valueK.value =
                                                      item.toString();
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 20.w),
                                                  child: Container(
                                                    width: 70.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        color: dataController
                                                                        .indexNoK
                                                                        .value ==
                                                                    index ||
                                                                dataController
                                                                        .indexNoK
                                                                        .value ==
                                                                    item
                                                            ? AppBodyColor
                                                                .deepY2
                                                            : AppBodyColor
                                                                .yellow),
                                                    child: Center(
                                                        child: buildText(
                                                            text: item == 925
                                                                ? item
                                                                    .toString()
                                                                : "$item K",
                                                            fontSize: 16.w)),
                                                  ),
                                                ),
                                              ));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          dataController.productDerailsList.isRing == true
                              ? Column(children: [
                                  Row(
                                    children: [
                                      buildText(
                                          text: "Size: ".tr,
                                          fontSize: 16.w,
                                          color: AppTextColor.deepGrey),
                                      buildText(
                                        text: "US",
                                        fontSize: 16.w,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: dataController
                                          .productDerailsList.ringSize?.length,
                                      itemBuilder: (context, index) {
                                        var item = dataController
                                            .productDerailsList
                                            .ringSize![index];
                                        return Obx(() => GestureDetector(
                                              onTap: () {
                                                dataController.isValue.value =
                                                    true;
                                                dataController.indexNo.value =
                                                    index;
                                                dataController.valueSize.value =
                                                    item.size.toString();
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 20.w),
                                                child: Container(
                                                  width: 70.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                      color: dataController
                                                                  .indexNo
                                                                  .value ==
                                                              index
                                                          ? AppBodyColor.deepY2
                                                          : AppBodyColor.white,
                                                      border: Border.all(
                                                          color: AppBodyColor
                                                              .black)),
                                                  child: Center(
                                                      child: buildText(
                                                          text: item.size
                                                              .toString(),
                                                          fontSize: 16.w)),
                                                ),
                                              ),
                                            ));
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                ])
                              : SizedBox(),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.sw,
                      color: AppBodyColor.yellow,
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildText(
                              text: "Product Details".tr,
                              fontSize: 18.w,
                            ),
                            buildPadding(
                                text1: "Metal",
                                text2: dataController.valueK.value.toString() ==
                                        "null"
                                    ? "${item.metal} K"
                                    : dataController.valueK.value == "925"
                                        ? dataController.valueK.value.toString()
                                        : "${dataController.valueK.value} K"),
                            buildPadding(
                                text1: "Metal Type",
                                text2: item.metalType.toString()),
                            buildPadding(
                                text1: "Metal Color",
                                text2: item.metalColor.toString()),
                            buildPadding(
                                text1: "Width",
                                text2: "${item.metalWeight} mm"),
                            buildPadding(
                                text1: "Height",
                                text2: "${item.metalHeight} mm"),
                            buildPadding(
                                text1: "Metal Weight",
                                text2: "${item.metalWeight} gm"),
                            buildPadding(
                                text1: "Metal Price",
                                text2: item.metalPrice.toString()),
                            item.stoneGroup == "NA"
                                ? SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      buildText(
                                        text: "Stone Details".tr,
                                        fontSize: 18.w,
                                      ),
                                      buildPadding(
                                          text1: "Stone Group",
                                          text2: "${item.stoneGroup}"),
                                      buildPadding(
                                          text1: "Stone Name",
                                          text2: item.stoneName.toString()),
                                      buildPadding(
                                          text1: "Stone Shape",
                                          text2: item.stoneShape.toString()),
                                      buildPadding(
                                          text1: "Stone Quality",
                                          text2: "${item.stoneQuality}"),
                                      buildPadding(
                                          text1: "Stone Size",
                                          text2: "${item.stoneSize} mm"),
                                      buildPadding(
                                          text1: "Stone Weight",
                                          text2: "${item.stoneWeight} Cts"),
                                      buildPadding(
                                          text1: "Certificate Type",
                                          text2: "${item.stoneCtype}"),
                                      buildPadding(
                                          text1: "Stone Certificate No",
                                          text2: "${item.stoneCno}"),
                                      buildPadding(
                                          text1: "Stone Price",
                                          text2: item.stonePrice.toString()),
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                getCartDataController.cartGet(1);
                              },
                              child: buildConButton(
                                  width: dataController.isValue.value
                                      ? 155.w
                                      : 0.9.sw,
                                  text: "View List".tr,
                                  color: AppBodyColor.white,
                                  borderColor: AppBodyColor.deepYellow,
                                  colorText: AppTextColor.deepYellow),
                            ),
                            dataController.isValue.value
                                ? GestureDetector(
                                    onTap: () {
                                      dataController.cartAdd();
                                    },
                                    child: buildConGradient(
                                      borderRadius: 28.r,
                                      width: 155.w,
                                      widget: Center(
                                        child: buildText(
                                            text: "Add to List".tr,
                                            fontSize: 18.w,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                : SizedBox()
                          ],
                        )),
                    SizedBox(
                      height: 60.h,
                    ),
                  ],
                )),
          ),
        ),
      );
    });
  }

  Padding buildPadding({text1, text2}) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppBodyColor.deepGrey,
            radius: 4.r,
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
              width: 150.w,
              child: buildText(
                  text: text1, fontSize: 16.w, color: AppTextColor.deepGrey)),
          SizedBox(
            width: 34.w,
          ),
          buildText(
            text: text2,
            fontSize: 16.w,
          ),
        ],
      ),
    );
  }
}
