import 'package:flutter/material.dart';
import 'package:flutter_map_search_app/data/model/location.dart';

Container item(Location item) {
  return Container(
    padding: EdgeInsets.all(20),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(item.category),
        Text(item.roadAddress),
      ],
    ),
  );
}
