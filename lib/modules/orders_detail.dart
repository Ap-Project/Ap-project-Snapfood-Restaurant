import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class OrdersDetail{
  DateTime dateTime;
  String trackingCode;
  int orderCost;
  String customerName;
  bool orderState;
  String address;
  LatLng latLng;
  Text isSupported;
  OrdersDetail({this.dateTime,this.trackingCode,this.orderCost,this.customerName,this.orderState,this.address,this.latLng,this.isSupported});

}