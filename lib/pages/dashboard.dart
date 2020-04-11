import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thread/customwidgets/circularwidget.dart';
import 'package:thread/helper/helper.dart';
import 'package:thread/helper/theme.dart';
import 'package:thread/models/categoryinfo.dart';
import 'package:thread/services/getservice.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:thread/helper/routes.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  bool _isLoading = true;
  double appwidth;
  double appheight;
  double bannerheight;
  double bodyheight;
  AnimationController fadecontroller;
  Animation fadeanimation;

  @override
  void initState() {
    _isLoading = false;
    fadecontroller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    fadeanimation = CurvedAnimation(
      parent: fadecontroller,
      curve: Curves.easeIn,
    );
    fadecontroller.forward();
    super.initState();
  }

  Widget animatedContainer({Widget view}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
      child: view,
      width: appwidth,
      height: bodyheight,
    );
  }

  Widget fadeAnimationContainer({Widget view}) {
    return FadeTransition(
      opacity: fadeanimation,
      child: view,
    );
  }

  Widget getRecentBlogs() {
    var list = GetRecentBanner.recetblogslist;
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          color: Colors.blue,
          child: Text(list[index]?.title),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }

  Widget blogTemplate() {
    return Padding(
      padding: EdgeInsets.only(left: 5.00),
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: shade01)),
        onPressed: null,
        child: Container(
          width: appwidth * .3,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781974713325/naruto-sasukes-story-star-pupil-9781974713325_lg.jpg",
                fit: BoxFit.scaleDown,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCategoryStatus(CategoryInfo categoryInfo) {
    if (categoryInfo.total == 0) {}
    var displaymessage = categoryInfo.total == 0
        ? categoryInfo.message
        : '${(categoryInfo.completed / categoryInfo.total) * 100}%';
    return Padding(
      padding: EdgeInsets.only(top: 20.00),
      child: Container(
        width: (appwidth * .9) / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              categoryInfo.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: shade01,
              ),
            ),
            getCircularWidget(
                text: '$displaymessage',
                fontsize: (appheight * .7) * .025,
                height: (appheight * .7) * .15,
                width: (appheight * .7) * .15,
                value: fadecontroller.value * 150),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.appwidth = MediaQuery.of(context).size.width;
    this.appheight = MediaQuery.of(context).size.height;
    setState(() {
      bannerheight = appheight * .3;
      bodyheight = appheight * .6;
    });
    return Scaffold(
      body: appContainer(
          view: _isLoading
              ? getLoaderLayout()
              : AnimatedBuilder(
                  animation: fadecontroller,
                  builder: (BuildContext context, Widget child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        fadeAnimationContainer(
                          view: Container(
                            height: bannerheight,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image:
                                      "https://comicvine1.cbsistatic.com/uploads/original/11137/111372405/7077221-n68maopzj3m31.jpg",
                                  fit: BoxFit.fitWidth,
                                ),
                                // Image.network(
                                //   "https://comicvine1.cbsistatic.com/uploads/original/11137/111372405/7077221-n68maopzj3m31.jpg",
                                //   fit: BoxFit.fitWidth,
                                // ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          print("profile clicked");
                                          routeToPage(
                                            context: context,
                                            path:
                                                ApllicationRoutes.routeToCamera,
                                            action: NaivigationRoute.push,
                                          );
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          maxRadius: appheight * .05,
                                          backgroundImage: NetworkImage(
                                              "https://cdn161.picsart.com/226453951037202.jpg?type=webp&to=min&r=640"),
                                        ),
                                      ),
                                      Text(
                                        "Naruto Uzumaki",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        fadeAnimationContainer(
                          view: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                begin: Alignment(1, 0),
                                end: Alignment(1, 1),
                                colors: [
                                  Colors.white,
                                  shade01,
                                ],
                              ),
                            ),
                            height: appheight * .6,
                            child: ListView(
                              children: <Widget>[
                                Container(
                                  height: (appheight * .6) * .35,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      blogTemplate(),
                                      blogTemplate(),
                                      blogTemplate(),
                                      blogTemplate(),
                                      blogTemplate(),
                                    ],
                                  ),
                                ),
                                Container(
                                  //height: (appheight * .6) * .6,
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          _getCategoryStatus(
                                              GetRecentBanner.categoryInfo[0]),
                                          _getCategoryStatus(
                                              GetRecentBanner.categoryInfo[1]),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          _getCategoryStatus(
                                              GetRecentBanner.categoryInfo[2]),
                                          _getCategoryStatus(
                                              GetRecentBanner.categoryInfo[3]),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
          appheight: this.appheight,
          appwidth: this.appwidth),
    );
  }
}

// class DashboardState extends State<Dashboard> with TickerProviderStateMixin {
//   bool _isLoading = true;
//   double appwidth;
//   double appheight;
//   double bannerheight;
//   double bodyheight;
//   AnimationController fadecontroller;
//   Animation fadeanimation;

//   @override
//   void initState() {
//     _isLoading = false;
//     fadecontroller = AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this);
//     fadeanimation = CurvedAnimation(
//       parent: fadecontroller,
//       curve: Curves.easeIn,
//     );

//     // fadeanimation.addStatusListener((status) {
//     //   if (status == AnimationStatus.completed) {
//     //     fadecontroller.reverse();
//     //   } else if (status == AnimationStatus.dismissed) {
//     //     fadecontroller.forward();
//     //   }
//     // });

// //this will start the animation
//     fadecontroller.forward();
//     super.initState();
//   }

//   Widget animatedContainer({Widget view}) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 800),
//       curve: Curves.fastOutSlowIn,
//       child: view,
//       width: appwidth,
//       height: bodyheight,
//     );
//   }

//   Widget fadeAnimationContainer({Widget view}) {
//     return FadeTransition(
//       opacity: fadeanimation,
//       child: view,
//     );
//   }

//   Widget getRecentBlogs() {
//     var list = GetRecentBanner.recetblogslist;
//     return ListView.builder(
//       itemCount: list.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           height: 100,
//           color: Colors.blue,
//           child: Text(list[index]?.title),
//         );
//       },
//       scrollDirection: Axis.horizontal,
//     );
//   }

//   ListView recentThreads(BuildContext context) {
//     return ListView.builder(itemBuilder: null);
//   }

//   Widget _getDashboardLayout(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           fadeAnimationContainer(
//             view: Container(
//               height: bannerheight,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//               ),
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: <Widget>[
//                   FadeInImage.memoryNetwork(
//                     placeholder: kTransparentImage,
//                     image:
//                         "https://comicvine1.cbsistatic.com/uploads/original/11137/111372405/7077221-n68maopzj3m31.jpg",
//                     fit: BoxFit.fitWidth,
//                   ),
//                   // Image.network(
//                   //   "https://comicvine1.cbsistatic.com/uploads/original/11137/111372405/7077221-n68maopzj3m31.jpg",
//                   //   fit: BoxFit.fitWidth,
//                   // ),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         GestureDetector(
//                           onTap: () {
//                             print("profile clicked");
//                           },
//                           child: CircleAvatar(
//                             backgroundColor: Colors.grey,
//                             maxRadius: appheight * .05,
//                             backgroundImage: NetworkImage(
//                                 "https://cdn161.picsart.com/226453951037202.jpg?type=webp&to=min&r=640"),
//                           ),
//                         ),
//                         Text(
//                           "Naruto Uzumaki",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           fadeAnimationContainer(
//             view: Container(
//               height: bodyheight,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//                 gradient: LinearGradient(
//                   begin: Alignment(1, 0),
//                   end: Alignment(1, 1),
//                   colors: [
//                     Colors.white,
//                     shade01,
//                   ],
//                 ),
//               ),
//               child: getRecentBlogs(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget blogTemplate() {
//     return Padding(
//       padding: EdgeInsets.only(left: 5.00),
//       child: RaisedButton(
//         padding: EdgeInsets.all(0),
//         clipBehavior: Clip.hardEdge,
//         shape: RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(18.0),
//             side: BorderSide(color: shade01)),
//         onPressed: null,
//         child: Container(
//           width: appwidth * .3,
//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               FadeInImage.memoryNetwork(
//                 placeholder: kTransparentImage,
//                 image:
//                     "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781974713325/naruto-sasukes-story-star-pupil-9781974713325_lg.jpg",
//                 fit: BoxFit.scaleDown,
//               ),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: Icon(
//                   Icons.edit,
//                   color: Colors.black,
//                   size: 40,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _getCategoryStatus(CategoryInfo categoryInfo) {
//     if (categoryInfo.total == 0) {}
//     var displaymessage = categoryInfo.total == 0
//         ? categoryInfo.message
//         : '${(categoryInfo.completed / categoryInfo.total) * 100}%';
//     return Padding(
//       padding: EdgeInsets.only(top: 20.00),
//       child: Container(
//         width: (appwidth * .9) / 2,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               categoryInfo.title,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: shade01,
//               ),
//             ),
//             getCircularWidget(
//                 text: '$displaymessage',
//                 fontsize: (appheight * .7) * .025,
//                 height: (appheight * .7) * .15,
//                 width: (appheight * .7) * .15,
//                 value: 150),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _getlayout(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         fadeAnimationContainer(
//           view: Container(
//             height: bannerheight,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             child: Stack(
//               fit: StackFit.expand,
//               children: <Widget>[
//                 FadeInImage.memoryNetwork(
//                   placeholder: kTransparentImage,
//                   image:
//                       "https://comicvine1.cbsistatic.com/uploads/original/11137/111372405/7077221-n68maopzj3m31.jpg",
//                   fit: BoxFit.fitWidth,
//                 ),
//                 // Image.network(
//                 //   "https://comicvine1.cbsistatic.com/uploads/original/11137/111372405/7077221-n68maopzj3m31.jpg",
//                 //   fit: BoxFit.fitWidth,
//                 // ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       GestureDetector(
//                         onTap: () {
//                           print("profile clicked");
//                           routeToPage(context, ApllicationRoutes.routeToCamera);
//                         },
//                         child: CircleAvatar(
//                           backgroundColor: Colors.grey,
//                           maxRadius: appheight * .05,
//                           backgroundImage: NetworkImage(
//                               "https://cdn161.picsart.com/226453951037202.jpg?type=webp&to=min&r=640"),
//                         ),
//                       ),
//                       Text(
//                         "Naruto Uzumaki",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         fadeAnimationContainer(
//           view: Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//               gradient: LinearGradient(
//                 begin: Alignment(1, 0),
//                 end: Alignment(1, 1),
//                 colors: [
//                   Colors.white,
//                   shade01,
//                 ],
//               ),
//             ),
//             height: appheight * .6,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: (appheight * .6) * .35,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: <Widget>[
//                       blogTemplate(),
//                       blogTemplate(),
//                       blogTemplate(),
//                       blogTemplate(),
//                       blogTemplate(),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     _getCategoryStatus(GetRecentBanner.categoryInfo[0]),
//                     _getCategoryStatus(GetRecentBanner.categoryInfo[1]),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     _getCategoryStatus(GetRecentBanner.categoryInfo[2]),
//                     _getCategoryStatus(GetRecentBanner.categoryInfo[3]),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     this.appwidth = MediaQuery.of(context).size.width;
//     this.appheight = MediaQuery.of(context).size.height;
//     setState(() {
//       bannerheight = appheight * .3;
//       bodyheight = appheight * .6;
//     });
//     return Scaffold(
//       body: appContainer(
//           view: _isLoading ? getLoaderLayout() : _getlayout(context),
//           appheight: this.appheight,
//           appwidth: this.appwidth),
//     );
//   }
// }
