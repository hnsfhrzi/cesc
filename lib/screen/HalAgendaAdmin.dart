import 'package:cesc/screen/BuatAgenda.dart';
import 'package:flutter/material.dart';

//Jangan dipake dulu

class HalAgendaAdmin extends StatelessWidget {
  const HalAgendaAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Icon Back Button that direct to Calendar
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_back_ios,
            size: 29,
          ),
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
        //Giving AppBar gradient Color
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
            ],
          ),
        ),
      ),
    );
  }
}
