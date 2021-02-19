import 'package:flutter/material.dart';

class SafetyMeetingLoggersScreen extends StatefulWidget {
  @override
  _SafetyMeetingLoggersScreenState createState() => _SafetyMeetingLoggersScreenState();
}

class _SafetyMeetingLoggersScreenState extends State<SafetyMeetingLoggersScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Safety Meetings Loggers')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              showFields(1),
              SizedBox(height: 10,),
              showFields(2),
              SizedBox(height: 10,),
              showFields(3),
              SizedBox(height: 10,),
              showFields(4),
              SizedBox(height: 10,),
              showFields(5),
              SizedBox(height: 10,),
              showFields(6),
              SizedBox(height: 10,),
              showFields(7),
              SizedBox(height: 10,),
              showFields(8),
              SizedBox(height: 10,),
              showFields(9),
              SizedBox(height: 10,),
              showFields(10),
              SizedBox(height: 10,),
              showFields(11),
            ],
          ),
        ),
      ),
      drawer: showDrawer(context),
    );
  }
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
        ),showDrawerItem(
          name: 'Sign Out',
          route: '/login',
          context: context,
        ),
      ],
    ),
  );
}

Widget showFields(int num){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Field $num',
        suffixIcon: Icon(Icons.receipt_long),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
  );
}