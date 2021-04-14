import 'package:flutter/material.dart';

const color_primary = Color(0xFFB6F492);
const color_primary_opacity_medium = Color(0x80B6F492);
const color_primary_opacity_strong = Color(0x00B6F492);
const color_secondary = Color(0xFF63D1DB);

const color_green_dark = Color(0xFF1E2B16);

const color_gradient_primary = LinearGradient(
    begin: Alignment(-1.2, -1.0),
    end: Alignment(2.0, 0.0),
    colors: <Color>[color_primary, color_secondary]);

const color_gradient_secondary = LinearGradient(
    begin: Alignment(-1.0, -1.0),
    end: Alignment(1.0, 1.0),
    colors: <Color>[
      color_white,
      color_white_opacity_strong,
      color_primary_opacity_medium,
      color_primary_opacity_strong
    ]);

const color_gradient_glass = LinearGradient(
    begin: Alignment(0.0, -0.9),
    end: Alignment(0.5, 0.3),
    colors: [const Color(0x66FFFFFF), const Color(0x1AFFFFFF)]);

const color_white = Color(0xFFFFFFFF);
const color_white_opacity_strong = Color(0x00FFFFFF);
const color_black = Color(0xFF000000);
const color_black_opacity_strong = Color(0x1A000000);