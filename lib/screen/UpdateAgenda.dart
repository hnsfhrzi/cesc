import 'package:cesc/screen/HalAgendaUser.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateAgenda extends StatefulWidget {
  const UpdateAgenda({Key? key, required this.namaAgenda}) : super(key: key);
  final String namaAgenda;

  @override
  _UpdateAgendaState createState() => _UpdateAgendaState();
}

class _UpdateAgendaState extends State<UpdateAgenda> {
  String? agendaName,
      agendaOrganizer,
      agendaTime,
      agendaLocation,
      agendaDescription;

  updateagendaName(name) {
    this.agendaName = name;
  }

  updateagendaOrganizer(organizer) {
    this.agendaOrganizer = organizer;
  }

  updateagendaTime(time) {
    this.agendaTime = time;
  }

  updateagendaLocation(locat) {
    this.agendaLocation = locat;
  }

  updateagendaDescription(descrip) {
    this.agendaDescription = descrip;
  }

  updateData(String nama, penyelenggara, waktu, lokasi, deskripsi) {
    /*if (agendaName == null) {
      agendaName = nama;
    }*/

    print(agendaName);
    FirebaseFirestore.instance
        .collection("Agendas")
        .doc(widget.namaAgenda)
        .update({
      "Nama_Acara": agendaName == null ? agendaName = nama : agendaName,
      "Penyelenggara_Acara": agendaOrganizer == null
          ? agendaOrganizer = penyelenggara
          : agendaOrganizer,
      "Waktu_Diadakan": agendaTime == null ? agendaTime = waktu : agendaTime,
      "Lokasi":
          agendaLocation == null ? agendaLocation = lokasi : agendaLocation,
      "Deskripsi": agendaDescription == null
          ? agendaDescription = deskripsi
          : agendaDescription,
    });
    print('Data Updated');
  }

  @override
  Widget build(BuildContext context) {
    /*FirebaseFirestore.instance
        .collection('Agendas')
        .doc(widget.namaAgenda)
        .snapshots();*/

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Agenda',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        //Icon Back Button that direct to HalAgendaAdmin
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 29,
          ),
        ),
        //Giving Gradient Color for AppBar
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
              .collection('Agendas')
              .doc(widget.namaAgenda)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Scaffold();
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
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
                                (snapshot.data as dynamic)['Nama_Acara'],
                            onChanged: (String name) {
                              updateagendaName(name);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Penyelenggara Acara :',
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
                                as dynamic)['Penyelenggara_Acara'],
                            onChanged: (String organizer) {
                              updateagendaOrganizer(organizer);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Waktu Diadakan :',
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
                                (snapshot.data as dynamic)['Waktu_Diadakan'],
                            onChanged: (String time) {
                              updateagendaTime(time);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Lokasi Acara :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 35,
                          child: TextFormField(
                            initialValue: (snapshot.data as dynamic)['Lokasi'],
                            onChanged: (String locati) {
                              updateagendaLocation(locati);
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
                            onChanged: (String descript) {
                              updateagendaDescription(descript);
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
                                    (snapshot.data as dynamic)['Nama_Acara'],
                                    (snapshot.data
                                        as dynamic)['Penyelenggara_Acara'],
                                    (snapshot.data
                                        as dynamic)['Waktu_Diadakan'],
                                    (snapshot.data as dynamic)['Lokasi'],
                                    (snapshot.data as dynamic)['Deskripsi']);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HalAgendaUser()));
                              },
                              child: Container(
                                height: 50,
                                width: 119,
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
    return InkWell(
      onTap: () {
        Navigator.pop(context);
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
