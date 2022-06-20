import 'package:flutter/material.dart';
import 'package:videotheque_app/data/dataService.dart';
import 'package:videotheque_app/data/tmdbFilmStruct.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;



class DetailFilm extends StatefulWidget {
  const DetailFilm({super.key});

  @override
  State<DetailFilm> createState() => _DetailFilmState();
}

class _DetailFilmState extends State<DetailFilm> {

  

  Future<void> addFilm(TmdbFilm film, bool inBDD) async {

    setState((){
      if(inBDD){
        final param = {
          "title": film.title
        };
        delete(param);
        inBDD = false;
        film.added=false;
        Navigator.pushNamed(context, "/");
      }
      else{
        final parameters={
          "title": film.title,
          "description": film.description,
          "year": film.year,
          "tmdbId": film.id.toString(),
          "rating":film.vote.toString(),
          "posterPath": film.posterPath
        };
        post(parameters);
        inBDD =true;
        film.added =null;
      }


    });
  }




  @override
  Widget build(BuildContext context) {
    final film = ModalRoute.of(context)!.settings.arguments as TmdbFilm;
    Future<bool> inBDD = filmExist(film.title);

    Widget titleSection= FutureBuilder<bool>(
      future: inBDD,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child:  Text(
                                film.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${film.year}   ",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.red[500],
                                ),
                                Text("${film.vote}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      /*3*/
                      IconButton(
                        onPressed: (){
                          addFilm(film, snapshot.data!);
                        },
                        icon: Icon(
                          (snapshot.data!
                              ? Icons.check
                              : Icons.add),
                          color: Colors.green[500],

                        ),
                      )

                    ],
                  ),
                );
              }
          }
        },
    );

    Color color = Theme.of(context).primaryColor;


    Widget description =  Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        film.description!,
        style: const TextStyle(
         height: 1.5
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Description"),
        ),
        body:Card(
          margin: const EdgeInsets.all(12),
            child: ListView(

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network("https://image.tmdb.org/t/p/w500/${film.posterPath}")

                ),
                titleSection,
                description,
              ],
          )
        )
    );
  }
}
