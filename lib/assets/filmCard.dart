import 'package:flutter/material.dart';
import 'package:videotheque_app/data/filmStruct.dart';

class FilmCard extends StatefulWidget {
  const FilmCard({Key? key, required  this.film }) : super(key: key);

  final Film film;

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {


  void _toggleFavorite() {
    setState((){
      if(widget.film.isFavorite){
        widget.film.isFavorite = false;
      }
      else{
        widget.film.isFavorite = true;
      }
    });

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
                          widget.film.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(" (${widget.film.year})",
                          style: const TextStyle(fontStyle: FontStyle.italic),)
                      ],
                    )
                  ),
                  Text(widget.film.description)
                ],
              )
          ),
           Container(
             padding: const EdgeInsets.only(left: 8),
             child: Icon(
                 (widget.film.isFavorite
                 ? Icons.star
                 : Icons.star_border),
               color: Colors.red[500],

             ),
           )
        ],
      ),
    );


    return Card(
      margin: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context,
              '/second',
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
