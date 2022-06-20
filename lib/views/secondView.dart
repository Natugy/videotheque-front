import 'package:flutter/material.dart';
import 'package:videotheque_app/assets/appDrawer.dart';
import 'package:videotheque_app/data/dataService.dart';
import 'package:videotheque_app/data/filmStruct.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Film;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Description"),
      ),
      body: FilmDescription(film: args,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final param = {
            "title": args.title,
            "isFav": args.isFavorite.toString()
          };
          
          update(param);

          Navigator.pushNamed(context, "/");
        },
        child: const Icon(Icons.save),
      ),
    );


  }
}

class FilmDescription extends StatefulWidget {
  const FilmDescription({Key? key, required this.film}) : super(key: key);

  final Film film;

  @override
  State<FilmDescription> createState() => _FilmDescriptionState();
}

class _FilmDescriptionState extends State<FilmDescription> {

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
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            widget.film.title,

                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),
                      ),
                        )
                    ),
                    IconButton(
                        onPressed: _toggleFavorite,
                        icon: (widget.film.isFavorite
                            ? const Icon(Icons.star)
                            : const Icon(Icons.star_border)),
                        color: Colors.red[500],

                    ),
                    IconButton(
                      onPressed: (){
                        final param = {
                          "title": widget.film.title
                        };
                        delete(param);
                         Navigator.pushNamed(context, "/");
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red[500],),

                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12, top: 12),
                  child: Text(widget.film.description),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
