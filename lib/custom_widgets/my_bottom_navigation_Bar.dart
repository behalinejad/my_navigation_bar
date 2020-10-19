import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_navigation_bar/bloc/navigation_bar_bloc.dart';
import 'package:my_navigation_bar/custom_widgets/navigation_item_builder.dart';
import 'package:my_navigation_bar/models/navigation_item.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatefulWidget {


  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int navigationItemEnteringNumber = 0 ; // The variable is used for controlling the sliding  Of selected Item
  bool isMovingRight = true; // The variable is used to check the direction Of sliding
  List<NavigationItem> items = [ // list Of Navigation Items
    NavigationItem(
      Icon(Icons.home),
      Icon(
        Icons.home,
        color: Colors.white,
      ),
      Text(
        'Home',
        style: TextStyle(color: Colors.white),
      ),
    ),
    NavigationItem(
      Icon(Icons.store),
      Icon(
        Icons.store,
        color: Colors.white,
      ),
      Text(
        'Store',
        style: TextStyle(color: Colors.white),
      ),
    ),
    NavigationItem(
      Icon(Icons.add),
      Icon(
        Icons.add,
        color: Colors.white,
      ),
      Text(
        '',
        style: TextStyle(color: Colors.white),
      ),
    ),
    NavigationItem(
      Icon(Icons.explore),
      Icon(
        Icons.explore,
        color: Colors.white,
      ),
      Text(
        'Explore',
        style: TextStyle(color: Colors.white),
      ),
    ),
    NavigationItem(
      Icon(Icons.person),
      Icon(
        Icons.person,
        color: Colors.white,
      ),
      Text(
        'Profile',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ];
  int selectedIndex = 0; // Shows the latest Selected Navigation Item by user

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: 60,
      padding: EdgeInsets.only(right: 15, left: 15),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          int itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () async {
              if (selectedIndex <= itemIndex) { // The loop for moving right in Navigation Bar
                for (int i = selectedIndex; i <= itemIndex; i++) {
                  await Future.delayed(Duration(milliseconds: 10));
                  setState(() {
                    selectedIndex = i;
                    isMovingRight = true;
                    navigationItemEnteringNumber++;
                  });
                }
              } else {
                for (int i = selectedIndex; i >= itemIndex; i--) { // The loop for moving left in Navigation Bar
                  await Future.delayed(Duration(milliseconds: 10));
                  setState(() {
                    selectedIndex = i;
                    isMovingRight = false;
                    navigationItemEnteringNumber++;
                  });
                }
              }

              final bloc = Provider.of<NavigationBarBloc>(context);
              bloc.setNavigationItem(itemIndex); // State Management
              },
            child: NavigationItemBuilder(item: item,isSelected:selectedIndex == itemIndex,navigationItemEnteringNumber: navigationItemEnteringNumber,isMovingRight: isMovingRight,)

          );
        }).toList(),
      ),
    );
  }


}
