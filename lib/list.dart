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
      builder: (contex, lsbuilder) {
        if (lsbuilder.hasData) {
          List<Tab> tabs = [];
          List<Widget> content = [];
          for (int counter = 0; counter < lsbuilder.data.length; counter++) {
            tabs.add(Tab(
              child: Text(
                lsbuilder.data[counter].label,
                style: TextStyle(color: Colors.white),
              ),
            ));

            content.add(
               Text(
                lsbuilder.data[counter].content,
                style: TextStyle(color: Colors.black),
              ),
            );
            print(content);
          }

          return DefaultTabController(
            length: lsbuilder.data.length,
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
        if (lsbuilder.hasError) print(lsbuilder.error.toString());
        return Scaffold(
          body: Center(
              child: Text(lsbuilder.hasError ? lsbuilder.error.toString() : "Loading...")),
        );
      },
    );
  }
}