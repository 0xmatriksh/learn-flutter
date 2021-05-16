import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;
  bool changeIcon = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Column(
            children: [
              Image.asset('assets/images/login_image.png', fit: BoxFit.contain),
              SizedBox(height: 20.0),
              Text(
                'Welcome $name',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter username',
                        labelText: 'Username',
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 18.0),
                    InkWell(
                      onTap: () async {
                        
                        setState(() {
                          changeButton = true;
                        });
                        await Future.delayed(Duration(seconds:1));
                        setState(() {
                          changeIcon = true;
                        });
                        await Future.delayed(Duration(seconds:2));
                        Navigator.pushNamed(context, '/');
                      },
                       child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: changeButton? 50 :100,
                        child:changeIcon ? Icon(
                          Icons.done,
                          color: Colors.greenAccent[400],
                        )
                        :Text('Login',
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Colors.white,
                          ) ,),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:Colors.deepPurple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
