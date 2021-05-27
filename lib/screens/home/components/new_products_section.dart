import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../constaint.dart';

class NewProductsSection extends StatefulWidget {
  @override
  _NewProductsSectionState createState() => _NewProductsSectionState();
}

class _NewProductsSectionState extends State<NewProductsSection> {

  List<dynamic> newProductList = [];
  var dio = new Dio();

  int page = 0;
  int limit = 10;

  @override
  void initState() {
    dio
      .get('$api_url/product/lastest?page=$page&limit=$limit')
      .then((value) {
        if (value.data['success']) {
          setState(() {
            newProductList = value.data['docs'];
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(space_medium, 0, space_medium, space_medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sản phẩm mới', style: (Theme.of(context).textTheme.headline6)),
          SizedBox(height: space_medium),
          Column(
            children: newProductList.map((product) => ProductCard(
                  backgroundWhite: false,
                  width: MediaQuery.of(context).size.width, 
                  data: product
                )).toList()
          )
        ],
      ),
    );
  }
}

