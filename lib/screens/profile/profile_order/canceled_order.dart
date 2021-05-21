import 'package:customer_app/screens/profile/profile_order/order_card.dart';
import 'package:flutter/material.dart';

class CanceledOrder extends StatefulWidget {
  const CanceledOrder({Key key}) : super(key: key);

  @override
  _CanceledOrderState createState() => _CanceledOrderState();
}

class _CanceledOrderState extends State<CanceledOrder> {
  static const List<dynamic> listItem =
  [
    {
      "status": "shipping",
      "processing": "2021-05-20T15:39:05.600Z",
      "shipping": "2021-05-20T15:46:07.616Z",
      "close": null,
      "denied": "2021-05-22T11:46:07.616Z",
      "_id": "60a674085f5f1141c0a08056",
      "productId": {
        "categories": [
          "Trang phục",
          "Đồ gia dụng",
          "Thiết bị điện tử",
          "Trang sức"
        ],
        "productImages": [
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fshopee.vn%2F%25C3%2581o-Thun-Form-R%25E1%25BB%2599ng-Unisex-Biu-Nam-N%25E1%25BB%25AF-Shop-%25C3%2581o-Ph%25C3%25B4ng-%25C4%2590%25E1%25BA%25B9p-H%25C3%25A0-N%25E1%25BB%2599i-i.176850864.5901368132&psig=AOvVaw0hTge6U1oWGfyBnFSeInUA&ust=1621576595589000&source=images&cd=vfe&ved=2ahUKEwiD1vXYydfwAhVmwIsBHQZbAzMQr4kDegUIARDeAQ",
          "https://www.google.com/imgres?imgurl=http%3A%2F%2Fshopbongro.net%2Fwp-content%2Fuploads%2F2019%2F09%2F69817707_2359790267618650_2139949201620992000_n.jpg&imgrefurl=http%3A%2F%2Fshopbongro.net%2Fsan-pham%2Fao-phong-slam-dunk%2F&tbnid=4YiBcD_aBKlaiM&vet=12ahUKEwiD1vXYydfwAhVmwIsBHQZbAzMQMygCegUIARDiAQ..i&docid=WtTtJ6MNWU9MsM&w=732&h=732&q=%C3%A1o%20ph%C3%B4ng&ved=2ahUKEwiD1vXYydfwAhVmwIsBHQZbAzMQMygCegUIARDiAQ",
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fhika.vn%2Fao-phong-nu-nhieu-hinh-ngo-nghinhan005-p24384960.html&psig=AOvVaw3EsS3yFzRFTJRtKVFFVrR8&ust=1621576621198000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDIp-TJ1_ACFQAAAAAdAAAAABAP",
          "https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.gaugaushop.com%2Fsp%2Fao-thun-nu-hinh-meo-cute-877&psig=AOvVaw3EsS3yFzRFTJRtKVFFVrR8&ust=1621576621198000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDIp-TJ1_ACFQAAAAAdAAAAABAh"
        ],
        "rating": 0,
        "like": 0,
        "_id": "60a5faab069b9e1568cbf2be",
        "sellerId": "60a5f6c92d201318682ef8af",
        "productName": "Áo phông Canceled",
        "description": "Hiện nay nếu nói đến xu hướng thời trang được coi là phổ biến nhất đó là áo thun thời trang nói chung, áo thun cổ tròn nói riêng. Bất cứ khi nào và ở đâu, một chiếc áo thun đẹp năng động, cá tính, mạnh mẽ không thể thiếu đối với chúng ta. Và mẫu Áo thun nam cổ tròn New York sau đây sẽ là một điển hình cho sự lựa chọn của các Bạn.",
        "thumbnail": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fkwinshop.com%2Fsan-pham%2Fao-thun-nam-co-tron-rango-in-chu-new-york%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAd",
        "price": 150000,
        "unit": "cái",
        "vendor": "Tàu",
        "__v": 0
      },
      "sellerId": {
        "_id": "60a5f6c92d201318682ef8af",
        "username": "Manh Nguyen",
        "phone": "0866770900",
        "shopName": "Shopfy",
        "__v": 0
      },
      "amount": 3,
      "orderId": "60a674085f5f1141c0a08055",
      "customerId": "60a5f0e6b901391d0c37c038",
      "created": "2021-05-20T14:36:56.688Z",
      "waiting": "2021-05-20T14:36:56.688Z",
      "__v": 0
    },
    {
      "status": "processing",
      "processing": "2021-05-20T15:39:38.499Z",
      "shipping": null,
      "close": null,
      "denied": "2021-05-22T15:39:38.499Z",
      "_id": "60a674085f5f1141c0a08057",
      "productId": {
        "categories": [
          "áo thun nam",
          "cotton",
          "compact"
        ],
        "productImages": [
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Friooshop.com%2Fao-thun-nam-xuat-khau-levis-rtx018%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAE",
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Friooshop.com%2Fao-thun-nam-xuat-khau-burberry-rtx008%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAJ",
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Farmystore.vn%2Fsan-pham%2Fao-thun-nam-phong-cach-bui-arm-929-den-130.html&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAO",
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fbachhoa24h.com.vn%2Fsan-pham%2Fao-thun-nam-burberry-co-tron%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAT"
        ],
        "rating": 0,
        "like": 0,
        "_id": "60a5f6db2d201318682ef8b0",
        "sellerId": "60a5f6c92d201318682ef8af",
        "productName": "Áo khoác Coolmate",
        "description": "Bạn đang tìm kiếm một chiếc áo có thể mặc mọi lúc, mọi nơi vừa lịch sự khi đi làm nhưng vẫn thoải mái, tự tin khi đi chơi, đi cafe với bạn. Một chiếc áo không cần suy nghĩ đến kiểu dáng và luôn giúp bạn trông thật thời thượng và nam tính. Premium Tshirt Coolmate chính là chiếc áo thun dành cho bạn, một phiên bản áo thun với đầy sự cải tiến được Coolmate team nghiên cứu kỹ lưỡng và ngày càng cải tiến hơn với chất liệu Cotton Compact chất lượng cao.",
        "thumbnail": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fkwinshop.com%2Fsan-pham%2Fao-thun-nam-co-tron-rango-in-chu-new-york%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAd",
        "price": 490000,
        "unit": "cái",
        "vendor": "Coolmate",
        "__v": 0
      },
      "sellerId": {
        "_id": "60a5f6c92d201318682ef8af",
        "username": "Manh Nguyen",
        "phone": "0866770900",
        "shopName": "Shopfy",
        "__v": 0
      },
      "amount": 4,
      "orderId": "60a674085f5f1141c0a08055",
      "customerId": "60a5f0e6b901391d0c37c038",
      "created": "2021-05-20T14:36:56.689Z",
      "waiting": "2021-05-20T14:36:56.689Z",
      "__v": 0
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
        listItem.map((i) => OrderCard(item: i)).toList()
    );
  }
}
