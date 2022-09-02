import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/screens/home.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:untitled/screens/mapScreen.dart';

import '../components/scheduleCard.dart';
import '../constant.dart';
import 'mapCard.dart';
class researchScreen extends StatefulWidget {

  @override
  State<researchScreen> createState() => _researchScreenState();
}

class _researchScreenState extends State<researchScreen> {
  List<String> listitems = ["Aucune", "Cabinet medical", "Cabinet dentaire", "Clinique", "Polyclinique"];
  String selectval = "Aucune";



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/medecin.jpg'),
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

                            //Bouton de validation
                            SizedBox(
                              height: 30.0,
                            ),
                            Text('Catégories',
                              style:TextStyle(fontSize: 20,
                                  color: kTitleTextColor,
                                  ) ,),

                            SizedBox(
                              height: 20.0,
                            ),
                            DecoratedBox(
                                decoration: BoxDecoration(
                                    color:Colors.blue[50], //background color of dropdown button
                                border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                                borderRadius: BorderRadius.circular(5), //border raiuds of dropdown button
                                boxShadow: <BoxShadow>[ //apply shadow on Dropdown button //blur radius of shadow
                                ]
                                ),
                              child: Padding(padding: EdgeInsets.only(left:30, right:30),
                              child: DropdownButton(

                                items: listitems.map((itemone){return DropdownMenuItem(
                                    value: itemone,
                                    child: Text(itemone)
                                );}).toList(),value: selectval,
                                onChanged: (value){
                                  setState(() {
                                    selectval = value.toString();
                                  });
                                },
                                underline: Container(), //empty line
                                style: TextStyle(fontSize: 18, color: kTitleTextColor),
                                dropdownColor: Colors.blue[50],
                                iconEnabledColor: kBlueColor,
                              ),
                            ),

                            ),


                            SizedBox(
                              height: 70.0,
                            ),
 ElevatedButton(
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(title: 'title')));
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




