import 'package:flutter/material.dart';
import 'package:videotheque_app/assets/addFilm.dart';
import 'package:videotheque_app/assets/appDrawer.dart';
import 'package:videotheque_app/assets/searchFilm.dart';
import 'package:videotheque_app/data/filmStruct.dart';

import '../data/dataService.dart';
import '../data/tmdbFilmStruct.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  late Future<List<TmdbFilm>> filmList;




  @override
  Widget build(BuildContext context) {
    final film = ModalRoute.of(context)!.settings.arguments as String;
    filmList= test(film);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: Center(
        child: SearchFilm(filmList: filmList),

        ),
      );


  }
}


