import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/components/bottom_navbar.dart';

import 'home/components/new_products_section.dart';

class Search extends StatefulWidget {
  static String routeName = '/search';

  @override
  _SearchState createState() => _SearchState();
}

const List<String> listTagSuggestion = [
  'Thời trang',
  'Công nghệ',
  'Trang trí',
  'Sức khoẻ & sắc đẹp',
  'Nhà cửa & đời sống',
  'Mẹ & bé',
  'Nhà sách Online',
  'Ô tô - Xe máy',
  'Thể thao & du lịch',
];

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: color_gradient_primary),
            child: Column(
              children: <Widget>[
                Container(padding: EdgeInsets.all(16.0), child: TextField()),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        gradient: color_gradient_glass,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular((15)),
                            topRight: Radius.circular((15))),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: color_gradient_primary,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular((15)),
                              topRight: Radius.circular((15))),
                        ),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          addAutomaticKeepAlives: false,
                          cacheExtent: 100.0,
                          children: [
                            Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.start,
                              children:
                                listTagSuggestion.map((list) =>
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration:
                                      BoxDecoration(boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 8,
                                            spreadRadius: -8,
                                            offset: Offset(4, 4))
                                      ]),
                                      child: Chip(
                                        backgroundColor: Colors.white,
                                        label: Text('$list',
                                            style:  (Theme.of(context).textTheme.subtitle1)),
                                      ),
                                    )
                                ).toList()
                              ,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: NewProductsSection(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
        bottomNavigationBar: BottomNavbar(1)
    );
  }
}
