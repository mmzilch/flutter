import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_themealdb/modelfilter.dart';
import 'package:http/http.dart' as http;

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState(
      url: "https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian"
      //, endpoint: "filter.php?a=Canadian"
      );
}

class _FilterScreenState extends State<FilterScreen> {
  // var baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  // var endpoint = "filter.php?a=Canadian";

  String url;
  //,endpoint;
  _FilterScreenState({this.url
      //,this.endpoint
      });

  FilterModel filtermodel;

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
    filtermodel = FilterModel.fromJson(jsonData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meals Filter by category'),
        ),
        body: filtermodel == null
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
                          "Filters",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      )),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.vertical,
                    children: filtermodel.meals
                        .map((meals) => Container(
                              height: 200,
                              padding: EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  //Navigator.pushNamed(context, routeName);
                                },
                                child: Card(
                                    shadowColor: Colors.cyan,
                                    elevation: 10.0,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            padding: EdgeInsets.all(4.0),
                                            child: (meals.strMealThumb == null
                                                ? Image.network(
                                                    "https://www.themealdb.com/images/media/meals/1548772327.jpg",
                                                    width: 200,
                                                    height: 200,
                                                  )
                                                : Image.network(
                                                    meals.strMealThumb,
                                                    width: 150,
                                                    height: 150,
                                                    fit: BoxFit.fill))),
                                        SizedBox(width: 20),
                                        Container(
                                          width: 100,
                                          child: (meals.strMeal == null
                                              ? Text("Meals")
                                              : Text(
                                                  meals.strMeal,
                                                  maxLines: 1,
                                                  style: TextStyle(color: Colors.cyan,fontSize: 20.0),
                                                )),
                                        )
                                      ],
                                    )),
                              ),
                            ))
                        .toList(),
                  ))
                ],
              ));
  }
}
