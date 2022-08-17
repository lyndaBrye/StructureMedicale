import 'package:flutter/material.dart';

import '../constant.dart';
import 'doctorCard.dart';
import 'navDrawer.dart';

class clinicaList extends StatefulWidget {
  const clinicaList({Key? key}) : super(key: key);

  @override
  State<clinicaList> createState() => _clinicaListState();
}

class _clinicaListState extends State<clinicaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
          title: Text(''),
        ),drawer: NavDrawer(),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Cliniques',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTitleTextColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildDoctorList(),
              ],
            ),
          ),
        ),

      ),
    );

  }
  buildDoctorList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          DoctorCard(
            'Clinique du pont\nde Gaulle',
            ' Soins medicaux ',
            'assets/images/hospital1.png',
            kBlueColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'Clinique NovaCardio',
            'Specialise en cardiologie',
            'assets/images/hospital2.png',
            kYellowColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'Clinique Hotel Dieu',
            'Specialise en soins dentaires',
            'assets/images/hospital3.png',
            kOrangeColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

}
