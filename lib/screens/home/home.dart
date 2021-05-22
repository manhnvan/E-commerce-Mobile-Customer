import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:customer_app/screens/home/components/new_products_section.dart';
import 'package:customer_app/screens/home/components/recommend_section.dart';
import 'package:flutter/material.dart';

import 'components/hero.dart';

class Home extends StatefulWidget {
  static String routeName = '/home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              icon: Icon(
                Icons.search
              ),
              onPressed: () {
                showSearch(
                  context: context, 
                  delegate: DataSearch()
                );
              },
            ),
          ],
        ),
        // drawer: Drawer(),
        body: Container(
            decoration: BoxDecoration(gradient: color_gradient_primary),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  HeroSection(),
                  RecommendSection(),
                  NewProductsSection()
                ],
              ),
            )),
        bottomNavigationBar: BottomNavbar(0));
  }
}


class DataSearch extends SearchDelegate<String> {

  final recommendations = [
    "Áo thun coolmate",
    "Áo sơ mi Gucci",
    "Nước hoa channel",
    "Giày Adidas",
    "Mũ bảo hiểm",
    "Bia Trúc Bạch",
    "Giày Converse"
  ];

  final recentRecommendation = [
    "Áo thun coolmate",
    "Áo sơ mi Gucci",
    "Nước hoa channel",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          onPressed: () {
            query = "";
          }, 
          icon: Icon(Icons.clear)
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // return IconButton(
      //   onPressed: () {
      //     close(context, null);
      //   }, 
      //   icon: AnimatedIcon(
      //     icon: AnimatedIcons.menu_arrow, 
      //     progress: transitionAnimation
      //   )
      // );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // TODO: implement buildResults
      throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty ? recentRecommendation : recommendations.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.search),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey)
                )
              ]
            )

          )
        );
      } 
    );
  }
  
}