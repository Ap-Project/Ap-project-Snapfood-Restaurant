import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:restaurant_app/modules/orders_detail.dart';

class Shipping {
  static double distance(double lat1, double lat2, double lon1, double lon2) {
    // Haversine formula
    double dlon = lon2 - lon1;
    double dlat = lat2 - lat1;
    double a =
        pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);

    double c = 2 * asin(sqrt(a));

    // Radius of earth in kilometers. Use 3956
    // for miles
    double r = 6371;

    // calculate the result
    return (c * r);
  }
}

class ShippingExample{
  List<OrdersDetail> _shippingExample = [
    OrdersDetail(customerName: "Ghazal Laghaee",address: "Tehran,Enghelab square،University Of Tehran",latLng: LatLng(35.702177,51.397301),isSupported: Text('')),
    OrdersDetail(customerName: "Sana Haghighi",address: "Tehran Province, Tehran, District 1, Farhangsara St, Iran",latLng: LatLng(35.811274,51.478786),isSupported: Text('')),
  ];

  List<OrdersDetail> get shippingExample => _shippingExample;
}
