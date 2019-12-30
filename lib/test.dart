import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tennis_app/services/http/api/crawling/crawling_api_call.dart';

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List data;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    test("1");
    data = [];
    isLoading = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test App")
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: GridView.count(
                childAspectRatio: 16/9,
                shrinkWrap: true,
                crossAxisCount: 4,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      padding: EdgeInsets.only(top:5, bottom:5, left: 10, right: 10),
                      child: Text("코트1"),
                      onPressed: (){
                        test("1");
                      },
                    ),
                  ),
                   ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      padding: EdgeInsets.only(top:5, bottom:5, left: 10, right: 10),
                      child: Text("코트1"),
                      onPressed: (){
                        test("2");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      padding: EdgeInsets.only(top:5, bottom:5, left: 10, right: 10),
                      child: Text("코트2"),
                      onPressed: (){
                        test("3");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      padding: EdgeInsets.only(top:5, bottom:5, left: 10, right: 10),
                      child: Text("코트3"),
                      onPressed: (){
                        test("4");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      padding: EdgeInsets.only(top:5, bottom:5, left: 10, right: 10),
                      child: Text("코트4"),
                      onPressed: (){
                        test("5");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      padding: EdgeInsets.only(top:5, bottom:5, left: 10, right: 10),
                      child: Text("코트5"),
                      onPressed: (){
                        test("6");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      padding: EdgeInsets.only(top:5, bottom:5, left: 10, right: 10),
                      child: Text("코트6"),
                      onPressed: (){
                        test("7");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      padding: EdgeInsets.only(top:5, bottom:5, left: 10, right: 10),
                      child: Text("코트7"),
                      onPressed: (){
                        test("8");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      padding: EdgeInsets.only(top:5, bottom:5, left: 10, right: 10),
                      child: Text("코트8"),
                      onPressed: (){
                        test("9");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      padding: EdgeInsets.only(top:5, bottom:5, left: 10, right: 10),
                      child: Text("코트9"),
                      onPressed: (){

                      },
                    ),
                  ),
                ],
              )
            ),
            !isLoading ? Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(4),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 9/24,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context,index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black12)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(data[index]['day']),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: json.decode(data[index]['data']).length,
                            itemBuilder: (context, idx){
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(json.decode(data[index]['data'])[idx]['time']),
                                    Image.network(json.decode(data[index]['data'])[idx]['src'])
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                )
              )
            ) : Container(
              height: 400,
              child: Center(child:CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
  void test(String id) async {
    setState(() {
      isLoading = true;
    });
    String number;
    number = id;

    await makeCrawlingRequest(number).then((val) {
      setState(() {
        data = val["data"]["data"];
        isLoading = false;
      });
    });
  }
}

