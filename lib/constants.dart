import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const weather_api_key = '5d5f389c6f585cea527bada7795f3d6f';
const icon_prefix = 'http://openweathermap.org/img/wn/';
const cities = [
  'Athens',
  'Berlin',
  'Cairo',
  'Dhaka',
  'Delhi',
  'Jakarta',
  'Karachi',
  'Los Angeles',
  'London',
  'Moscow',
  'Milan',
  'New York',
  'Paris',
  'Riyadh',
  'Rome',
  'Toronto',
  'Tehran',
  'Wuhan',
  'Yangon'
];
const icon_sufix = '@2x.png';
const txt16 = TextStyle(fontSize: 16);
const txt16w54 = TextStyle(fontSize: 16, color: Colors.white54);
const txt18 = TextStyle(fontSize: 18);
const txt18w54 = TextStyle(fontSize: 18, color: Colors.white54);
const txt20 = TextStyle(fontSize: 20);
const txt22 = TextStyle(fontSize: 22);
const txt60 = TextStyle(fontSize: 60);

final verticalBar = Container(
  width: 2,
  height: 50,
  color: Colors.white54,
);
