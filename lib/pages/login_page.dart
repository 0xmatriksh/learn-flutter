import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Image.asset('assets/images/login_image.png',fit:BoxFit.contain),
        SizedBox(height:20.0),
        Text('Welcome',
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            children: [
              TextFormField(
                decoration : InputDecoration(
                  hintText: 'Enter username',
                  labelText: 'Username',
                ),
              ),
              TextFormField(
                decoration : InputDecoration(
                  hintText: 'Enter password',
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height:18.0),
              ElevatedButton(
                onPressed: () {}, 
                child: Text(
                  'Login'
                ))
            ],
          ),
        ),

      ],),
    );
  }
}