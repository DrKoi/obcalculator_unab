import 'dart:math';

import 'package:flutter/material.dart';

double degToRad(double deg) => deg * (pi / 180.0);

double normalize(value, min, max) => ((value - min) / (max - min));

const Color kScaffoldBackgroundColor = Color(0xFFF3FBFA);
const double kDiameter = 360;
const double kMin = 1;
const double kMax = 366;