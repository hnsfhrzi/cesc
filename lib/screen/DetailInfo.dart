import 'package:cesc/screen/HalamanInfo.dart';
import 'package:flutter/material.dart';

//AMAN

class DetailInfo extends StatelessWidget {
  const DetailInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => InfoPage()));
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
              onTap: () {},
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'PENDAFTARAN SPS 124',
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
                        image: AssetImage('assets/images/poster/sps.jpg'),
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
                          'Acara Himpunan',
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
                          '23-25 September 2021',
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
                          'Halo Calon Wisudawan!! \n\nSemoga Sehat selalu dimanapun kalian berada! \nAda kabar baik nih. Tentu bukan kulit manggis kini ada ekstraknya ya!\n\nYak benar! Pendaftaran SPS 124 sudah dibuka!\n\nPendaftaran dilakukan dengan mengisi link berikut :\nintip(.)in/PendaftaranSPS124\n\nPendaftaran dibuka sampai tanggal 25 September 2021\nSo, jangan lupa untuk daftar!\n\nDepartemen Dalam Negeri\nHIMATEKKOM ITS Prakarsa 2021/2022\n\n#PendaftaranSPS124\n#DAGRI\n#PRAKARSA\n#HIMATEKKOMITS\n#ITSSURABAYA',
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
                              'kurniaji14(Aji)',
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
        ),
      ),
    );
  }
}
