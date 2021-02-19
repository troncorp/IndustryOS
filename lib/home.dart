import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Industry OS')),
      body: Center(child: Text('My Page!')),
      drawer: showDrawer(context),
    );
  }
}

Widget showDrawerItem({String name, String route, BuildContext context,}) {
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
      ],
    ),
  );
}