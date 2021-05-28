import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:customer_app/constaint.dart';
import 'package:customer_app/helper/deboucer.dart';
import 'package:customer_app/screens/home/components/new_products_section.dart';
import 'package:customer_app/screens/home/components/recommend_section.dart';
import 'package:customer_app/screens/product_details/product_detail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'components/hero.dart';

class Home extends StatefulWidget {
  static String routeName = '/home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {

  ScrollController _scrollController = new ScrollController();

  int page = 0;
  int limit = 10;
  bool allowIncreasePageNumber = true;
  List<dynamic> productList = [];
  var dio = new Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          if (allowIncreasePageNumber) {
            page++;
          }
        });
        print(page);
        fetchData();
      }
    });
  }

  fetchData() {
    setAllowIncreasePageNumber(false);
    dio
      .get('$api_url/product/lastest?page=$page&limit=$limit')
      .then((value) {
        if (value.data['success']) {
          setState(() {
            productList.addAll(value.data['docs']);
            allowIncreasePageNumber = true;
          });
        }
      });
  }

  bool setAllowIncreasePageNumber(bool value) {
    setState(() {
      allowIncreasePageNumber = value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(),
        body: Container(
          decoration: BoxDecoration(
            gradient: color_gradient_primary,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                showSearch(
                                    context: context, delegate: DataSearch());
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  decoration: BoxDecoration(
                                      gradient: color_gradient_glass,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(14),
                                          topRight: Radius.circular(14)),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.5))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.search,
                                          color: Colors.black87, size: 23),
                                      Text("Tìm kiếm",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .merge(TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black87))),
                                    ],
                                  ))),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/shoppingCart");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Icon(Icons.shopping_cart_outlined,
                                  color: Colors.white70, size: 30),
                            ))
                      ],
                    ),
                    HeroSection(),
                    RecommendSection(),
                    NewProductsSection(
                      productList: productList,
                    )
                  ]),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavbar(0));
  }
}

class DataSearch extends SearchDelegate<String> {
  
  

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

    return SuggestionList(query: query);
  }
}

class SuggestionList extends StatefulWidget {
  const SuggestionList({
    Key key,
    @required this.query,
  }) : super(key: key);

  final String query;

  @override
  _SuggestionListState createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {

  List<dynamic> listSuggestion = [];

  var _debouncer = new Debouncer(milliseconds: 500);
  var dio = new Dio();


  @override
  void didUpdateWidget(covariant SuggestionList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _debouncer.run(() {
      String query = widget.query;
      print('$query');
      dio.get('$api_url/product/textQuery?q=$query').then((value) {
        print('$api_url/product/textQuery?q=$query');
        if (value.data['success']) {
          setState(() {
            listSuggestion = value.data['docs'];
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listSuggestion.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ProductDetail(productId: listSuggestion[index]['_id'],)),
              );
            },
            leading: Icon(Icons.search),
            title: RichText(
                text: TextSpan(
                  text: listSuggestion[index]['productName'],
                  style: TextStyle(
                      color: Colors.black),
                )
              )
            );
        });
  }
}
