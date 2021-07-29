import 'dart:io';

import 'package:customer_app/components/product_card.dart';
import 'package:customer_app/constant.dart';
import 'package:customer_app/screens/home/components/recommend_section.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import "dart:convert";
import 'package:diacritic/diacritic.dart';

class Search extends StatefulWidget {
  static String routeName = '/search';

  @override
  _SearchState createState() => _SearchState();
}

const List<String> listTagSuggestion = [
  'Thời trang',
  'Công nghệ',
  'Trang trí',
  'Trang phục',
  'Mẹ & bé',
  'Đồ gia dụng',
  'Ô tô - Xe máy',
  'Đồ chơi',
];

class _SearchState extends State<Search> {
  List<String> searchSuggestion = [];
  dynamic searchResult = [];
  var loading = false;
  File image;
  String localQuery = '';
  var dio = new Dio();
  final controller = FloatingSearchBarController();

  Future _getThumbnailAsset(type) async {
    EasyLoading.show(status: 'loading...');
    final pickedFile = await ImagePicker().getImage(source: type ? ImageSource.camera : ImageSource.gallery);
    if (!mounted) return;


    if(pickedFile != null) {
      controller.query = "";
      setState(() {
        image = File(pickedFile.path);
        localQuery = "";
      });
      List<int> imageBytes = File(pickedFile.path).readAsBytesSync();
      String imageString = base64Encode(imageBytes);

      // var formData = FormData.fromMap({
      //   'image_base64': imageString,
      //   "language": "vi",
      //   // "threshold": 50,
      //   "limit": 5
      // });

      var formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(pickedFile.path),
      });
      // dio.options.headers["authorization"] = "Basic YWNjXzhiMWQ1OTlmYmFjYWQwZDpjOTUzOTliOTUyNDYyNzBiYTFmNjU1ZTFlYTkzODFkZg==";

      // String endpointUrl = "https://api.imagga.com/v2/tags";
      String endpointUrl = "http://192.168.0.100:6123/";

      dio.post(endpointUrl, data: formData).then((value) {
        var queryText = [];
        // value.data["result"]["tags"].forEach((t) {
        //   queryText.add("${removeDiacritics(t["tag"]["vi"])}");
        // });
        print(value.data);
        if(value.data["label"].length != 0) {
          value.data["label"].forEach((t) {
            queryText.add(value.data["label"]);
          });
          dio.post('$api_url/product/imageQuery', data: {
            "query": queryText,
          }).then((value2) {
            if (value2.data['success']) {
              setState(() {
                searchResult = value2.data['docs'];
              });
              EasyLoading.dismiss();
            }
          });
        }
        EasyLoading.dismiss();
      });
    } else {
      EasyLoading.dismiss();
    }
  }

  void searchText(query) {
    setState(() {
      loading = true;
      searchResult = [];
    });
    EasyLoading.show(status: 'loading...');
    print("called: $query");
    dio.get("$api_url/product/textQuery?q=$query").then((value) {
      print(value);
      setState(() {
        searchResult = value.data["docs"];
      });
      setState(() {
        loading = false;
      });
      EasyLoading.dismiss();
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    EasyLoading.dismiss();
    super.dispose();
  }

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
            Container(
              padding: EdgeInsets.all(1),
              margin: EdgeInsets.fromLTRB(10, 85, 10, 0),
              decoration: BoxDecoration(
                gradient: color_test,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular((15)),
                    topRight: Radius.circular((15))),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: color_gradient_primary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular((15)),
                      topRight: Radius.circular((15))
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      (localQuery == "" && image == null)
                          ? Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.start,
                              children: listTagSuggestion
                                  .map((list) => GestureDetector(
                                        onTap: () {
                                          controller.query = list;
                                          setState(() {
                                            localQuery = list;
                                          });
                                          searchText(list);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                              boxShadow: <BoxShadow>[
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
                                        ),
                                      ))
                                  .toList())
                          : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                image != null
                                    ? Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Text("Tìm kiếm bằng hình ảnh:", style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 18))),
                                          )
                                        ),
                                        SizedBox(width: 5),
                                        GestureDetector(
                                          onTap: () {
                                            _getThumbnailAsset(false);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 10),
                                            alignment: Alignment.topRight,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                              child: Image.file(image,
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.circular(10),
                                            )),
                                        ),
                                      ],
                                    )
                                    : Container(),
                                SizedBox(height: 20),
                                searchResult.length != 0
                                    ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                          child: Text("Kết quả tìm kiếm ", style: Theme.of(context).textTheme.headline6),
                                        ),
                                        SizedBox(height: 15),
                                        Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.start,
                                        children: searchResult.map<Widget>((s) => ProductCard(backgroundWhite: false, width: null, data: s,)).toList()
                                ),
                                      ],
                                    ) : Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(loading? "Đang tìm kiếm..." : "Không tìm thấy sản phẩm nào",style: Theme.of(context).textTheme.headline6)
                                ),
                              ]),
                          ),
                      RecommendSection()
                    ],
                  ),
                ),
              ),
            ),
            FloatingSearchBar(
              onSubmitted: (query) {
                controller.close();
                setState(() {
                  localQuery = query;
                });
                searchText(query);
              },
              controller: controller,
              hint: 'Search...',
              clearQueryOnClose: false,
              scrollPadding: const EdgeInsets.only(top: 5, bottom: 56),
              transitionDuration: const Duration(milliseconds: 800),
              transitionCurve: Curves.easeInOut,
              physics: const BouncingScrollPhysics(),
              axisAlignment: isPortrait ? 0.0 : -1.0,
              openAxisAlignment: 0.0,
              width: isPortrait ? 600 : 500,
              debounceDelay: const Duration(milliseconds: 100),
              onQueryChanged: (query) {
                setState(() {
                  image = null;
                  localQuery = query;
                  searchSuggestion = listTagSuggestion
                      .where((element) =>
                          element.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                });
                // Call your model, bloc, controller here.
              },
              // Specify a custom transition to be used for
              // animating between opened and closed stated.
              transition: CircularFloatingSearchBarTransition(),
              actions: [
                FloatingSearchBarAction.searchToClear(
                    showIfClosed: true, duration: Duration(milliseconds: 500)),
                FloatingSearchBarAction.icon(icon: Icon(Icons.image), onTap: (){
                  _getThumbnailAsset(false);
                })
              ],
              leadingActions: [],
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
                      children: searchSuggestion.map((element) {
                        return GestureDetector(
                          onTap: () {
                            controller.close();
                            controller.query = element;
                            setState(() {
                              localQuery = element;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 12, 10, 12),
                            child: Text(element,
                                style: (Theme.of(context).textTheme.subtitle1)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            )
          ]),
        ),
        bottomNavigationBar: BottomNavbar(1)
    );
  }
}
