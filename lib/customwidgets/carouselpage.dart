import 'package:flutter/material.dart';
import 'package:thread/customwidgets/delayedanimation.dart';

class CarouselPage extends StatefulWidget {
  final PageController controller = PageController();
  final List<Object> itemsSource;
  final Function templateFunction;
  CarouselPage({@required this.itemsSource, @required this.templateFunction});

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
    return StreamBuilder(
      stream: Stream.fromIterable(widget.itemsSource),
      initialData: [],
      builder: (context, AsyncSnapshot snap) {
        return PageView.builder(
            controller: widget.controller,
            itemCount: widget.itemsSource.length,
            itemBuilder: (BuildContext context, int currentIdx) {
              if (currentIdx == 0) {
                return _buildTagPage();
              } else if (widget.itemsSource.length >= currentIdx) {
                // Active page
                bool active = currentIdx == currentPage;
                return _buildStoryPage(widget.itemsSource[currentIdx - 1], active);
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
          'HIGHLIGHTS',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white54,
          ),
        ),
        Text('SWIPE LEFT TO KNOW MORE',
            style: TextStyle(
              color: Colors.white54,
            )),
      ],
    ));
  }

  _buildStoryPage(Object data, bool active) {
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
        child: widget.templateFunction(data),
      ),
    );
  }
}
