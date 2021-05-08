class OrdersDetail{
  DateTime _dateTime;
  String _trackingCode;
  int _orderCost;
  String _customerName;
  bool _orderState;
  OrdersDetail(this._dateTime,this._trackingCode,this._orderCost,this._customerName,this._orderState);

  DateTime get dateTime => _dateTime;

  String get trackingCode => _trackingCode;

  bool get orderState => _orderState;

  String get customerName => _customerName;

  int get orderCost => _orderCost;

  set orderState(bool value) {
    _orderState = value;
  }
}