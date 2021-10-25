import 'package:cesc/screen/HalamanInfo.dart';
import 'package:cesc/screen/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BuatInfo extends StatefulWidget {
  const BuatInfo({Key? key}) : super(key: key);

  @override
  _BuatInfoState createState() => _BuatInfoState();
}

class _BuatInfoState extends State<BuatInfo> {
  String? infoName, infoCategory, infoDate, infoContact, infoDescription;

  getinfoName(name) {
    this.infoName = name;
  }

  getinfoCategory(category) {
    this.infoCategory = category;
  }

  getinfoDate(date) {
    this.infoDate = date;
  }

  getinfoContact(contact) {
    this.infoContact = contact;
  }

  getinfoDescription(descrip) {
    this.infoDescription = descrip;
  }

  createData() {
    print('created');

    /*CollectionReference Info = FirebaseFirestore.instance.collection("Infos");

    Info.add({
      "Nama_Event": infoName,
      "Kategori_Acara": infoCategory,
      "Tanggal_Acara": infoDate,
      "Kontak yang bisa Dihubungi": infoContact,
      "Deskripsi": infoDescription,
    });*/

    DocumentReference Info =
        FirebaseFirestore.instance.collection("Infos").doc(infoName);

    Map<String, dynamic> infos = {
      "Nama_Event": infoName,
      "Kategori Acara": infoCategory,
      "Tanggal_Acara": infoDate,
      "Kontak_yang_bisa_Dihubungi": infoContact,
      "Deskripsi": infoDescription,
    };

    Info.set(infos).whenComplete(() => null);
  }

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
                context, MaterialPageRoute(builder: (context) => DashBoard()));
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
                  'Nama Acara :',
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
                      getinfoName(name);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Kategori Acara :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 35,
                  child: TextFormField(
                    onChanged: (String category) {
                      getinfoCategory(category);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Tanggal Acara :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 35,
                  child: TextFormField(
                    onChanged: (String date) {
                      getinfoDate(date);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Pick Date :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021, 8, 1),
                      lastDate: DateTime(2032, 12, 25),
                    );
                  },
                  child: Icon(
                    Icons.calendar_today,
                    size: 29,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Kontak yang Bisa Dihubungi :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 35,
                  child: TextFormField(
                    onChanged: (String contact) {
                      getinfoContact(contact);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Deskripsi :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 160,
                  child: TextFormField(
                    maxLines: 200,
                    onChanged: (String descrip) {
                      getinfoDescription(descrip);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
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
    );
  }
}

/*class IsiForm extends StatefulWidget {
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
            context, MaterialPageRoute(builder: (context) => InfoPage()));
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
