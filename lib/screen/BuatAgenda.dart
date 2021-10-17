import 'package:cesc/screen/HalAgendaUser.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuatAgenda extends StatefulWidget {
  const BuatAgenda({Key? key}) : super(key: key);

  @override
  _BuatAgendaState createState() => _BuatAgendaState();
}

class _BuatAgendaState extends State<BuatAgenda> {
  String? agendaName,
      agendaOrganizer,
      agendaTime,
      agendaLocation,
      agendaDescription;

  getagendaName(name) {
    this.agendaName = name;
  }

  getagendaOrganizer(organizer) {
    this.agendaOrganizer = organizer;
  }

  getagendaTime(time) {
    this.agendaTime = time;
  }

  getagendaLocation(locat) {
    this.agendaLocation = locat;
  }

  getagendaDescription(descrip) {
    this.agendaDescription = descrip;
  }

  createData() {
    print('created');

    /*CollectionReference Agenda =
        FirebaseFirestore.instance.collection("Agendas");

    Agenda.add({
      "NamaAcara": agendaName,
      "Penyelenggara_Acara": agendaOrganizer,
      "WaktuDiadakan": agendaTime,
      "Lokasi": agendaLocation,
      "Deskripsi": agendaDescription,
    });*/

    DocumentReference Agenda =
        FirebaseFirestore.instance.collection("Agendas").doc(agendaName);

    Map<String, dynamic> agendas = {
      "Nama_Acara": agendaName,
      "Penyelenggara_Acara": agendaOrganizer,
      "Waktu_Diadakan": agendaTime,
      "Lokasi": agendaLocation,
      "Deskripsi": agendaDescription,
    };

    Agenda.set(agendas).whenComplete(() => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buat Agenda',
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
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
                      getagendaName(name);
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
                    onChanged: (String organizer) {
                      getagendaOrganizer(organizer);
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
                    onChanged: (String time) {
                      getagendaTime(time);
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
                    onChanged: (String locati) {
                      getagendaLocation(locati);
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
                  height: 35,
                  child: TextFormField(
                    onChanged: (String descript) {
                      getagendaDescription(descript);
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
                        width: 119,
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
  const IsiForm(
      {required this.tinggi,
      required this.aO,
      required this.aT,
      required this.aL,
      required this.aD});

  final double tinggi;
  final bool aO;
  final bool aT;
  final bool aL;
  final bool aD;

  @override
  _IsiFormState createState() => _IsiFormState();
}

class _IsiFormState extends State<IsiForm> {
  String? controller;
  String? agendaOrganizer, agendaTime, agendaLocation, agendaDescription;

  getagendaOrganizer(organizer) {
    this.agendaOrganizer = organizer;
  }

  getagendaTime(time) {
    this.agendaTime = time;
  }

  getagendaLocation(locat) {
    this.agendaOrganizer = locat;
  }

  getagendaDescription(descrip) {
    this.agendaOrganizer = descrip;
  }

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

/*class BuatButton extends StatelessWidget {
  const BuatButton({Key? key}) : super(key: key);

  createData() {
    print('created');

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Agendas").doc();

    Map<String, dynamic>{
      "NamaAcara": _BuatAgendaState(agen);
    };
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        createData();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HalAgendaUser()));
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
*/
