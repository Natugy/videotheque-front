
import 'package:flutter/material.dart';
import 'package:videotheque_app/views/addFilmView.dart';
import 'package:videotheque_app/views/barCodeView.dart';
import 'package:videotheque_app/views/detailsFilm.dart';
import 'package:videotheque_app/views/favoriteView.dart';
import 'package:videotheque_app/views/mainView.dart';
import 'package:videotheque_app/views/searchView.dart';

import 'data/dataService.dart';
import 'data/filmStruct.dart';
import 'views/secondView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),

      routes:{
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
        '/add': (context) => const AddScreen(),
        '/favorite': (context) =>  const FavoriteScreen(),
        '/details': (context) => const DetailFilm(),
        '/search': (context) => const SearchScreen(),
        '/barcode':(context) => const BarCodeScreen()
      },
    );
  }
}






