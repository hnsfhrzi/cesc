import 'package:cesc/screen/Kalender.dart';
import 'package:cesc/screen/dashboard.dart';
import 'package:cesc/screen/signup.dart';
import 'package:flutter/material.dart';

//kurang halaman kalender

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0072B8), Color(0xFF7ABCDE)]),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo/ce.png',
                  width: 200,
                ),
                SizedBox(height: 27),
                LoginForm(hintText: 'NRP'),
                SizedBox(height: 27),
                LoginForm(hintText: 'Password'),
                SizedBox(height: 29),
                LoginButton(),
                SizedBox(height: 27),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum Memiliki Akun? ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Buat Akun',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({required this.hintText});
  final String hintText;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onSaved: (newValue) => controller = newValue,
        onChanged: (value) {
          setState(() {
            controller = value;
          });
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DashBoard()));
      },
      child: Container(
        height: 50,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Masuk',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 23,
              )
            ],
          ),
        ),
      ),
    );
  }
}
