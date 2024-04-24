import 'package:digicat/all.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            navigatorKey: ApiData.navigatorKey,
            initialRoute: '/',
            routes: routesList,
            debugShowCheckedModeBanner: false,
            translations: Languages(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en', 'US'),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppBodyColor.yellow),
              fontFamily: "Roboto",
              useMaterial3: true,
            ),
          );
        });
  }
}
