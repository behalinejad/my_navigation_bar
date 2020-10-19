import 'package:flutter/material.dart';
import 'package:my_navigation_bar/bloc/navigation_bar_bloc.dart';
import 'package:my_navigation_bar/custom_widgets/my_bottom_drawer.dart';
import 'package:my_navigation_bar/custom_widgets/my_bottom_navigation_Bar.dart';
import 'package:provider/provider.dart';


// The application is an Assignment

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Navigation Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage.create(context),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static Widget create(BuildContext context) { // Provider Package to manage State on homePage on changing NavigationItems
    return Provider<NavigationBarBloc>(
      builder: (_) => NavigationBarBloc(),
      dispose: (context, bloc) => bloc.dispose(),
      child: MyHomePage(),
    );
  }

  final String title = 'My Navigation Bar';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showMyBottomDrawer = false; // variable to monitor the state of customBottomDrawer
  int currentNavigationItem = 0; // it Shows the current NavigationItem on custom Navigation bar

  void _incrementCounter() {
    setState(() {
      //_counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<NavigationBarBloc>(context); // the NavigationBar Bloc
    var threshold = 50; // to monitor the speed of user's scroll action . min of pixel per second for detecting scroll
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector( // The Widget is used to detect the scrolling action by user on the screen to control custom Bottom Drawer
        onPanEnd: (detail) {
          if (detail.velocity.pixelsPerSecond.dy > threshold) { // Scrolling upward
            showMyBottomDrawer = true;
            bloc.setNavigationItem(2);
          } else if (detail.velocity.pixelsPerSecond.dy < -threshold) { // Scrolling Downward
            showMyBottomDrawer = false;
            bloc.setNavigationItem(5);
          }
        },
        child: Container(
          color: Colors.blueGrey,
          child: Stack(
            children: [
              Center(
                child: StreamBuilder(   // Stream Builder for Body state Management controlled by NavigationBarBloc
                  stream: bloc.navigationItemStream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return _buildHomeBody(
                          context,
                          snapshot.data); //Body of the Scaffold for State Management using Bloc
                    else
                      return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton( // default floating button by flutter
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  Widget _buildHomeBody(BuildContext context, int navigationItem) {
    if (navigationItem == 0) {
      return Stack(
        children: [
          AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 500),
              width: MediaQuery.of(context).size.width,
              bottom : -170,
              height: 180,
              child: MyBottomDrawer()),
        Container(

         color: Colors.indigo,
        ),
        ],
      );

    } else if (navigationItem == 1) {
      return Container(
        color: Colors.amber,
      );
    } else if (navigationItem == 3) {
      return Container(
        color: Colors.green,
      );
    } else if (navigationItem == 4) {
      return Container(
        color: Colors.brown,
      );
    } else
     {
      double startPoint = 0;
       if(navigationItem==2) {
        showMyBottomDrawer = true;
      //  startPoint = -170;
      }
      return Stack(
        children: [
          AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 500),
              width: MediaQuery.of(context).size.width,
              bottom: showMyBottomDrawer ? startPoint : -170,
              height: 180,
              child: MyBottomDrawer()),
        ],
      );
    }
  }
}
