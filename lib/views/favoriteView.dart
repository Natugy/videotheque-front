import 'package:flutter/material.dart';
import 'package:videotheque_app/assets/appDrawer.dart';
import 'package:videotheque_app/data/filmList.dart';
import 'package:videotheque_app/data/filmStruct.dart';

import '../assets/filmCard.dart';
import '../assets/filmTmdbCard.dart';
import '../data/dataService.dart';
import '../data/tmdbFilmStruct.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key,}) : super(key: key);


  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  late Future<List<TmdbFilm>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchServerInfo();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favortite Film"),
      ),
      body:  Center(
        child: FutureBuilder<List<TmdbFilm>>(
          future: futureData,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                   snapshot.data!.sort((a,b) => a.title.compareTo(b.title));
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,position){
                        return TmdbFilmCard(film: snapshot.data![position]);
                      }
                  );
                }
            }
          },
        )
      ),
      drawer: const AppDrawer(),
    );


  }
}