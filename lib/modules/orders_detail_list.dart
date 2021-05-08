import 'orders_detail.dart';
class OrdersDetailList{
  List<OrdersDetail> _ordersDetailList = [
    OrdersDetail(DateTime.now(),'099823587',100000,'Ghazal Laghaee',false),
    OrdersDetail(DateTime.now(),'099873587',900000,'Sana Haghighi',false),
    OrdersDetail(DateTime.now(),'097652358',800000,'Nawid Dadkhah',false),
    OrdersDetail(DateTime.now(),'094523587',700000,'Sania Masoudi',false),
  ];

  List<OrdersDetail> get ordersDetailList => _ordersDetailList;
}