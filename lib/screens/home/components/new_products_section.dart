import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:flutter/material.dart';

class NewProductsSection extends StatelessWidget {

  NewProductsSection({
    Key key,
    @required this.productList
  });

  final List<dynamic> productList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(space_medium, 0, space_medium, space_medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sản phẩm mới', style: (Theme.of(context).textTheme.headline6)),
          SizedBox(height: space_medium),
          SingleChildScrollView(
            child: Wrap(
              spacing: 20,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: productList != null ?
              productList.map((product) => ProductCard(
                    backgroundWhite: false,
                    // width: MediaQuery.of(context).size.width,
                    data: product
                  )).toList() : []
            ),
          )
        ],
      ),
    );
  }
}



