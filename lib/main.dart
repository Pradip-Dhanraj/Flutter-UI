import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:thread/pages/camera.dart';
import 'package:thread/pages/dashboard.dart';
import 'package:thread/pages/login.dart';
import 'package:thread/helper/routes.dart';
import 'package:thread/helper/theme.dart';
import 'package:thread/helper/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.length > 0 ? cameras.first : null;

  runApp(
    MaterialApp(
      title: ApplicationTexts.appTitle,
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: ApllicationRoutes.routeToLogin,
      routes: {
        ApllicationRoutes.routeToLogin: (context) => Login(),
        ApllicationRoutes.routeToDashboard: (context) => Dashboard(),
        //ApllicationRoutes.routeToTestPage: (context) => TestPage(),
        ApllicationRoutes.routeToCamera: (context) => TakePictureScreen(
              camera: firstCamera,
            ),
        // AppConstant.routeToSplashScreen: (context) => SplashScreen(
        //     'assets/splash.flr', Login(),
        //     startAnimation: 'Untitled',
        //     backgroundColor: Theme.of(context).primaryColor),
      },
    ),
  );
}
