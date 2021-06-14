import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  final dynamic item;
  final double currentRate;
  final String currentUserId;
  final Function updateRate;
  const Rating({Key key, this.item, this.currentRate, this.currentUserId, this.updateRate}) : super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  var dio = new Dio();
  var newRate;

  @override
  void initState() {
    // TODO: implement initState
    // setState(() {
    //   newRate = widget.currentRate;
    // });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        gradient: color_gradient_primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text("Đánh giá của bạn về sản phẩm",
              style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 10),
          Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(
                      width: 50,
                      // height: 75,
                      image: NetworkImage(widget.item["productId"]["thumbnail"]),
                      fit: BoxFit.cover
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              widget.item["productId"]["productName"],
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16)),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false
                          )
                      ),
                      SizedBox(height: 8),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Giá:  ${NumberFormat.simpleCurrency(locale: 'vi_VN').format(widget.item["productId"]["price"])}",
                            style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 13)),
                            overflow: TextOverflow.ellipsis,
                          )
                      ),
                    ],
                  ),
                ),
              ]
          ),
          Text(newRate != null ? newRate.toString() : widget.currentRate.toString()),
          RatingBar.builder(
            initialRating: widget.currentRate,
            minRating: 1,
            tapOnlyMode: true,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              if(this.mounted){
                widget.updateRate(rating);
                setState(() {
                  newRate = rating;
                });
              }
              dio.post("$api_url/rating", data: {
                "product": widget.item["productId"]["_id"],
                "star": rating,
                "customerId": widget.currentUserId
              }).then((value) {
                showDialog(
                    barrierDismissible: false,
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext builderContext) {
                      Future.delayed(Duration(milliseconds: 500), () {
                        Navigator.of(builderContext).pop();
                      });
                      return AlertDialog(
                          backgroundColor: Colors.black.withOpacity(0.8),
                          content: Text('Đánh giá sản phẩm thành công', style: TextStyle(color: Colors.white)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)))
                      );
                    }
                );
              });
            },
          )
        ],
      ),
    );
  }
}
