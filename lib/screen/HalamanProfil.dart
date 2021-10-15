import 'package:cesc/screen/PassAdmin.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF0072B8), Color(0xFF7ABCDE)])),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    height: 260,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Image.asset(
                          'assets/images/logo/ce.png',
                          width: 180,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'DEPARTEMEN TEKNIK KOMPUTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'No. Telepon',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '    : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '(031) 5922936',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey[850],
                thickness: 0.8,
              ),
              SizedBox(height: 10),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '                : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'telematics@its.ac.id',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey[850],
                thickness: 0.8,
              ),
              SizedBox(height: 10),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'Alamat Surabaya',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        ' : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Jl. Raya ITS, Keputih, Kec. Sukolilo',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey[850],
                thickness: 0.8,
              ),
              SizedBox(height: 20),
              UbahPassword(),
            ],
          ),
        ),
      ),
    );
  }
}

class UbahPassword extends StatelessWidget {
  const UbahPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PassAdmin()));
      },
      child: Container(
        height: 50,
        width: 180,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Ubah Password',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
