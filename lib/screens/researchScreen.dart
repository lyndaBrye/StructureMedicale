import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/screens/home.dart';
import 'package:untitled/screens/mapScreen.dart';

import '../components/scheduleCard.dart';
import '../constant.dart';
class researchScreen extends StatefulWidget {

  @override
  State<researchScreen> createState() => _researchScreenState();
}

class _researchScreenState extends State<researchScreen> {
  String dropdownvalue = 'cardiologie';

  var items = [
    'cardiologie',
    'odonto stomatologie',
    'dermatologie',
    'ophtalmologie',
    'Kynesie Therapie',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/detail_illustration.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        height: 18,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/3dots.svg',
                      height: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('RECHERCHEZ-VOUS UNE STRUCTURE\nMEDICALE PROCHE DE  VOUS ?',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: kTitleTextColor,
                          ),),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),  Form(
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.location_on),
                                labelText: 'Point de repere',
                                labelStyle: TextStyle(
                                  color: kTitleTextColor,
                                ),
                              ),
                            ),
                            //Bouton de validation
                            SizedBox(
                              height: 30.0,
                            ), TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.medical_services_outlined),
                                labelText: 'Catégories',
                                labelStyle: TextStyle(
                                  color: kTitleTextColor,
                                ),
                              ),
                            ),
                            //Bouton de validation
                            SizedBox(
                              height: 30.0,
                            )

                           , ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kBlueColor,
                                shape: StadiumBorder(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 100,
                                  vertical: 10,
                                ),
                              ),
                              child: Text(
                                'Rechercher',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapScreen()));
                              },
                            ),
                          ],
                        )
                        ,
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),


    );


  }
}




