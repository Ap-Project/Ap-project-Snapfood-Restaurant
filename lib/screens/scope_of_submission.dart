import 'package:flutter/material.dart';
import 'package:common_codes/screens/decoration.dart';
import 'package:restaurant_app/modules/orders_detail.dart';
import 'package:restaurant_app/modules/registered_restaurant_list.dart';
import 'package:restaurant_app/modules/shipping_area_calculating.dart';


class ScopeOfSubmission extends StatefulWidget {
  static String scopeOfSubmissionId = '/ScopeOfSubmission';
  @override
  _ScopeOfSubmissionState createState() => _ScopeOfSubmissionState();
}

class _ScopeOfSubmissionState extends State<ScopeOfSubmission> {
  ShippingExample shippingExample = new ShippingExample();
  RegisteredRestaurantList restaurantList = new RegisteredRestaurantList();
  int inputDistance = 0;
  void checkAddress(OrdersDetail ordersDetail){
    double distance = Shipping.distance(restaurantList.getRegisteredList().elementAt(4).latLng.latitudeInRad, ordersDetail.latLng.latitudeInRad, restaurantList.getRegisteredList().elementAt(4).latLng.longitudeInRad, ordersDetail.latLng.longitudeInRad);
    if (distance > inputDistance){
      ordersDetail.isSupported = Text('not supported',
        style: TextStyle(color: Colors.red),
      );
    }
    else{
     ordersDetail.isSupported = Text('supported',
     style: TextStyle(color: Colors.green),);
    }

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Scope Of Submission"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/map.png'),
                height: size.height / 3,
                width:  size.width,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListTile(
                  leading: Icon(Icons.electric_bike),
                  title: Text("Your chosen distance"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  decoration: myDecoration.TextFormFieldDecoration("Distance (km)", "Distance (km)"),
                  keyboardType: TextInputType.numberWithOptions(),
                  onChanged: (value){
                    inputDistance = int.parse(value);
                  },
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: shippingExample.shippingExample.length,
                  itemBuilder: (context,index){
                  checkAddress(shippingExample.shippingExample.elementAt(index));
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text("Customer\'s name: "),
                          title: Text(shippingExample.shippingExample.elementAt(index).customerName),
                        ),
                        ListTile(
                          leading: Text("Customer\'s address: "),
                          title: Text(shippingExample.shippingExample.elementAt(index).address),
                        ),
                        ListTile(
                          leading: Text("Address is: "),
                          title:shippingExample.shippingExample.elementAt(index).isSupported,
                        ),
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
