import 'package:flutter/material.dart';
import 'package:videotheque_app/assets/addFilm.dart';
import 'package:videotheque_app/assets/searchFilm.dart';
import 'package:videotheque_app/data/filmStruct.dart';

import '../data/dataService.dart';
import '../data/tmdbFilmStruct.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<SearchScreen> {

  late Future<List<TmdbFilm>> filmList;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: const Center(
        child: SearchWidget()

      ),
    );


  }
}