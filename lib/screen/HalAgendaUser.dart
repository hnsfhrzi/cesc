import 'package:cesc/screen/BuatAgenda.dart';
import 'package:cesc/screen/DetailAgenda.dart';
import 'package:cesc/screen/Kalender.dart';
import 'package:cesc/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HalAgendaUser extends StatefulWidget {
  const HalAgendaUser({Key? key}) : super(key: key);

  @override
  State<HalAgendaUser> createState() => _HalAgendaUserState();
}

class _HalAgendaUserState extends State<HalAgendaUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            //Icon Add Button that direct to BuatAgenda
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuatAgenda(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
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
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
                  SizedBox(width: 15),
                  Text(
                    '30 September 2021',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                  )
                ],
              ),
              SizedBox(height: 15),
              Divider(
                color: Colors.grey[850],
                thickness: 0.8,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Agendas")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Scaffold();
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];

                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 15.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailAgenda(
                                                namaAgenda: documentSnapshot
                                                    .reference.id,
                                              )));
                                },
                                child: Container(
                                  height: 180,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFF62A1FF),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 130,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                colorFilter: ColorFilter.mode(
                                                    Colors.white
                                                        .withOpacity(0.73),
                                                    BlendMode.dstATop),
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/images/background/hima.jpg'),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            documentSnapshot["Nama_Acara"],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 13),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          documentSnapshot["Nama_Acara"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
