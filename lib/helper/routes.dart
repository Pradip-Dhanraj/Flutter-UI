//App routes
import 'package:flutter/material.dart';
import 'package:thread/pages/dashboard.dart';

class ApllicationRoutes {
  static const routeToDashboard = "/dashboard";
  static const routeToLogin = "/login";
  static const routeToTestPage = "/test";
  static const routeToCamera = "/camera";
}

// void routeToPage(BuildContext context, String path) {
//   Navigator.pushNamed(context, path);
// }

// void routeToDashboard(BuildContext context) {
//   Route route = MaterialPageRoute(builder: (context) => Dashboard());
//   Navigator.pushReplacement(context, route);
// }

// void routePopPage(BuildContext context) {
//   // Navigate back to the first screen by popping the current route
//   // off the stack.
//   Navigator.pop(context);
// }

// void routeToPageWithData(BuildContext context, String path, Object dataobject) {
//   Navigator.pushNamed(context, path, arguments: dataobject);
// }

enum NaivigationRoute { push, pop, replace, dashboard }

void routeToPage({
  @required BuildContext context,
  String path,
  Object dataobject,
  Route route,
  @required NaivigationRoute action,
}) {
  switch (action) {
    case NaivigationRoute.pop:
      Navigator.pop(context);
      break;
    case NaivigationRoute.push:
      Navigator.pushNamed(context, path, arguments: dataobject);
      break;
    case NaivigationRoute.replace:
      Navigator.pushNamed(context, path, arguments: dataobject);
      break;
    case NaivigationRoute.dashboard:
      Route route = MaterialPageRoute(builder: (context) => Dashboard());
      Navigator.pushReplacement(context, route);
      break;
  }
}
