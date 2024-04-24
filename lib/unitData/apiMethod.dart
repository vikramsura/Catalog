import 'dart:convert';
import 'dart:developer';

import 'package:digicat/all.dart';
import 'package:digicat/unitData/connectivity.dart';
import 'package:digicat/unitData/errorConnection.dart';
import 'package:http/http.dart' as http;

class ApiData {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future postApi({required String url, body, headerValue}) async {
    bool isNetActive = await ConnectionStatus.getInstance().checkConnection();
    if (isNetActive) {
      var context = navigatorKey.currentContext!;
      try {
        Map<String, String>? headersData = {
          'Authorization': 'Bearer ${UserData.userAuthToken}',
          'Accept-Language': '${UserData.userLang}',
        };
        if (headerValue != null) {
          headersData.addAll(headerValue);
        }
        log("PostApiDataSend----- $url  ..... body--$body   ....... headersData--$headersData");
        http.Response response =
            await http.post(Uri.parse(url), body: body, headers: headersData);
        log(" ...statusCode--${response.statusCode} .....  body--${response.body}");

        if (response.statusCode == 401) {
          Get.offNamedUntil("RegisterPage", (route) => false);
        }
        var data = responseReq(response);
        if (data["success"] == false) {
          showSnackMessage(context, data["message"]);
        }
        return data;
      } catch (e) {
        print("error....$e");
      }
    } else {
      errorConnection(
          navigatorKey.currentContext!, 'assets/lottie/network_error.json');
    }
  }

  responseReq(response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        return "Bad Request";
      case 401:
        return "Unauthorized";
      case 402:
        return "Payment Required";
      case 403:
        return "Forbidden";
      case 404:
        return "Not Found";
      case 405:
        return "Method Not Allowed";
      case 406:
        return "Not Acceptable";
      case 407:
        return "Proxy Authentication Required";
      case 408:
        return "Request Time Out";
      case 409:
        return "Conflict";
      case 499:
        return "Client Closed Request";
      case 500:
        return "Internal Server Error";
      case 501:
        return "Not Implemented";
      case 502:
        return "Bad Gateway";
      case 503:
        return "Service Unavailable";
      case 504:
        return "Gateway Time Out";
      case 505:
        return "HTTP Version Not Supported";
      case 506:
        return "variant Also Negotiates";
      case 507:
        return "Insufficient Storage";
      case 508:
        return "Loop Detected";
      case 599:
        return "Network Connect Time Out Error";
      default:
        return "Unhandled response status:${response.status}";
    }
  }

  showLode() {
    var context = navigatorKey.currentContext!;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white60,
          body: PopScope(
              canPop: false, child: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}
