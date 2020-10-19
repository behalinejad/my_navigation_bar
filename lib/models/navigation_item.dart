import 'package:flutter/material.dart';

class NavigationItem {
  NavigationItem(this.iconBlack,this.iconWhite,this.titleWhite);

  final Icon iconBlack;// black Color for the time that NavigationItem lose the Focus
  final Icon iconWhite; // white Color for the time that NavigationItem gets the Focus
  final Text titleWhite;



}