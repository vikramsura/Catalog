import 'package:digicat/all.dart';
import 'package:digicat/screenUi/sortFilter/controller.dart';

class FilterPage extends StatelessWidget {
  FilterPage({super.key});
  final SortFilterController dataController = Get.put(SortFilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          title: "Filter".tr,
          onTap: () {
            dataController.chekValue();
          },
        ),
        body: PopScope(
          onPopInvoked: (didPop) {
            dataController.chekValue(no: 0);
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 170.h,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/image/filterImage.webp"))),
                ),
                SizedBox(
                  height: 20.h,
                ),
                buildContainer(
                    name: "Women’s",
                    font: 18.w,
                    colorText: AppTextColor.choGrey,
                    color: AppBodyColor.yellow),
                SizedBox(
                  height: 10.h,
                ),
                buildContainer(name: "Metal".tr, font: 16.w),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dataController.filterList.matel?.length ?? 0,
                  itemBuilder: (context, index) {
                    String metal =
                        dataController.filterList.matel![index].toString();
                    return Obx(
                        () => buildMatelItem(text: "$metal K", no: index));
                  },
                ),
                buildContainer(name: "Metal Type".tr, font: 16.w),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataController.filterList.metalType?.length ?? 0,
                  itemBuilder: (context, index) {
                    String metal =
                        dataController.filterList.metalType![index].toString();
                    return Obx(
                        () => buildMetalTypeItem(text: metal, no: index));
                  },
                ),
                buildContainer(name: "Metal Color".tr, font: 16.w),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataController.filterList.metalColor?.length ?? 0,
                  itemBuilder: (context, index) {
                    String metal =
                        dataController.filterList.metalColor![index].toString();
                    return Obx(
                        () => buildMetalColorItem(text: metal, no: index));
                  },
                ),
                buildContainer(name: "Stone Group".tr, font: 16.w),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataController.filterList.stoneGroup?.length ?? 0,
                  itemBuilder: (context, index) {
                    String metal =
                        dataController.filterList.stoneGroup![index].toString();
                    return Obx(
                        () => buildStoneGroupItem(text: metal, no: index));
                  },
                ),
                buildContainer(name: "Stone Name".tr, font: 16.w),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataController.filterList.stoneName?.length ?? 0,
                  itemBuilder: (context, index) {
                    String metal =
                        dataController.filterList.stoneName![index].toString();
                    return Obx(
                        () => buildStoneNameItem(text: metal, no: index));
                  },
                ),
                buildContainer(name: "Stone Shape".tr, font: 16.w),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataController.filterList.stoneShape?.length ?? 0,
                  itemBuilder: (context, index) {
                    String metal =
                        dataController.filterList.stoneShape![index].toString();
                    return Obx(
                        () => buildStoneShapeItem(text: metal, no: index));
                  },
                ),
                buildContainer(name: "Stone Quality".tr, font: 16.w),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      dataController.filterList.stoneQuality?.length ?? 0,
                  itemBuilder: (context, index) {
                    String metal = dataController
                        .filterList.stoneQuality![index]
                        .toString();
                    return Obx(
                        () => buildStoneQualityItem(text: metal, no: index));
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: GestureDetector(
                      onTap: () {
                        dataController.addFilter();
                      },
                      child: buildConButton(text: "Apply".tr)),
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ));
  }

  CheckboxListTile buildMatelItem({text, no}) {
    var item = dataController.filterList.matel![no];
    return buildCheckboxListTile(
        text: text,
        valueData: dataController.metalItem.contains(item),
        onChanged: (newValue) {
          dataController.metalItemData(item);
        });
  }

  CheckboxListTile buildMetalTypeItem({text, no}) {
    String item = dataController.filterList.metalType![no].toString();
    return buildCheckboxListTile(
        text: text,
        valueData: dataController.metalTypeItem.contains(item),
        onChanged: (newValue) {
          dataController.metalTypeItemData(item);
        });
  }

  CheckboxListTile buildMetalColorItem({text, no}) {
    String item = dataController.filterList.metalColor![no].toString();

    return buildCheckboxListTile(
        text: text,
        valueData: dataController.metalColorItem.contains(item),
        onChanged: (newValue) {
          dataController.metalColorItemData(item);
        });
  }

  CheckboxListTile buildStoneGroupItem({text, no}) {
    String item = dataController.filterList.stoneGroup![no].toString();

    return buildCheckboxListTile(
        text: text,
        valueData: dataController.stoneGroupItem.contains(item),
        onChanged: (newValue) {
          dataController.stoneGroupItemData(item);
        });
  }

  CheckboxListTile buildStoneNameItem({text, no}) {
    String item = dataController.filterList.stoneName![no].toString();

    return buildCheckboxListTile(
        text: text,
        valueData: dataController.stoneNameItem.contains(item),
        onChanged: (newValue) {
          dataController.stoneNameItemData(item);
        });
  }

  CheckboxListTile buildStoneShapeItem({text, no}) {
    String item = dataController.filterList.stoneShape![no].toString();

    return buildCheckboxListTile(
        text: text,
        valueData: dataController.stoneShapeItem.contains(item),
        onChanged: (newValue) {
          dataController.stoneShapeItemData(item);
        });
  }

  CheckboxListTile buildStoneQualityItem({text, no}) {
    String item = dataController.filterList.stoneQuality![no].toString();

    return buildCheckboxListTile(
        text: text,
        valueData: dataController.stoneQualityItem.contains(item),
        onChanged: (newValue) {
          dataController.stoneQualityItemData(item);
        });
  }

  CheckboxListTile buildCheckboxListTile({text, valueData, onChanged}) {
    return CheckboxListTile(
      // dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
      activeColor: AppBodyColor.deepGrey,
      title: buildText(text: text),
      value: valueData,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Container buildContainer({height, name, font, color, colorText}) {
    return Container(
      height: height ?? 60.h,
      width: 1.sw,
      decoration: BoxDecoration(color: color ?? AppBodyColor.deepYellow),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Align(
            alignment: Alignment.centerLeft,
            child: buildText(
                text: name,
                fontSize: font,
                color: colorText ?? AppTextColor.deepGrey)),
      ),
    );
  }
}
