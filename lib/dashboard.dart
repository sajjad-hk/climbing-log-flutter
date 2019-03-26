import 'package:flutter/material.dart';
import 'routeLogs.dart';
import 'routeLogModel.dart';
import 'package:intl/intl.dart';
import 'routeWizard.dart';

enum SingingCharacter { lafayette, jefferson }

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  bool _wizardOpen;

  @override
  void initState() {
    super.initState();
    _wizardOpen = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [_buildDashboard()];

    if (_wizardOpen)
      children.add(RouteWizard(
        onClose: _hideRouteWizard,
      ));

    return Stack(
      children: children,
    );
  }

  void _showRouteWizard() {
    setState(() => _wizardOpen = true);
  }

  void _hideRouteWizard() {
    setState(() => _wizardOpen = false);
  }

  Widget _buildDashboard() {
    return Scaffold(
      backgroundColor: Color(0xffd8e2e5),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("CLIMBING LOG"),
            centerTitle: true,
            leading: Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
            ),

            backgroundColor: Color(0xFF000000),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.keyboard_tab),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            floating: false,
            pinned: true,
            // Display a placeholder Widget to visualize the shrinking size
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(top: 50.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      child: Center(
                        child: Placeholder(),
                      ),
                    ),
                    Container(
                      height: 200.0,
                      child: Center(
                        child: Placeholder(),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff165571),
                      Color(0xff0e1823),
                    ],
                  ),
                ),
              ),
            ),
            // Make the initial height of the SliverAppBar larger than normal
            expandedHeight: 300,
          ),
          RouteLogs2(
            routes: List<RouteLog>.generate(
              100,
              (i) => i % 6 == 0
                  ? HeadingItem(
                      DateFormat("EEEE, MMMM d, y").format(DateTime.now()),
                    )
                  : ClimbingRoute("6a+"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20.0,
        onPressed: _showRouteWizard,
        child: Icon(
          Icons.add,
          size: 45.0,
        ),
        backgroundColor: Color(0xffffdd00),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xff0e1823),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 37.0, top: 26.0),
                child: Text(
                  'CLIMBING LOG',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
