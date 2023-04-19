import 'package:flutter/material.dart';

class DefaultValues{
  List defaultNavigationList = [
    {
      "icon": const Icon(Icons.home, color: Colors.grey,),
      "activeIcon": const Icon(Icons.home),
      "label": 'Streams'
    },
    {
      "icon": const Icon(Icons.school,color: Colors.grey),
      "activeIcon": const Icon(Icons.school),
      "label": 'Students',
    },
    {
      "icon": const Icon(Icons.edit_note,color: Colors.grey),
      "label": 'Profile',
      "activeIcon": const Icon(Icons.edit_note),
    }
  ];
}