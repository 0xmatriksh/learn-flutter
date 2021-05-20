import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;
  bool changeIcon = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        changeIcon = true;
      });
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, '/');
      setState(() {
        changeButton = false;
        changeIcon = false;
      });
    }
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter username',
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Username cannot be empty";
                        }

                        return null;
                      },
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be minimum 6";
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 18.0),
                    Material(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple,
                      child: InkWell(
                        onTap: () async {
                          moveToHome();
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 50,
                          width: changeButton ? 50 : 100,
                          child: changeIcon
                              ? Icon(
                                  Icons.done,
                                  color: Colors.greenAccent[400],
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                          alignment: Alignment.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
