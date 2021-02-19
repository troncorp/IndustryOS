import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/daily_logs.dart';
import 'Screens/internal_audit_reports.dart';
import 'Screens/report.dart';
import 'Screens/safety_meetings_loggers.dart';
import 'home.dart';
import 'login.dart';
import 'signup.dart';
import 'Screens/mis.dart';

void main(){
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Colors.yellow[600],
        accentColor: Colors.amber[600],
      ),
      routes: {
        '/':(context) => SplashScreen(),
        '/login':(context) => LoginScreen(),
        '/signup':(context) => SignUpScreen(),
        '/home':(context) => HomeScreen(),
        '/home/mis':(context) => MisScreen(),
        '/home/report':(context) => ReportScreen(),
        '/home/daily_logs' : (context) => DailyLogsScreen(),
        '/home/safety_meeting_loggers' : (context) => SafetyMeetingLoggersScreen(),
        '/home/internal_audit_reports' : (context) => InternalAuditReportScreen(),
      },
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  Animation<double> anim;
  AnimationController animController;

  void waitAndMove() async{
    Timer(Duration(seconds: 3),(){
      print('moving to login screen');
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    anim = Tween<double>(begin: 0.0, end: 1.0).animate(animController);
    anim.addListener(() {
      setState(() {});
    });
    anim.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animController.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        animController.forward();
      }
    });
    animController.forward();
    waitAndMove();

  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: AnimatedOpacity(
                  opacity: anim.value,
                  duration: Duration(milliseconds: 600),
                  child: Hero(tag: 'logo',
                      child: Image.asset('images/OSLogoBg.png'),),),
            ),
            Center(
              child: Image.asset('images/IndustryOSLOGO.png'),
            )
          ],
        ),
      ),
    );
  }
}
