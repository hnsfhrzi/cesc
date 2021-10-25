import 'package:cesc/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? userName,
      userNrp,
      userEmail,
      userNoTelp,
      userReAddress,
      userSuAddress,
      userPass;

  getName(name) {
    this.userName = name;
  }

  getNRP(nrp) {
    this.userNrp = nrp;
  }

  getEmail(email) {
    this.userEmail = email;
  }

  getNomorTelp(telepon) {
    this.userNoTelp = telepon;
  }

  getRealAddress(rAddress) {
    this.userReAddress = rAddress;
  }

  getSuraAddress(sAddress) {
    this.userSuAddress = sAddress;
  }

  getPassword(password) {
    this.userPass = password;
  }

  createData() {
    print('created');

    /*CollectionReference Info = FirebaseFirestore.instance.collection("Users");

    Info.add({
      "Nama": userName,
      "NRP": userNrp,
      "Email": userEmail,
      "NoTelp": userNoTelp,
      "Alamat_Asal": userReAddress,
      "Alamat_Surabaya": userSuAddress,
      "Password": userPass,
    });*/

    DocumentReference User =
        FirebaseFirestore.instance.collection("Users").doc(userName);

    Map<String, dynamic> users = {
      "Nama": userName,
      "NRP": userNrp,
      "Email": userEmail,
      "NoTelp": userNoTelp,
      "Alamat_Asal": userReAddress,
      "Alamat_Surabaya": userSuAddress,
      "Password": userPass,
    };

    User.set(users).whenComplete(() => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buat Akun',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 29,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0072B8), Color(0xFF7ABCDE)]),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Lengkap',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    child: TextFormField(
                      onChanged: (String name) {
                        getName(name);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'NRP',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    child: TextFormField(
                      onChanged: (String nrp) {
                        getNRP(nrp);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    child: TextFormField(
                      onChanged: (String email) {
                        getEmail(email);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No.Telp',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    child: TextFormField(
                      onChanged: (String telepon) {
                        getNomorTelp(telepon);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Alamat Asal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    child: TextFormField(
                      onChanged: (String rAddress) {
                        getRealAddress(rAddress);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Alamat Surabaya',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    child: TextFormField(
                      onChanged: (String sAddress) {
                        getSuraAddress(sAddress);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    child: TextFormField(
                      onChanged: (String password) {
                        getPassword(password);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CancelButton(),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          createData();
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: 113,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue[400],
                          ),
                          child: Center(
                            child: Text(
                              'Buat',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*class IsiForm extends StatefulWidget {
  const IsiForm();

  @override
  _IsiFormState createState() => _IsiFormState();
}

class _IsiFormState extends State<IsiForm> {
  String? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: TextFormField(
        onSaved: (newValue) => controller = newValue,
        onChanged: (value) {
          setState(() {
            controller = value;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}*/

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 50,
        width: 113,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue[400],
          //borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

/*class BuatButton extends StatelessWidget {
  const BuatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        height: 50,
        width: 140,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Buat',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}*/
