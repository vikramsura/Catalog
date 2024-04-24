import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:digicat/all.dart';
import 'package:digicat/screenUi/home/homePage.dart';
import 'package:digicat/screenUi/myOrders/controller.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfPage extends StatefulWidget {
  int value;
  final String id;
  final String userId;
  PdfPage(
      {super.key, required this.id, required this.userId, required this.value});

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  String urlPDFPath = "";
  bool exists = true;
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  late PDFViewController _pdfViewController;
  bool loaded = true;
  var url;
  Future<void> getFileFromUrl() async {
    url =
        "https://catalogease.akshayanidhi.digital/api/order/${widget.id}/details/${widget.userId}";
    try {
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/File.pdf");
      File urlFile = await file.writeAsBytes(bytes);
      setState(() {
        if (urlFile != null) {
          urlPDFPath = urlFile.path;
          loaded = false;
        } else {
          loaded = false;
        }
      });
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  Future<void> deviceInfoPhone() async {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    if (deviceInfo.version.sdkInt < 32) {
      var status = await Permission.storage.request();
      if (status.isGranted) {
        downloader();
      } else {
        Permission.storage.onPermanentlyDeniedCallback(() => openAppSettings());
      }
    } else {
      downloader();
    }
  }

  Future<void> downloader() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      var nameF =
          "${UserData.userName ?? ""} ${DateTime.now().microsecondsSinceEpoch}.pdf";
      await FlutterDownloader.enqueue(
        fileName: nameF,
        url: url.toString(),
        savedDir: directory.path,
        showNotification: true,
        openFileFromNotification: true,
        requiresStorageNotLow: true,
        saveInPublicStorage: true,
        allowCellular: true,
      );
      showSnackMessage(context, "File downloaded", no: 2);
    } catch (error) {
      print("error........$error");
    }
  }

  @override
  void initState() {
    getFileFromUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loaded
        ? const Scaffold(
            backgroundColor: Colors.white60,
            body: PopScope(
                canPop: false,
                child: Center(child: CircularProgressIndicator())),
          )
        : Scaffold(
            appBar: buildAppBar(
                title: "PDF View",
                onTap: () {
                  if (widget.value == 1) {
                    Get.offAll(HomePage());
                    Get.to(menuPage());
                    Get.put(MyOrdersController()).orderGet();
                  } else {
                    Get.back();
                  }
                },
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: IconButton(
                        onPressed: () {
                          deviceInfoPhone();
                        },
                        icon: Icon(Icons.file_download)),
                  )
                ]),
            body: PopScope(
              onPopInvoked: (didPop) {
                if (widget.value == 1) {
                  Get.offAll(HomePage());
                  Get.to(menuPage());
                  Get.put(MyOrdersController()).orderGet();
                }
              },
              child: SafeArea(
                child: PDFView(
                  filePath: urlPDFPath,
                  autoSpacing: true,
                  enableSwipe: true,
                  pageSnap: true,
                  swipeHorizontal: true,
                  nightMode: false,
                  onRender: (pages) {
                    setState(() {
                      _totalPages = pages!;
                      pdfReady = true;
                    });
                  },
                  onViewCreated: (PDFViewController vc) {
                    setState(() {
                      _pdfViewController = vc;
                    });
                  },
                  onPageChanged: (page, total) {
                    setState(() {
                      _currentPage = page!;
                    });
                  },
                ),
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  iconSize: 30.w,
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      if (_currentPage > 0) {
                        _currentPage--;
                        _pdfViewController.setPage(_currentPage);
                      }
                    });
                  },
                ),
                Text(
                  "${_currentPage + 1}/$_totalPages",
                  style: TextStyle(color: Colors.black, fontSize: 18.w),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  iconSize: 30.w,
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      if (_currentPage < _totalPages - 1) {
                        _currentPage++;
                        _pdfViewController.setPage(_currentPage);
                      }
                    });
                  },
                ),
              ],
            ),
          );
  }
}
