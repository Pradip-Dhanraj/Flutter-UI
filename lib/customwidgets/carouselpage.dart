import 'package:flutter/material.dart';
import 'package:thread/customwidgets/delayedanimation.dart';
import 'package:thread/pages/thread.dart';

class CarouselPage extends StatefulWidget {
  final PageController controller = PageController();
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  String activeTag;
  int currentPage;

  @override
  void initState() {
    widget.controller.addListener(() {
      int next = widget.controller.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lst = [
      "https://i.pinimg.com/736x/cb/f4/78/cbf4781a70862ffb8c43ce1d4b991620.jpg",
      "https://i.pinimg.com/736x/cb/f4/78/cbf4781a70862ffb8c43ce1d4b991620.jpg",
      "https://i.pinimg.com/736x/cb/f4/78/cbf4781a70862ffb8c43ce1d4b991620.jpg",
      "https://i.pinimg.com/736x/cb/f4/78/cbf4781a70862ffb8c43ce1d4b991620.jpg",
    ];
    return StreamBuilder(
      stream: Stream.fromIterable(lst),
      initialData: [],
      builder: (context, AsyncSnapshot snap) {
        return PageView.builder(
            controller: widget.controller,
            itemCount: lst.length,
            itemBuilder: (BuildContext context, int currentIdx) {
              if (currentIdx == 0) {
                return _buildTagPage();
              } else if (lst.length >= currentIdx) {
                // Active page
                bool active = currentIdx == currentPage;
                return _buildStoryPage(lst[currentIdx - 1], active);
              }
            });
      },
    );
  }

  _buildTagPage() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Stories',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white54,
          ),
        ),
        Text('FILTER',
            style: TextStyle(
              color: Colors.white54,
            )),
      ],
    ));
  }

  _buildStoryPage(String data, bool active) {
    // Animated Properties
    //final double blur = active ? 30 : 0;
    //final double offset = active ? 20 : 0;
    //final double top = active ? 100 : 200;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.all(5),
      height: double.infinity,
      width: 100,
      child: Delayedaimation(
        milliseconsdelay: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Stories',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white54,
              ),
            ),
            Text('FILTER',
                style: TextStyle(
                  color: Colors.white54,
                )),
          ],
        ),
      ),
    );
  }
}
