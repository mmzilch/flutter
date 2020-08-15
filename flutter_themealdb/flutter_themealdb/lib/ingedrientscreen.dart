import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_themealdb/modelingredient.dart';
import 'package:http/http.dart' as http;

class IngedrientScreen extends StatefulWidget {
  @override
  _IngedrientScreenState createState() => _IngedrientScreenState(
      url: "https://www.themealdb.com/api/json/v1/1/list.php?i=list");
}

class _IngedrientScreenState extends State<IngedrientScreen> {
  String url;
  _IngedrientScreenState({this.url});
  IngredientModel ingredientModel;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    //var url = '$baseUrl$endpoint';
    var data = await http.get(url);
    print(url);
    var jsonData = jsonDecode(data.body);
    ingredientModel = IngredientModel.fromJson(jsonData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meals Filter by category'),
        ),
        body: ingredientModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Ingredient",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      )),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.vertical,
                    children: ingredientModel.meals
                        .map((meals) => Container(
                              //height: 200,
                              padding: EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  //Navigator.pushNamed(context, routeName);
                                },
                                child: Card(
                                    shadowColor: Colors.cyan,
                                    elevation: 10.0,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(padding: EdgeInsets.all(4.0),child: meals.strIngredient == null ? Text("No Ingredient Name"): Text(meals.strIngredient,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.cyan,),),),
                                        
                                        Container(padding: EdgeInsets.all(8.0),child:meals.strDescription == null ? Text ('No Description'): Text(meals.strDescription,style: TextStyle(color : Colors.cyan),textAlign: TextAlign.justify,maxLines: 5,overflow:TextOverflow.ellipsis,)
                                        ),
                                        SizedBox(height: 4.0),
                                        ]
                                        )
                                        // Container(
                                        //   //width: 100,
                                        //   child: (meals.strIngredient == null
                                        //       ? Text("Ingredient")
                                        //       : Text(
                                        //           meals.strIngredient,
                                        //           style: TextStyle(),
                                        //         )),
                                        // ),
                                        // SizedBox(height: 20),
                                        // Container(
                                        //   //width: 100,
                                        //   child: (meals.strDescription == null
                                        //       ? Text("Description")
                                        //       : Text(
                                        //           meals.strDescription,
                                        //           maxLines: 1,
                                        //           style: TextStyle(),
                                        //         )),
                                        // ),
                                        // SizedBox(height: 20),
                                        // Container(
                                        //   //width: 100,
                                        //   child: (meals.strType == null
                                        //       ? Text("null")
                                        //       : Text(
                                        //           meals.strType,
                                        //           //maxLines: 1,
                                        //           style: TextStyle(),
                                        //         )),
                                        // )
                                    //   ],
                                    // )
                                    ),
                              ),
                            ))
                        .toList(),
                  ))
                ],
              ));
  }
}
