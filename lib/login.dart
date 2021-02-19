import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHidden = true;
  IconData icon = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    // double width=MediaQuery.of(context).size.width;
    // double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset('images/IndustryOSLOGO.png',height: 250.0,width: 250.0,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Login',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 30.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                suffixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: TextField(
              obscureText: isHidden,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: GestureDetector(onTap: (){setState(() {
                  if(isHidden == true){
                    isHidden = false;
                    icon = Icons.visibility_off;
                  }
                  else{
                    isHidden = true;
                    icon = Icons.visibility;
                  }
                });},child: Icon(icon)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Forget password?',style: TextStyle(fontSize: 12.0),),
                RaisedButton(
                  child: Text('Login'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.yellow[600],
                  onPressed: (){
                    Navigator.of(context).pushNamedAndRemoveUntil('/home/mis', (route) => false);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height:20.0),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/signup');
            },
            child: Text.rich(
              TextSpan(
                  text: 'Don\'t have an account?',
                  children: [
                    TextSpan(
                      text: '  Signup',
                      style: TextStyle(
                          color: Color(0xffEE7B23)
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
