import 'package:common_codes/screens/decoration.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'modules/dashboard_details.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime _dateTime = DateTime.now();
  DashboardDetailsList dashboardDetailsList = new DashboardDetailsList();

  Text tabText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Row myRowDesign(String title, String number, String price, double size1,
        double size2, IconData iconData) {
      return Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: 1.0,
          ),
          Text(title),
          SizedBox(
            width: size1,
          ),
          Text(number),
          SizedBox(
            width: size2,
          ),
          Text(price),
          Spacer(),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'Dashboard',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.mail,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  tabText('Overview'),
                  Spacer(),
                  tabText('Sales report'),
                  Spacer(),
                  tabText('Performance points'),
                  Spacer(),
                  tabText('Product report'),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
          ),
          Card(
            child: ListTile(
              leading: IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    ).then((date) {
                      setState(() {
                        _dateTime = date;
                      });
                    });
                  }),
              title: Text(DateFormat('EEEE, d MMM, yyyy').format(_dateTime)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Sale\'s report',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    myRowDesign('title', 'number','price', size.width / 4 + 20, size.width / 4 - 20, null),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    myRowDesign(
                        'online sell',
                        dashboardDetailsList
                            .numberOfOnlineSales(_dateTime)
                            .toString(),
                        dashboardDetailsList
                            .priceOfOnlineSales(_dateTime)
                            .toString(),
                        size.width / 4 + 7,
                        size.width / 4,
                        Icons.credit_card),
                    SizedBox(
                      height: 10.0,
                    ),
                    myRowDesign(
                        'cash sell',
                        dashboardDetailsList
                            .numberOfCashSales(_dateTime)
                            .toString(),
                        dashboardDetailsList
                            .priceOfCashSales(_dateTime)
                            .toString(),
                        size.width / 4 + 15,
                        size.width / 4,
                        Icons.account_balance_wallet),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    myRowDesign('Total sales', dashboardDetailsList
                        .totalNumber(_dateTime)
                        .toString(),dashboardDetailsList
                        .totalPrice(_dateTime)
                        .toString(), size.width / 4, size.width / 4, null),
                  ],
                ),
              ),
              decoration: myDecoration.myBoxDecoration(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Total sales last week'),
                    trailing: Text(dashboardDetailsList.lastWeekPrice(_dateTime).toString()),
                  ),
                  ListTile(
                    title: Text('Total sales last month'),
                    trailing: Text(dashboardDetailsList.lastMonthPrice(_dateTime).toString()),
                  ),
                  ListTile(
                    title: Text('Total sales last year'),
                    trailing: Text(dashboardDetailsList.lastYearPrice(_dateTime).toString()),
                  ),
                ],
              ),
              decoration: myDecoration.myBoxDecoration(),
            ),
          )
        ],
      ),
    );
  }
}
