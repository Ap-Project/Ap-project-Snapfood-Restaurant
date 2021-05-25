import 'orders_detail.dart';
class OrdersDetailList{
  List<OrdersDetail> _ordersDetailList = [
    OrdersDetail(dateTime: DateTime.now(),trackingCode: '099823587',orderCost: 100000,customerName: 'Ghazal Laghaee',orderState: false),
    OrdersDetail(dateTime: DateTime.now(),trackingCode: '099873587',orderCost: 900000,customerName: 'Sana Haghighi',orderState: false),
    OrdersDetail(dateTime: DateTime.now(),trackingCode: '097652358',orderCost: 800000,customerName: 'Nawid Dadkhah',orderState: false),
    OrdersDetail(dateTime:DateTime.now(),trackingCode: '094523587',orderCost: 700000,customerName: 'Sania Masoudi',orderState: false),
  ];

  List<OrdersDetail> get ordersDetailList => _ordersDetailList;
}