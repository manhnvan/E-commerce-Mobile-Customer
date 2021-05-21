import 'dart:ui';

import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:flutter/material.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as grad;

// ignore: must_be_immutable
class GlassCard extends StatelessWidget {
  Widget childWidget;
  double width;
  bool backgroundWhite;

  GlassCard({this.childWidget, this.width, this.backgroundWhite});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(border_radius_small),
          topRight: Radius.circular(border_radius_big),
          bottomRight: Radius.circular(border_radius_small),
          bottomLeft: Radius.circular(border_radius_big)),
      child: Container(
        margin: this.width == MediaQuery.of(context).size.width
            ? EdgeInsets.only(bottom: space_medium)
            : EdgeInsets.only(right: space_medium),
        width: this.width == MediaQuery.of(context).size.width
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width * 0.4,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          gradient: color_gradient_secondary,
        ),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: grad.GradientCard(
              padding: EdgeInsets.all(0),
              clipBehavior: Clip.antiAlias,
              gradient: backgroundWhite ? color_white : color_gradient_glass,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(border_radius_small - 1),
                      topRight: Radius.circular(border_radius_big - 1),
                      bottomLeft: Radius.circular(border_radius_big - 1),
                      bottomRight: Radius.circular(border_radius_small -1))),
              child: this.childWidget),
        ),
      ),
    );
    // return Card(
    //   clipBehavior: Clip.antiAlias,
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(border_radius_small),
    //           topRight: Radius.circular(border_radius_big),
    //           bottomLeft: Radius.circular(border_radius_big),
    //           bottomRight: Radius.circular(border_radius_small))),
    //   child: GlassmorphicContainer(
    //       padding: EdgeInsets.all(0),
    //       width: 166,
    //       height: 163,
    //       borderRadius: 0,
    //       linearGradient: color_gradient_glass,
    //       blur: 20,
    //       borderGradient: null,
    //       border: null,
    //       child: this.childWidget),
    // );
  }
}
