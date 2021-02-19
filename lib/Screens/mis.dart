import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

Map<String, double> dataMap = {
  "Flutter": 5,
  "React": 3,
  "Xamarin": 2,
  "Ionic": 2,
};

List<Color> colorList = [Colors.red,Colors.blue,Colors.green,Colors.yellow,Colors.tealAccent];

class MisScreen extends StatefulWidget {
  @override
  _MisScreenState createState() => _MisScreenState();
}

class _MisScreenState extends State<MisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MIS Dashboard'),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              showPicChart(context),
              SizedBox(height: 30,),
              showPicChart(context),
              SizedBox(height: 30,),
              showPicChart(context),
              SizedBox(height: 30,),
              showPicChart(context),
              SizedBox(height: 30,),
              showPicChart(context),
              SizedBox(height: 30,),
              showPicChart(context),
              SizedBox(height: 30,),
              showPicChart(context),
            ],
          ),
        ),
      ),
      drawer: showDrawer(context),
    );
  }
}


Widget showPicChart(BuildContext context){
  return PieChart(
    dataMap: dataMap,
    animationDuration: Duration(milliseconds: 800),
    chartLegendSpacing: 32,
    chartRadius: MediaQuery.of(context).size.width / 3.2,
    colorList: colorList,
    initialAngleInDegree: 0,
    chartType: ChartType.ring,
    ringStrokeWidth: 32,
    legendOptions: LegendOptions(
      showLegendsInRow: false,
      legendPosition: LegendPosition.right,
      showLegends: true,
      legendShape: BoxShape.circle,
      legendTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    chartValuesOptions: ChartValuesOptions(
      showChartValueBackground: true,
      showChartValues: true,
      showChartValuesInPercentage: false,
      showChartValuesOutside: false,
    ),
  );
}

Widget showDrawerItem({String name, String route, BuildContext context,}) {
  if(name == 'Sign Out')
    {
      return ListTile(
          title: Text(name),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
          },
      );
    }
  return ListTile(
    title: Text(name),
    onTap: () {
      Navigator.pop(context);
      Navigator.pushNamed(context, route);
    },
  );
}

Widget showDrawer(BuildContext context){
  return Drawer(
    child: ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            children: [
              Expanded(child: Image.asset('images/IndustryOSLOGO.png')),
              Text('Hello, Bikash')
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow[600],
          ),
        ),
        showDrawerItem(
          name: 'MIS',
          route: '/home/mis',
          context: context,
        ),
        showDrawerItem(
          name: 'Report',
          route: '/home/report',
          context: context,
        ),
        showDrawerItem(
          name: 'Daily Logs',
          route: '/home/daily_logs',
          context: context,
        ),
        showDrawerItem(
          name: 'Safety meeting Loggers',
          route: '/home/safety_meeting_loggers',
          context: context,
        ),
        showDrawerItem(
          name: 'Internal Audit Reports',
          route: '/home/internal_audit_reports',
          context: context,
        ),
        showDrawerItem(
          name: 'Sign Out',
          route: '/login',
          context: context,
        ),
      ],
    ),
  );
}