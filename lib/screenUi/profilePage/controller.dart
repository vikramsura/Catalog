import 'dart:io';

import 'package:digicat/all.dart';
import 'package:digicat/model/profileModel.dart';
import 'package:digicat/screenUi/profilePage/userProfilePage.dart';
import 'package:digicat/unitData/connectivity.dart';
import 'package:digicat/unitData/errorConnection.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePageController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var context = ApiData.navigatorKey.currentContext!;
  RxString imageFiles = "".obs;
  Rx<File?> sendNewFile = Rx<File?>(null);
  FocusNode phoneFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode gstNoFocus = FocusNode();
  FocusNode shopAddressFocus = FocusNode();
  FocusNode shopNameFocus = FocusNode();
  FocusNode alternatePhoneFocus = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController alternatePhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController GSTNoController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController codeISOController = TextEditingController();
  TextEditingController codeAlterController = TextEditingController();
  TextEditingController codeAlterISOController = TextEditingController();
  RxBool isAlterValue = true.obs;
  RxBool isPhone = true.obs;
  void dataClean() {
    codeController.clear();
    codeAlterISOController.clear();
    codeISOController.clear();
    codeAlterController.clear();
    isAlterValue.value = true;
    isPhone.value = true;
    alternatePhoneController.clear();
    imageFiles.value = "";
    sendNewFile.value = null;
    nameController.clear();
    numberController.clear();
    emailController.clear();
    GSTNoController.clear();
    shopAddressController.clear();
    shopNameController.clear();
  }

  Future uploadImage() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      XFile? pickedFile;
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
      sendNewFile.value = File(pickedFile!.path);
      update();
    } else {
      Permission.storage.onPermanentlyDeniedCallback(
        () {
          openAppSettings();
        },
      );
    }
  }

  Future<void> profileInit(no) async {
    dataClean();
    profileList = await profile(no);
    imageFiles.value = profileList.image ?? "";
    nameController.text = profileList.name ?? "";
    numberController.text = profileList.mobile ?? "";
    emailController.text = profileList.email ?? "";
    shopNameController.text = profileList.profile!.busnessName ?? "";
    GSTNoController.text = profileList.profile!.gstNumber ?? "";
    shopAddressController.text = profileList.profile!.busnessAddress ?? "";
    alternatePhoneController.text = profileList.profile!.alternatePhone ?? "";
    codeISOController.text = profileList.countryIso ?? "";
    codeAlterISOController.text = profileList.profile!.altCountryIso ?? "";
    codeController.text = profileList.countryCode ?? "";
    codeAlterController.text = profileList.profile!.altCountryCode ?? "";
  }

  ProfileModelData profileList = ProfileModelData();

  Future profile(no) async {
    late Map<String, dynamic> response;
    response = await ApiData().postApi(url: ApiConstant.userProfile);
    if (response["success"] == true) {
      ProfileModel profileModel = ProfileModel.fromJson(response);
      profileList = profileModel.data!;
      Get.to(UserProfilePage(isValue: no == 0 ? true : false));
      return profileList;
    }
  }

  Future updateProfile() async {
    try {
      bool isNetActive = await ConnectionStatus.getInstance().checkConnection();
      if (isNetActive) {
        var ApiUrl = Uri.parse(ApiConstant.profileEdit);

        final newDataFrom = await http.MultipartRequest("Post", ApiUrl);
        if (sendNewFile.value != null) {
          newDataFrom.files.add(await http.MultipartFile.fromPath(
              "image", sendNewFile.value!.path));
        }

        var body = {
          "email": emailController.text.trim().toString(),
          "name": nameController.text.trim().toString(),
          "mobile": numberController.text.trim().toString(),
          "busness_name": shopNameController.text.trim().toString(),
          "alternate_phone": alternatePhoneController.text.trim().toString(),
          "gst_number": GSTNoController.text.trim().toString(),
          "address": shopAddressController.text.trim().toString(),
          "country_code": codeController.text.trim(),
          "country_iso": codeISOController.text.trim(),
          "alt_country_code": codeAlterController.text.trim(),
          "alt_country_iso": codeAlterISOController.text.trim(),
        };
        print("body.....$body");
        // print("body......$body");
        // newDataFrom.fields["data"] = jsonEncode(body);
        newDataFrom.fields.addAll(body);
        // print("newDataFrom.fields......${newDataFrom.fields["data"]}");
        // print("newDataFrom.fields.addAll(body);......${newDataFrom.fields}");
        newDataFrom.headers['Authorization'] =
            'Bearer  ${UserData.userAuthToken}';
        final response =
            await http.Response.fromStream(await newDataFrom.send());
        if (response.statusCode == 401) {
          Get.offNamedUntil("RegisterPage", (route) => false);
        }
        var data = ApiData().responseReq(response);
        if (data["success"] == true) {
          Navigator.pop(context);
          showSnackMessage(context, data["message"], no: 2);
        } else if (data["success"] == false) {
          showSnackMessage(context, data["message"]);
        }
        return data;
      } else {
        errorConnection(context, 'assets/lottie/network_error.json');
      }
    } catch (e) {
      print("error....$e");
    }
  }
}
