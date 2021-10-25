import 'package:cesc/screen/HalamanInfo.dart';
import 'package:cesc/screen/UpdateInfo.dart';
import 'package:cesc/screen/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//AMAN

class DetailInfo extends StatefulWidget {
  const DetailInfo({Key? key, required this.namaInfo}) : super(key: key);
  final String namaInfo;

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 29,
          ),
        ),
        title: Text(
          'Detail Info',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF0072B8), Color(0xFF7ABCDE)])),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          height: 50,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateInfo(
                                                namaInfo: widget.namaInfo,
                                              )));
                                },
                                child: Text('EDIT'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  FirebaseFirestore.instance
                                      .collection('Infos')
                                      .doc(widget.namaInfo)
                                      .delete();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashBoard()));
                                },
                                child: Text('DELETE'),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Icon(
                Icons.more_horiz,
                size: 36,
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Infos")
                  .doc(widget.namaInfo)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Scaffold();
                } else {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              (snapshot.data as dynamic)["Nama_Event"],
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Center(
                            child: Container(
                              height: 370,
                              width: 300,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/poster/sps.jpg'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Divider(
                            color: Colors.grey[850],
                            thickness: 0.8,
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Kategori Acara',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '   :  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    (snapshot.data
                                        as dynamic)["Kategori Acara"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
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
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Tanggal Acara',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '    :  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    (snapshot.data as dynamic)["Tanggal_Acara"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
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
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Deskripsi Acara  :  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    (snapshot.data as dynamic)["Deskripsi"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
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
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kontak yang bisa dihubungi :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text(
                                        'LINE  : ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        (snapshot.data as dynamic)[
                                            "Kontak_yang_bisa_Dihubungi"],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
