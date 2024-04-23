import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/assets.dart';
 import 'package:flutter/material.dart';

class WebUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign in',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter your email and password to sign in',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Email*',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'mail@example.com',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Password*',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'min 8 characters',
                      labelStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (_) {}),
                      Text('Keep me logged in'),
                      Spacer(),
                      Text('Forgot password'),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff4318FF)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Not registered yet? Create an Account'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0351F3), Color(0xffC7EEF9)],
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.logo, // Provide your logo path here
                    height: 80,
                  ),
                  SizedBox(height: 100),
                  InkWell(
                    onTap: () {
                      // Handle navigation to horizon-ui.com
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Learn more about Horizon Union',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Horizon-ui.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Marketplace', style: TextStyle(fontSize: 10, color: Colors.white)),
                      Text('License', style: TextStyle(fontSize: 10, color: Colors.white)),
                      Text('Terms of Use', style: TextStyle(fontSize: 10, color: Colors.white)),
                      Text('Blog', style: TextStyle(fontSize: 10, color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
