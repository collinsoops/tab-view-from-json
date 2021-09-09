import 'package:flutter/material.dart';

import 'model/category.dart';


class ListCategories extends StatefulWidget {
  ListCategories({Key key}) : super(key: key);

  @override
  _ListCategoriesState createState() => _ListCategoriesState();
}
class _ListCategoriesState extends State<ListCategories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: Category.getCategories(),
      builder: (c, s) {
        if (s.hasData) {
          List<Tab> tabs = [];
          List<Widget> content = [];
          for (int i = 0; i < s.data.length; i++) {
            tabs.add(Tab(
              child: Text(
                s.data[i].label,
                style: TextStyle(color: Colors.white),
              ),
            ));

            content.add(

               Text(
                s.data[i].content,
                style: TextStyle(color: Colors.black),
              ),
            );
            print(content);

          }



          return DefaultTabController(
            length: s.data.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Tab Demo"),
                backgroundColor: Colors.green,
                bottom: TabBar(
                  unselectedLabelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  isScrollable: true,
                  indicatorColor: Colors.indigo,
                  tabs: tabs,

                ),
              ),
              body: Column(
                  children: <Widget>[
              Expanded(
              child: TabBarView(

              children:content,

            ),
          )])
            ),
          );
        }
        if (s.hasError) print(s.error.toString());
        return Scaffold(
          body: Center(
              child: Text(s.hasError ? s.error.toString() : "Loading...")),
        );
      },
    );
  }
}