import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constaint.dart';

class RecommendSection extends StatefulWidget {
  @override
  _RecommendSectionState createState() => _RecommendSectionState();
}

class _RecommendSectionState extends State<RecommendSection> {
  List<dynamic> newProducts = [];
  var dio = new Dio();
  int page = 0;
  int limit = 10;

  @override
  void initState() {
    dio
      .get('$api_url/product/?page=$page&limit=$limit')
      .then((value) {
        if (value.data['success'] && this.mounted) {
          setState(() {
            newProducts = value.data['docs'];
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    print('rerendering');
    return Container(
      padding: EdgeInsets.fromLTRB(space_medium, space_big, 0, space_medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bạn có thể thích',
              style: (Theme.of(context).textTheme.headline6)),
          SizedBox(height: space_medium),
          Container(
            width: 2000,
            height: MediaQuery.of(context).size.height * 0.30,
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                addAutomaticKeepAlives: false,
                cacheExtent: 100.0,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: newProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    backgroundWhite: false,
                    width: null,
                    data: newProducts[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
