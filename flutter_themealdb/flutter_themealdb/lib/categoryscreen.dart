import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_themealdb/modelcategory.dart';
import 'package:http/http.dart' as http;

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState(
      url: "https://www.themealdb.com/api/json/v1/1/categories.php");
}

class _CategoryScreenState extends State<CategoryScreen> {
  String url;
  _CategoryScreenState({this.url});
  CategoryModel categoryModel;
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
    categoryModel = CategoryModel.fromJson(jsonData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meals Filter by category'),
        ),
        body: categoryModel == null
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
                          "Category",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      )),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.vertical,
                    children: categoryModel.categories
                        .map((categories) => Container(
                              height: 210,
                              padding: EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  //Navigator.pushNamed(context, routeName);
                                },
                                child: Card(
                                    shadowColor: Colors.cyan,
                                    elevation: 10.0,
                                    child: Container(
                                        height: 200,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                                padding: EdgeInsets.all(4.0),
                                                child: (categories
                                                            .strCategoryThumb ==
                                                        null
                                                    ? Image.network(
                                                        "https://www.themealdb.com/images/media/meals/1548772327.jpg",
                                                        width: 200,
                                                        // height: 200,
                                                      )
                                                    : Image.network(
                                                        categories
                                                            .strCategoryThumb,
                                                        width: 150,
                                                        // height: 150,
                                                        fit: BoxFit.fill))),
                                            SizedBox(height: 10),
                                            Container(
                                              //width: 100,
                                              child: (categories.strCategory ==
                                                      null
                                                  ? Text("Category")
                                                  : Text(
                                                      categories.strCategory,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.cyan),
                                                    )),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              padding: EdgeInsets.all(4.0),
                                              //width: 100,
                                              child: (categories
                                                          .strCategoryDescription ==
                                                      null
                                                  ? Text("Description")
                                                  : Text(
                                                      categories
                                                          .strCategoryDescription,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.cyan),
                                                    )),
                                            ),
                                            SizedBox(height: 4.0)
                                          ],
                                        ))),
                              ),
                            ))
                        .toList(),
                  ))
                ],
              ));
  }
}
