

class DashboardDetails {
  DateTime _dateTime;
  int _price;

  DashboardDetails(this._dateTime, this._price);

  DateTime get dateTime => _dateTime;

  int get price => _price;
}

class DashboardDetailsList {
  List<DashboardDetails> _onlineSales = [
    DashboardDetails(DateTime.now(), 100000),
    DashboardDetails(DateTime.now(), 100000),
    DashboardDetails(DateTime.now(), 100000),
    DashboardDetails(DateTime.now(), 100000),
    DashboardDetails(DateTime.now(), 100000),
    DashboardDetails(DateTime.now().add(Duration(days: 10)), 100000),
    DashboardDetails(DateTime.now().add(Duration(days: 10)), 200000),
    DashboardDetails(DateTime.now().add(Duration(days: 10)), 300000),
  ];

  List<DashboardDetails> _cashSales = [
    DashboardDetails(DateTime.now(), 100000),
    DashboardDetails(DateTime.now(), 100000),
    DashboardDetails(DateTime.now().add(Duration(days: 12)), 100000),
    DashboardDetails(DateTime.now().add(Duration(days: 12)), 200000),
    DashboardDetails(DateTime.now().add(Duration(days: 12)), 600000),
  ];

  int numberOfOnlineSales(DateTime dateTime) {
    int num = 0;
    for (int i = 0; i < _onlineSales.length; i++) {
      if (dateTime.year == _onlineSales[i].dateTime.year &&
          dateTime.month == _onlineSales[i].dateTime.month &&
          dateTime.day == _onlineSales[i].dateTime.day) num++;
    }
    return num;
  }

  int priceOfOnlineSales(DateTime dateTime) {
    int price = 0;
    for (int i = 0; i < _onlineSales.length; i++) {
      if (dateTime.year == _onlineSales[i].dateTime.year &&
          dateTime.month == _onlineSales[i].dateTime.month &&
          dateTime.day == _onlineSales[i].dateTime.day)
        price += _onlineSales[i].price;
    }
    return price;
  }

  int numberOfCashSales(DateTime dateTime) {
    int num = 0;
    for (int i = 0; i < _cashSales.length; i++) {
      if (dateTime.year == _cashSales[i].dateTime.year &&
          dateTime.month == _cashSales[i].dateTime.month &&
          dateTime.day == _cashSales[i].dateTime.day) num++;
    }
    return num;
  }

  int priceOfCashSales(DateTime dateTime) {
    int price = 0;
    for (int i = 0; i < _cashSales.length; i++) {
      if (dateTime.year == _cashSales[i].dateTime.year &&
          dateTime.month == _cashSales[i].dateTime.month &&
          dateTime.day == _cashSales[i].dateTime.day)
        price += _cashSales[i].price;
    }
    return price;
  }

  int totalNumber(DateTime dateTime) {
    return numberOfCashSales(dateTime) + numberOfOnlineSales(dateTime);
  }

  int totalPrice(DateTime dateTime){
    return priceOfCashSales(dateTime) + priceOfOnlineSales(dateTime);
  }

  int lastWeekPrice(DateTime dateTime){
    int price = 0;
    for (int i = 0 ; i < 7 ; i++){
     price += totalPrice(dateTime.subtract(Duration(days: i)));
    }
    return price;
  }

  int lastMonthPrice(DateTime dateTime){
    int price = 0;
    for (int i = 0 ; i < 30 ; i++){
     price += totalPrice(dateTime.subtract(Duration(days: i)));
    }
    return price;
  }

  int lastYearPrice(DateTime dateTime){
    int price = 0;
    for (int i = 0 ; i < 365 ; i++){
     price += totalPrice(dateTime.subtract(Duration(days: i)));
    }
    return price;
  }

}
