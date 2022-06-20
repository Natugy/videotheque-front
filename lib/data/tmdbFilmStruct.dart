import 'package:flutter/material.dart';

class TmdbFilm {
  int id=0 ;
  String title;
  String? description;
  String? year;
  String? posterPath ;

  String? vote;
  bool? isFavorite =false;
  bool? added= false;





  TmdbFilm({required this.id ,required this.title, this.description, required this.year, this.posterPath, this.vote,this.added });

  factory TmdbFilm.fromTmdbJson(Map<String, dynamic> json) {
    return TmdbFilm(id: json['id'],
        title: json['title']
        , description: json['overview']
        , year: json['release_date'],
        posterPath: json['poster_path'],
      vote: json['vote_average'].toString(),

        );
  }

  factory TmdbFilm.fromJson(Map<String, dynamic> json) {
    return TmdbFilm(id: json['id'],
        title: json['title']
        , description: json['description']
        , year: json['year'],
        posterPath: json['posterPath'],
        vote: json['rating'].toString(),
      added: json['added']
    );
  }


}