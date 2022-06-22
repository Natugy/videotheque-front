
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:videotheque_app/assets/appDrawer.dart';
import 'package:videotheque_app/assets/expandedFab.dart';


import '../assets/filmTmdbCard.dart';
import '../data/dataService.dart';
import '../data/tmdbFilmStruct.dart';



class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late Future<List<TmdbFilm>> filmList;

  bool navButton=false;
  FutureOr onGoBack(dynamic value) {
    setState(() {
      filmList =fetchServerInfo();

    });
  }

  refresh(){
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    filmList = fetchServerInfo();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Center(
            child: Container(
              padding: const EdgeInsets.only(bottom: 60),
                child: FilmListBuilder(filmList: filmList,))
        ),
        drawer: const AppDrawer(),
      floatingActionButton: ExpandableFab(

          distance: 100,
          initialOpen: navButton,
          children: [
            ActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/barcode");

              },
              icon: const Icon(Icons.qr_code_scanner,color: Colors.white,),
            ),
            ActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/search",).then(onGoBack);
              },
              icon: const Icon(Icons.search, color: Colors.white,),
            ),


          ]),


    );
  }
}

class FilmListBuilder extends StatelessWidget {
  const FilmListBuilder({Key? key, required this.filmList}) : super(key: key);

  final Future<List<TmdbFilm>> filmList;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TmdbFilm>>(
      future: filmList,
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
    );
  }
}

