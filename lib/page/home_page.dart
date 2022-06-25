// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../supply.dart';



class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: out.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(out[index], style: TextStyle(fontSize: 22));
        }
    ),
    appBar: AppBar(title: Text("Расписание"),),
  );
}