import 'package:common_codes/screens/decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/orders_detail_list.dart';
import 'package:intl/intl.dart';

const Color boxesColor = Colors.white;

class OrdersDetailScreen extends StatefulWidget {
  static String ordersDetailScreenId = '/ordersDetailScreenId';
  @override
  _OrdersDetailScreenState createState() => _OrdersDetailScreenState();
}

class _OrdersDetailScreenState extends State<OrdersDetailScreen> {
  OrdersDetailList _ordersDetailList = new OrdersDetailList();
  Text stateText(bool state){
    if (state)
      return Text('delivered',
        style: TextStyle(
          color: Colors.green,
        ),
      );
    return Text(
      'not delivered',
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }
  Icon stateIcon(bool state){
    if (state)
      return Icon(
        Icons.check_circle,
        color: Colors.green,
      );
    return Icon(
      Icons.radio_button_unchecked,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('orders detail'),
      ),
      body: ListView.builder(
          itemCount: _ordersDetailList.ordersDetailList.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Column(
                    children: [
                      OrderListTile(text1: 'Date', text2 : DateFormat('EEEE, d MMM, yyyy  hh:mm').format(_ordersDetailList.ordersDetailList.elementAt(index).dateTime)),
                      OrderListTile(text1: 'Tracking code', text2: _ordersDetailList.ordersDetailList.elementAt(index).trackingCode,),
                      OrderListTile(text1: 'Order\'s cost', text2 : _ordersDetailList.ordersDetailList.elementAt(index).orderCost.toString(),),
                      OrderListTile(text1: 'customer\'s name', text2: _ordersDetailList.ordersDetailList.elementAt(index).customerName,),
                      ListTile
                        (
                        title: Row(
                          children: [
                            Text('state'),
                            SizedBox(
                              width: 25.0,
                            ),
                            stateText(_ordersDetailList.ordersDetailList.elementAt(index).orderState),
                          ],
                        ),
                        trailing: stateIcon(_ordersDetailList.ordersDetailList.elementAt(index).orderState),
                        onTap: (){
                          setState(() {
                            _ordersDetailList.ordersDetailList.elementAt(index).orderState = ! _ordersDetailList.ordersDetailList.elementAt(index).orderState;
                          });
                        },
                      ),


                    ],
                  ),
                  decoration: myDecoration.myBoxDecoration(),
                ),
              ),
            );
          }),
    );
  }
}

class OrderListTile extends StatefulWidget {
  final String text1;
  final String text2;
  OrderListTile({this.text1,this.text2});
  @override
  _OrderListTileState createState() => _OrderListTileState();
}

class _OrderListTileState extends State<OrderListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.text1),
      trailing: Text(widget.text2),
    );
  }
}
