import 'package:digicat/all.dart';
import 'package:digicat/screenUi/sortFilter/controller.dart';

class RadioTilePage extends StatelessWidget {
  RadioTilePage({Key? key});

  final dataController = Get.put(SortFilterController());

  Widget buildRadioListTile(
      {required String text, required int value, required int? groupValue}) {
    return RadioListTile<int>(
      title: Text(
        text,
        style: TextStyle(fontSize: 16.w),
      ),
      activeColor: AppBodyColor.deepGrey,
      value: value,
      groupValue: groupValue,
      onChanged: (int? newValue) {
        if (newValue != null) {
          dataController.selectedItem.value = newValue;
          dataController.sort(newValue);
        }
      },
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(22.w),
        child: Obx(() => Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    buildText(
                        text: "Sort by".tr,
                        fontSize: 18.w,
                        fontWeight: FontWeight.w500),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.close)),
                    SizedBox(
                      width: 30.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                buildRadioListTile(
                  text: "Price: High to Low".tr,
                  groupValue: dataController.selectedItem.value,
                  value: 1,
                ),
                buildRadioListTile(
                  text: "Price: Low to High".tr,
                  groupValue: dataController.selectedItem.value,
                  value: 2,
                ),
                buildRadioListTile(
                  text: "New Arrival".tr,
                  groupValue: dataController.selectedItem.value,
                  value: 3,
                ),
              ],
            )),
      ),
    );
  }
}
