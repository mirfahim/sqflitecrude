import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:mysqlproject/detail.dart';

void main () => runApp(MaterialApp(
  
  title: "myapp",
  theme:ThemeData(
    primarySwatch: Colors.red,
  ),
  home: Home(), 
  
),);



 class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

  Future<List> getData()async{
    final response =await http.get("http://192.168.1.81/fluttercrude/get.php");
    return json.decode(response.body);
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('mir') ,),

        floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Icon(Icons.add),
        
        ),


        body: FutureBuilder<List>(
          builder: (ctx, ss){
            if (ss.hasError)
            {
              print('error');

            }
            if (ss.hasData){
              return Items(lists:ss.data);

            }
            else {
              return CircularProgressIndicator();
            }
          }

          ),
    );
  }
}


class Items extends StatelessWidget {
  List lists;
  
  Items ({this.lists});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lists== null?0:lists.length,
      itemBuilder:(ctx, i){
        return ListTile(
          leading: Icon(Icons.message),
          title: Text(lists[i]['name']),
          subtitle: Text(lists[i]['mobile']),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder:(BuildContext context) => Detailpage(list:lists, index:i),
             ),
          ),
    
        );
      }

    );
  }
}
