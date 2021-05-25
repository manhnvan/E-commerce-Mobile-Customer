import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/screens/shoppingCart/components/ItemsOfStore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShoppingCart extends StatefulWidget {
  static String routeName = '/shoppingCart';
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<dynamic> items = [
    {
      "shopName": "Kenji",
      "avatar": "https://nongdan.pro/wp-content/uploads/2017/05/shop-icon.png",
      "products": [
        {
          "product": {
            "categories": [
              "Trang trí nhà cửa"
            ],
            "productImages": [
              "https://storage.googleapis.com/cdn.nhanh.vn/store1/45885/ps/20200827/16550974485_549763519.jpg",
              "https://www.google.com/imgres?imgurl=http%3A%2F%2Fshopbongro.net%2Fwp-content%2Fuploads%2F2019%2F09%2F69817707_2359790267618650_2139949201620992000_n.jpg&imgrefurl=http%3A%2F%2Fshopbongro.net%2Fsan-pham%2Fao-phong-slam-dunk%2F&tbnid=4YiBcD_aBKlaiM&vet=12ahUKEwiD1vXYydfwAhVmwIsBHQZbAzMQMygCegUIARDiAQ..i&docid=WtTtJ6MNWU9MsM&w=732&h=732&q=%C3%A1o%20ph%C3%B4ng&ved=2ahUKEwiD1vXYydfwAhVmwIsBHQZbAzMQMygCegUIARDiAQ",
              "https://www.google.com/url?sa=i&url=https%3A%2F%2Fhika.vn%2Fao-phong-nu-nhieu-hinh-ngo-nghinhan005-p24384960.html&psig=AOvVaw3EsS3yFzRFTJRtKVFFVrR8&ust=1621576621198000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDIp-TJ1_ACFQAAAAAdAAAAABAP",
              "https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.gaugaushop.com%2Fsp%2Fao-thun-nu-hinh-meo-cute-877&psig=AOvVaw3EsS3yFzRFTJRtKVFFVrR8&ust=1621576621198000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDIp-TJ1_ACFQAAAAAdAAAAABAh"
            ],
            "rating": 0,
            "like": 0,
            "_id": "60abe96575905f164434a32d",
            "sellerId": {
              "avatar": "https://nongdan.pro/wp-content/uploads/2017/05/shop-icon.png",
              "_id": "60aa0677010c680fec927739",
              "username": "Vuong Thanh",
              "phone": "0886662928",
              "shopName": "Kenji",
              "address": "Thi tran Thua, Luong Tai, Bac Ninh",
              "__v": 0
            },
            "productName": "Quần lots",
            "description": "Hiện nay nếu nói đến xu hướng thời trang được coi là phổ biến nhất đó là áo thun thời trang nói chung, áo thun cổ tròn nói riêng. Bất cứ khi nào và ở đâu, một chiếc áo thun đẹp năng động, cá tính, mạnh mẽ không thể thiếu đối với chúng ta. Và mẫu Áo thun nam cổ tròn New York sau đây sẽ là một điển hình cho sự lựa chọn của các Bạn.",
            "thumbnail": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fkwinshop.com%2Fsan-pham%2Fao-thun-nam-co-tron-rango-in-chu-new-york%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAd",
            "price": 35000,
            "unit": "cái",
            "vendor": "Lương Tài",
            "created": "2021-05-24T17:59:01.990Z",
            "__v": 0
          },
          "amount": 3,
          "checked": true
        },
        {
          "product": {
            "categories": [
              "Trang phục"
            ],
            "productImages": [
              "https://storage.googleapis.com/cdn.nhanh.vn/store1/45885/ps/20200827/16550974485_549763519.jpg",
              "https://www.google.com/imgres?imgurl=http%3A%2F%2Fshopbongro.net%2Fwp-content%2Fuploads%2F2019%2F09%2F69817707_2359790267618650_2139949201620992000_n.jpg&imgrefurl=http%3A%2F%2Fshopbongro.net%2Fsan-pham%2Fao-phong-slam-dunk%2F&tbnid=4YiBcD_aBKlaiM&vet=12ahUKEwiD1vXYydfwAhVmwIsBHQZbAzMQMygCegUIARDiAQ..i&docid=WtTtJ6MNWU9MsM&w=732&h=732&q=%C3%A1o%20ph%C3%B4ng&ved=2ahUKEwiD1vXYydfwAhVmwIsBHQZbAzMQMygCegUIARDiAQ",
              "https://www.google.com/url?sa=i&url=https%3A%2F%2Fhika.vn%2Fao-phong-nu-nhieu-hinh-ngo-nghinhan005-p24384960.html&psig=AOvVaw3EsS3yFzRFTJRtKVFFVrR8&ust=1621576621198000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDIp-TJ1_ACFQAAAAAdAAAAABAP",
              "https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.gaugaushop.com%2Fsp%2Fao-thun-nu-hinh-meo-cute-877&psig=AOvVaw3EsS3yFzRFTJRtKVFFVrR8&ust=1621576621198000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDIp-TJ1_ACFQAAAAAdAAAAABAh"
            ],
            "rating": 0,
            "like": 0,
            "_id": "60aa0837010c680fec92773a",
            "sellerId": {
              "avatar": "https://nongdan.pro/wp-content/uploads/2017/05/shop-icon.png",
              "_id": "60aa0677010c680fec927739",
              "username": "Vuong Thanh",
              "phone": "0886662928",
              "shopName": "Kenji",
              "address": "Thi tran Thua, Luong Tai, Bac Ninh",
              "__v": 0
            },
            "productName": "Quần đùi",
            "description": "Hiện nay nếu nói đến xu hướng thời trang được coi là phổ biến nhất đó là áo thun thời trang nói chung, áo thun cổ tròn nói riêng. Bất cứ khi nào và ở đâu, một chiếc áo thun đẹp năng động, cá tính, mạnh mẽ không thể thiếu đối với chúng ta. Và mẫu Áo thun nam cổ tròn New York sau đây sẽ là một điển hình cho sự lựa chọn của các Bạn.",
            "thumbnail": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fkwinshop.com%2Fsan-pham%2Fao-thun-nam-co-tron-rango-in-chu-new-york%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAd",
            "price": 10000,
            "unit": "cái",
            "vendor": "Hải Dương",
            "created": "2021-05-23T07:45:59.653Z",
            "__v": 0
          },
          "amount": 4,
          "checked": true
        }
      ]
    },
    {
      "shopName": "Shopfy",
      "avatar": "https://nongdan.pro/wp-content/uploads/2017/05/shop-icon.png",
      "products": [
        {
          "product": {
            "categories": [
              "Trang phục",
              "Đồ gia dụng",
              "Thiết bị điện tử",
              "Trang sức"
            ],
            "productImages": [
              "https://storage.googleapis.com/cdn.nhanh.vn/store1/45885/ps/20200827/16550974485_549763519.jpg",
              "https://www.google.com/imgres?imgurl=http%3A%2F%2Fshopbongro.net%2Fwp-content%2Fuploads%2F2019%2F09%2F69817707_2359790267618650_2139949201620992000_n.jpg&imgrefurl=http%3A%2F%2Fshopbongro.net%2Fsan-pham%2Fao-phong-slam-dunk%2F&tbnid=4YiBcD_aBKlaiM&vet=12ahUKEwiD1vXYydfwAhVmwIsBHQZbAzMQMygCegUIARDiAQ..i&docid=WtTtJ6MNWU9MsM&w=732&h=732&q=%C3%A1o%20ph%C3%B4ng&ved=2ahUKEwiD1vXYydfwAhVmwIsBHQZbAzMQMygCegUIARDiAQ",
              "https://www.google.com/url?sa=i&url=https%3A%2F%2Fhika.vn%2Fao-phong-nu-nhieu-hinh-ngo-nghinhan005-p24384960.html&psig=AOvVaw3EsS3yFzRFTJRtKVFFVrR8&ust=1621576621198000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDIp-TJ1_ACFQAAAAAdAAAAABAP",
              "https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.gaugaushop.com%2Fsp%2Fao-thun-nu-hinh-meo-cute-877&psig=AOvVaw3EsS3yFzRFTJRtKVFFVrR8&ust=1621576621198000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDIp-TJ1_ACFQAAAAAdAAAAABAh"
            ],
            "rating": 0,
            "like": 0,
            "_id": "60a5faab069b9e1568cbf2be",
            "sellerId": {
              "avatar": "https://nongdan.pro/wp-content/uploads/2017/05/shop-icon.png",
              "_id": "60a5f6c92d201318682ef8af",
              "username": "Manh Nguyen",
              "phone": "0866770900",
              "shopName": "Shopfy",
              "__v": 0
            },
            "productName": "Áo phông",
            "description": "Hiện nay nếu nói đến xu hướng thời trang được coi là phổ biến nhất đó là áo thun thời trang nói chung, áo thun cổ tròn nói riêng. Bất cứ khi nào và ở đâu, một chiếc áo thun đẹp năng động, cá tính, mạnh mẽ không thể thiếu đối với chúng ta. Và mẫu Áo thun nam cổ tròn New York sau đây sẽ là một điển hình cho sự lựa chọn của các Bạn.",
            "thumbnail": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fkwinshop.com%2Fsan-pham%2Fao-thun-nam-co-tron-rango-in-chu-new-york%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAd",
            "price": 150000,
            "unit": "cái",
            "vendor": "Tàu",
            "__v": 0,
            "created": "2021-05-24T19:50:31.886Z"
          },
          "amount": 5,
          "checked": true
        },
        {
          "product": {
            "categories": [
              "áo thun nam",
              "cotton",
              "compact"
            ],
            "productImages": [
              "https://storage.googleapis.com/cdn.nhanh.vn/store1/45885/ps/20200827/16550974485_549763519.jpg",
              "https://www.google.com/url?sa=i&url=https%3A%2F%2Friooshop.com%2Fao-thun-nam-xuat-khau-burberry-rtx008%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAJ",
              "https://www.google.com/url?sa=i&url=https%3A%2F%2Farmystore.vn%2Fsan-pham%2Fao-thun-nam-phong-cach-bui-arm-929-den-130.html&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAO",
              "https://www.google.com/url?sa=i&url=https%3A%2F%2Fbachhoa24h.com.vn%2Fsan-pham%2Fao-thun-nam-burberry-co-tron%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAT"
            ],
            "rating": 0,
            "like": 0,
            "_id": "60a5f6db2d201318682ef8b0",
            "sellerId": {
              "avatar": "https://nongdan.pro/wp-content/uploads/2017/05/shop-icon.png",
              "_id": "60a5f6c92d201318682ef8af",
              "username": "Manh Nguyen",
              "phone": "0866770900",
              "shopName": "Shopfy",
              "__v": 0
            },
            "productName": "Áo khoác Coolmate",
            "description": "Bạn đang tìm kiếm một chiếc áo có thể mặc mọi lúc, mọi nơi vừa lịch sự khi đi làm nhưng vẫn thoải mái, tự tin khi đi chơi, đi cafe với bạn. Một chiếc áo không cần suy nghĩ đến kiểu dáng và luôn giúp bạn trông thật thời thượng và nam tính. Premium Tshirt Coolmate chính là chiếc áo thun dành cho bạn, một phiên bản áo thun với đầy sự cải tiến được Coolmate team nghiên cứu kỹ lưỡng và ngày càng cải tiến hơn với chất liệu Cotton Compact chất lượng cao.",
            "thumbnail": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fkwinshop.com%2Fsan-pham%2Fao-thun-nam-co-tron-rango-in-chu-new-york%2F&psig=AOvVaw1FfE99Dq3v1jSlaGitzlIz&ust=1618812673641000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDKiKaRh_ACFQAAAAAdAAAAABAd",
            "price": 490000,
            "unit": "cái",
            "vendor": "Coolmate",
            "__v": 0,
            "created": "2021-05-24T19:50:31.885Z"
          },
          "amount": 1,
          "checked": false
        }
      ]
    }
  ];
  int index = -1;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
  }

  void _update(List<dynamic> newItems) {
    setState(() {
      items = newItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    index = -1;
    totalPrice = 0;
    items.forEach((item) {
      item["products"].forEach((p) => {
        totalPrice += p["checked"] ? p["amount"]*p["product"]["price"] : 0
      });
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: new IconButton(
              icon: new Icon(Icons.arrow_back,size: 35),
          onPressed: () => {
          // Perform Your action here
            Navigator.pop(context)
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Giỏ hàng của bạn",
            style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 25, color: Colors.white))),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 80),
        decoration: BoxDecoration(gradient: color_gradient_primary),
        child: Column(
          children: [
            Expanded(child: items.length > 0 ? SingleChildScrollView(
              child: Column(
                  children: items.map((e) {
                      index += 1;
                      return ItemsOfStore(
                        items: items,
                        storeIndex: index,
                        update: _update); }).toList()),
            ): Center(child: Text("Bạn chưa có sản phẩm trong giỏ hàng"))),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  gradient: color_gradient_primary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border.all(color: Colors.white, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 3,
                    blurRadius: 12,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8) ,
                        child: Align(
                        alignment: Alignment.center,
                            child: Text("Tổng:  ${NumberFormat.simpleCurrency(locale: 'vi_VN').format(totalPrice)}",
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 20))))),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: (){
                        print("OK");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: color_gradient_primary,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 8,
                              blurRadius: 12,
                              offset: Offset(1, 10), // changes position of shadow
                            ),
                          ],
                        ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Thanh toán",
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 20, color: Colors.white))),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}
