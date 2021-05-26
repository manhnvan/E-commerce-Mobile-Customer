import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/screens/shoppingCart/components/Item.dart';
import 'package:flutter/material.dart';

class ItemsOfStore extends StatefulWidget {
  final List<dynamic> items;
  final int storeIndex;
  final Function update;

  ItemsOfStore({
    Key key,
    this.items,
    this.storeIndex,
    this.update
  }) : super(key: key);

  @override
  _ItemsOfStoreState createState() => _ItemsOfStoreState();
}

class _ItemsOfStoreState extends State<ItemsOfStore> {
  var checkedStore = true;
  var store;
  var index = -1;

  void _updateStore(var newStore) {
    // print(newStore);
    widget.items[widget.storeIndex]["products"] = newStore;
    widget.update(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    index = -1;
    setState(() {
      store = widget.items[widget.storeIndex];
      checkedStore = widget.items[widget.storeIndex]["products"].indexWhere((x) => x["checked"] == false) == -1;
    });
    return Container(
      decoration: BoxDecoration(
          gradient: color_gradient_glass,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
          ),
          border: Border.all(color: Colors.white60, width: 1)
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            onTap:(){
              // widget.items.removeAt(widget.storeIndex);
              // widget.update(widget.items);
              print("go to store");
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(store["avatar"]),
                  radius: 25
                ),
                SizedBox(width: 15,),
                Text(store["shopName"], style: Theme.of(context).textTheme.headline6,),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    for(var i = 0; i< store["products"].length; i++){
                      store["products"][i]["checked"] = !checkedStore;
                    }
                    widget.items[widget.storeIndex] = store;
                    widget.update(widget.items);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width:1),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Icon(checkedStore ? Icons.check_circle_sharp : Icons.circle,
                        color: checkedStore ? Colors.white : Colors.transparent, size: 25),
                  ),
                )
              ],
            ),
          ),
        ] + store["products"].map<Widget>((e) {
          index += 1;
          return Item(
              store: store["products"],
              updateStore: _updateStore,
              productIndex: index);}).toList()
      ),
    );
  }
}
