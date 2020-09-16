import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Detailpage extends StatefulWidget {

  List list;
  int index;

  Detailpage({this.list, this.index});

  @override
  _DetailpageState createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {

  void confirm(){
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['name']}"),

      ),
      body:Container(
        child: Column(
        children:<Widget> [
          Text(
widget.list[widget.index]['name'],
          ),
          Text(widget.list[widget.index]['mobile'],),
          MaterialButton(
            child: Text('Edit'),
            onPressed: null),
          MaterialButton(
           child: Text('Delete'),
            onPressed: ()=> confirm(),),


        ],
        ),
        ),
    );
  }
}