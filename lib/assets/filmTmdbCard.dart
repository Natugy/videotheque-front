import 'dart:async';

import 'package:flutter/material.dart';
import 'package:videotheque_app/data/filmStruct.dart';

import '../data/tmdbFilmStruct.dart';

class TmdbFilmCard extends StatefulWidget {
  const TmdbFilmCard({Key? key, required  this.film }) : super(key: key);

  final TmdbFilm film;

  @override
  State<TmdbFilmCard> createState() => _TmdbFilmCardState();
}

class _TmdbFilmCardState extends State<TmdbFilmCard> {


  String desc(String description){
    if(description.length<50){
      return description;
    }
    else {
      return "${description.substring(0,50)}...";
    }
  }

  String title(String title){
    if(title.length<35){
      return title;
    }
    else {
      return "${title.substring(0,33)}...";
    }
  }

  String date(String title){
    if(title.length<3){
      return title;
    }
    else {
      return title.substring(0,4);
    }
  }
  
  FutureOr onGoBack(dynamic value) {

  }

  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(

                      children: [
                        Text(
                          title(widget.film.title),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(" (${date(widget.film.year!)})",
                          style: const TextStyle(fontStyle: FontStyle.italic),)
                      ],
                    )
                  ),
                  Text(desc(widget.film.description!)),



                ],
              )
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text("${widget.film.vote}"),


        ],
      ),
    );


    return Card(
      margin: const EdgeInsets.all(12),
      child: InkWell(
        onTap: ()  {
          Navigator.pushNamed(context,
              '/details',
          arguments: widget.film);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            titleSection,
          ],
        ),
      ),

    );
  }
}
