import 'package:cesc/screen/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UpdateInfo extends StatefulWidget {
  const UpdateInfo({Key? key, required this.namaInfo}) : super(key: key);
  final String namaInfo;

  @override
  _UpdateInfoState createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {
  String? infoName, infoCategory, infoDate, infoContact, infoDescription;

  updateinfoName(name) {
    this.infoName = name;
  }

  updateinfoCategory(category) {
    this.infoCategory = category;
  }

  updateinfoDate(date) {
    this.infoDate = date;
  }

  updateinfoContact(contact) {
    this.infoContact = contact;
  }

  updateinfoDescription(descrip) {
    this.infoDescription = descrip;
  }

  updateData(String nama, kategori, tanggal, kontak, deskripsi) {
    FirebaseFirestore.instance.collection("Infos").doc(widget.namaInfo).update({
      "Nama_Event": infoName == null ? infoName = nama : infoName,
      "Kategori Acara":
          infoCategory == null ? infoCategory = kategori : infoCategory,
      "Tanggal_Acara": infoDate == null ? infoDate = tanggal : infoDate,
      "Kontak_yang_bisa_Dihubungi":
          infoContact == null ? infoContact = kontak : infoContact,
      "Deskripsi": infoDescription == null
          ? infoDescription = deskripsi
          : infoDescription,
    });
    print('Data Updated');
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Infos')
              .doc(widget.namaInfo)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Scaffold();
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 40.0),
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
                            initialValue:
                                (snapshot.data as dynamic)['Nama_Event'],
                            onChanged: (String name) {
                              updateinfoName(name);
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
                            initialValue:
                                (snapshot.data as dynamic)['Kategori Acara'],
                            onChanged: (String category) {
                              updateinfoCategory(category);
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
                            initialValue:
                                (snapshot.data as dynamic)['Tanggal_Acara'],
                            onChanged: (String date) {
                              updateinfoDate(date);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
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
                            initialValue: (snapshot.data
                                as dynamic)['Kontak_yang_bisa_Dihubungi'],
                            onChanged: (String contact) {
                              updateinfoContact(contact);
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
                            initialValue:
                                (snapshot.data as dynamic)['Deskripsi'],
                            onChanged: (String descrip) {
                              updateinfoDescription(descrip);
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
                                updateData(
                                    (snapshot.data as dynamic)['Nama_Event'],
                                    (snapshot.data
                                        as dynamic)['Kategori Acara'],
                                    (snapshot.data as dynamic)['Tanggal_Acara'],
                                    (snapshot.data as dynamic)[
                                        'Kontak_yang_bisa_Dihubungi'],
                                    (snapshot.data as dynamic)['Deskripsi']);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBoard()));
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
                                    'Update',
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
              );
            }
          }),
    );
  }
}

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
