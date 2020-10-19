import 'package:flutter/material.dart';

import 'package:my_navigation_bar/models/navigation_item.dart';

//The class is used to Build a Navigation Item Based on variety of  situation
class NavigationItemBuilder extends StatefulWidget {
  const NavigationItemBuilder(
      {Key key,
      this.isSelected,
      this.item,
      this.navigationItemEnteringNumber,
      this.isMovingRight})
      : super(key: key);
  final bool isSelected;
  final NavigationItem item;
  final int navigationItemEnteringNumber;
  final bool isMovingRight;

  @override
  _NavigationItemBuilderState createState() => _NavigationItemBuilderState();
}

class _NavigationItemBuilderState extends State<NavigationItemBuilder> {
  int space = 40;
  int spacePadding = 40; // The variable is Used to control The padding Of the text and also used the create sliding view
  bool isMovingRight = true;
  int internalNavigationItemEnteringNumber; // to control te latest values of the stateFullWidget in time moving back to widget

  @override
  void initState() {
    internalNavigationItemEnteringNumber = widget.navigationItemEnteringNumber;
    if (widget.isSelected) {
      _changePadding();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSelected &&
        internalNavigationItemEnteringNumber !=
            widget.navigationItemEnteringNumber ) {
      internalNavigationItemEnteringNumber =
          widget.navigationItemEnteringNumber;
      isMovingRight = widget.isMovingRight;

      _changePadding();
    }

    return Container(

      width: (widget.isSelected && widget.item.titleWhite.data.length != 0)
          ? 100
          : (widget.isSelected && widget.item.titleWhite.data.length == 0)
              ? 50
              : null,
      decoration: BoxDecoration(
        color: widget.isSelected ? Colors.black87 : Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 8,left: 8, right: 8 ),//
        child: SingleChildScrollView(
          reverse: isMovingRight ? false : true,
          scrollDirection: Axis.horizontal,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: (widget.isSelected && isMovingRight)
                    ? double.parse(spacePadding.toString())
                    : 3,
              ),
              widget.isSelected ? widget.item.iconWhite : widget.item.iconBlack,
              widget.item.titleWhite.data.length != 0 ? SizedBox(
                width: 5,
              ) : SizedBox(),
              widget.isSelected ? widget.item.titleWhite : Container(),
              SizedBox(
                width: (widget.isSelected && !isMovingRight )
                    ? double.parse(spacePadding.toString())
                    : 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _changePadding() async { //  Custom sliding view for each NavigationItem

    for (int i = space; i >= 8; i--) {
      await Future.delayed(Duration(microseconds: 700));
      setState(() {
        spacePadding = i;
      });
    }

  }


}
