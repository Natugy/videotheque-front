import 'package:flutter/material.dart';

class Film {
  String id ;
  String title;
  String description;
  String year;
  bool isFavorite = false;


  Film({required this.id ,required this.title, required this.description, required this.year, required this.isFavorite});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(id: json['id'],
        title: json['title']
        , description: json['description']
        , year: json['year'],
        isFavorite: json['isFavorite']);
  }
}