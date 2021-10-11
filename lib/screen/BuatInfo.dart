import 'package:cesc/screen/HalInfo.dart';
import 'package:flutter/material.dart';

//AMAN

class BuatInfo extends StatelessWidget {
  const BuatInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buat Info',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HalInfo()));
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
                  colors: [Color(0xFF0072B8), Color(0xFF7ABCDE)])),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kategori Acara :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                IsiForm(tinggi: 35),
                SizedBox(height: 20),
                Text(
                  'Tanggal Acara :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                IsiForm(tinggi: 35),
                SizedBox(height: 20),
                Text(
                  'Kontak yang Bisa Dihubungi :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                IsiForm(tinggi: 35),
                SizedBox(height: 20),
                Text(
                  'Deskripsi :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                IsiForm(tinggi: 60),
                SizedBox(height: 20),
                Row(
                  children: [
                    CancelButton(),
                    SizedBox(width: 20),
                    BuatButton(),
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

class IsiForm extends StatefulWidget {
  const IsiForm({required this.tinggi});
  final double tinggi;

  @override
  _IsiFormState createState() => _IsiFormState();
}

class _IsiFormState extends State<IsiForm> {
  String? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.tinggi,
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
}

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HalInfo()));
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
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}

class BuatButton extends StatelessWidget {
  const BuatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HalInfo()));
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
}
