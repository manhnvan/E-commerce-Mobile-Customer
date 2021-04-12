import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as grad;

class GlassCard extends StatelessWidget {
  Widget childWidget;
  double width = 0.0;

  GlassCard({this.childWidget, this.width});

  @override
  Widget build(BuildContext context) {
    // return grad.GradientCard(
    //     padding: EdgeInsets.all(0),
    //     clipBehavior: Clip.antiAlias,
    //     gradient: color_gradient_glass,
    //     shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(border_radius_small),
    //             topRight: Radius.circular(border_radius_big),
    //             bottomLeft: Radius.circular(border_radius_big),
    //             bottomRight: Radius.circular(border_radius_small))),
    //     child: this.childWidget);
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(border_radius_small),
              topRight: Radius.circular(border_radius_big),
              bottomLeft: Radius.circular(border_radius_big),
              bottomRight: Radius.circular(border_radius_small))),
      child: GlassmorphicContainer(
          padding: EdgeInsets.all(0),
          width: 166,
          height: 163,
          borderRadius: 0,
          linearGradient: color_gradient_glass,
          blur: 20,
          borderGradient: null,
          border: null,
          child: this.childWidget),
    );
  }
}
