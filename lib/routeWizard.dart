import 'package:flutter/material.dart';
import 'success.dart';
import 'grade.dart';
import 'belay.dart';
import 'tags.dart';

class RouteWizard extends StatefulWidget {
  RouteWizard({Key key, this.currentPageIndex, this.onClose}) : super(key: key);

  final int currentPageIndex;
  final GestureTapCallback onClose;

  @override
  _RouteWizardState createState() => _RouteWizardState();
}

class _RouteWizardState extends State<RouteWizard> {
  int currentPageIndex;

  @override
  void initState() {
    super.initState();
    currentPageIndex = 0;
  }

  _pervious() {
    int index = currentPageIndex > 0 ? currentPageIndex - 1 : currentPageIndex;
    setState(() {
      currentPageIndex = index;
    });
    // _controller.animateToPage(index,
    //     duration: Duration(milliseconds: 300), curve: Curves.easeOutQuart);
  }

  _next() {
    int index = currentPageIndex < 3 ? currentPageIndex + 1 : currentPageIndex;
    setState(() {
      currentPageIndex = index;
    });
    // _controller.animateToPage(index,
    //     duration: Duration(milliseconds: 300), curve: Curves.easeOutQuart);
  }

  _buildRouteWizardModal(int ind) {
    List<Widget> pages = <Widget>[
      _buildRouteWizardWrap(Success()),
      _buildRouteWizardWrap(Grade()),
      _buildRouteWizardWrap(Belay()),
      _buildRouteWizardWrap(Tags()),
    ];

    return pages[ind];
  }

  _buildRouteWizardWrap(Widget content) {
    return SizedBox.expand(
      child: Container(
        color: Color(0xffb3000000),
        padding:
            const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
        child: GestureDetector(
          onHorizontalDragEnd: (c) {
            if (c.velocity.pixelsPerSecond.dx > 1000) _pervious();
            if (c.velocity.pixelsPerSecond.dx < -1000) _next();
          },
          child: Card(
            color: Color(0xffffdd00),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.all(5.0),
                      icon: Icon(
                        Icons.close,
                        size: 40.0,
                        color: Colors.white,
                      ),
                      onPressed: widget.onClose,
                    ),
                  ],
                ),
                content,
                Expanded(
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.navigate_before,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: _pervious,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: _next,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(RouteWizard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentPageIndex != oldWidget.currentPageIndex) {
      setState(() {
        currentPageIndex = widget.currentPageIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildRouteWizardModal(currentPageIndex);
  }
}
