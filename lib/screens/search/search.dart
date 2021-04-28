import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:customer_app/components/card_glass.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../home/components/new_products_section.dart';

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

List<String> searchResult = [];

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: color_gradient_primary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular((15)),
                topRight: Radius.circular((15))),
          ),
          child: Stack(fit: StackFit.expand, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 85, 5, 0),
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  gradient: color_test,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular((15)),
                      topRight: Radius.circular((15))),
                ),
                child: Container(
                  padding: EdgeInsets.all(0),
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
                        children: listTagSuggestion
                            .map((list) => Container(
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
                                        style: (Theme.of(context)
                                            .textTheme
                                            .subtitle1)),
                                  ),
                                ))
                            .toList(),
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
            FloatingSearchBar(
              hint: 'Search...',
              scrollPadding: const EdgeInsets.only(top: 5, bottom: 56),
              transitionDuration: const Duration(milliseconds: 800),
              transitionCurve: Curves.easeInOut,
              physics: const BouncingScrollPhysics(),
              axisAlignment: isPortrait ? 0.0 : -1.0,
              openAxisAlignment: 0.0,
              width: isPortrait ? 600 : 500,
              debounceDelay: const Duration(milliseconds: 100),
              onQueryChanged: (query) {
                print(query);
                setState(() {
                  searchResult = listTagSuggestion.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
                });
                // Call your model, bloc, controller here.
              },
              // Specify a custom transition to be used for
              // animating between opened and closed stated.
              transition: CircularFloatingSearchBarTransition(),
              actions: [
                FloatingSearchBarAction(
                  showIfOpened: false,
                  child: CircularButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      print('aaaa');
                    },
                  ),
                ),
                FloatingSearchBarAction.searchToClear(
                  showIfClosed: true,
                ),
              ],
              builder: (context, transition) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: searchResult.map((element) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(15,12,10,12),
                          child: Text(element, style: (Theme.of(context)
                            .textTheme
                            .subtitle1)),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            )
          ]),
        ),
        bottomNavigationBar: BottomNavbar());
  }
}
