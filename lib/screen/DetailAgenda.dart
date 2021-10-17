import 'package:cesc/screen/HalAgendaUser.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailAgenda extends StatelessWidget {
  const DetailAgenda({Key? key}) : super(key: key);

  /*final int namaAgenda;

  getNamaAgenda(namaagenda) {
    namaagenda = namaAgenda;
  }*/

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
          'Detail Agenda',
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
              onTap: () {},
              child: Icon(
                Icons.more_horiz,
                size: 36,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Agendas").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Scaffold();
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  documentSnapshot["Nama_Acara"],
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.notifications_none,
                                  size: 28,
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Container(
                                height: 200,
                                width: 350,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/background/hima.jpg'),
                                  ),
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
                                      'Penyelenggara Acara',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '  :  ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      documentSnapshot["Penyelenggara_Acara"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
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
                                      'Waktu Diadakan',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '           :  ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      documentSnapshot["Waktu_Diadakan"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
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
                                      'Lokasi',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '                            :  ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      documentSnapshot["Lokasi"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Deskripsi  :  ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      documentSnapshot["Deskripsi"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
