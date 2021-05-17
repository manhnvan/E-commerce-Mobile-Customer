import 'package:flutter/material.dart';

class Variables extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container();
  }
}

const border_radius_small = 3.0;
const border_radius_big = 20.0;
const border_radius_huge = 60.0;

// ignore: non_constant_identifier_names
var box_shadow_black = BoxShadow(
  color: Colors.blue,
  blurRadius: 24.0, // soften the shadow
  spreadRadius: -1.0, //extend the shadow
  offset: Offset(
    0.0,
    0.5,
  ),
);

const height_hero = 340.0;

const space_tiny = 4.0;
const space_small = 8.0;
const space_medium = 16.0;
const space_big = 24.0;
const space_huge = 32.0;