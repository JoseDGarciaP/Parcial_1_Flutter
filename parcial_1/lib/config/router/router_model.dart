import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterModel {
  String name;
  String title;
  String description;
  String path;
  GoRouterWidgetBuilder widget;
  IconData icon;


  RouterModel({
    required this.name,
    required this.title,
    required this.description,
    required this.path,
    required this.widget,
    required this.icon,
  });


}
