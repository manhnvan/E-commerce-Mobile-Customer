import 'dart:convert';

import 'package:customer_app/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order extends ChangeNotifier {
  String status;
  String itemId, orderId, sellerId;
  Product product;
  int amount;

  static const Map<String, Object> item = {
    "status": "processing",
    "_id": "6093550f8739534294e7b27c",
    "productId": {
      "categories": [
        "Trang phục"
      ],
      "productImages": [
        "1620183666938asset_image.png",
        "1620183667033asset_image.png",
        "1620183667045asset_image.png",
        "1620183667172asset_image.png"
      ],
      "rating": 0,
      "like": 0,
      "_id": "60920a7af48ab90e441509ad",
      "sellerId": "608eb567489da0f52b6ec179",
      "productName": "ao dai tay",
      "description": "Câu chuyện được sinh ra từ tủ đồ của các cánh mày râu, nơi được cho là ‘1 màu’, ‘đơn điệu’ và ‘ít được chăm chút’. Bởi lẽ thực tế, việc mua sắm đối với các anh là không thường xuyên, ngại phải đi nhiều nơi để mua đủ những đồ mình muốn, đặc biệt là những món đồ cơ bản nhất. Coolmate hiểu được rằng những chiếc áo phông, đôi tất hay quần lót sẽ không bao giờ thiếu vắng trong tủ đồ và bằng chính sứ mệnh của mình, CoolMate sẽ dần thay đổi thói quen của các anh bằng cách thức mua hàng tiện lợi nhất và những sản phẩm chất lượng tốt nhất.",
      "thumbnail": "1620183634450thumbnail_image.png",
      "price": 600000,
      "unit": "cai",
      "vendor": "Cooolmate",
      "__v": 0
    },
    "sellerId": "6091721698d3fc0dd03d08a7",
    "amount": 2,
    "orderId": "6093550f8739534294e7b27a",
    "created": "2021-05-06T02:31:43.422Z",
    "__v": 0
  };

  Order.fromJson(json)
      : itemId = json['_id'],
        orderId = json['orderId'],
        sellerId = json['sellerId'],
        status = json['status'],
        amount = json['amount'],
        product = json['productId'];
}