import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';


final pages = [
    PageViewModel(
        pageColor: const Color(0xFFffc3a0),
        // iconImageAssetPath: 'assets/air-hostess.png',
        body: Text(
          'Haselfree  booking  of  flight  tickets  with  full  refund  on  cancelation',
        ),
        title: Text(
          'Flights',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),),
    PageViewModel(
      pageColor: const Color(0xFFC33764),

      body: Text(
        'We  work  for  the  comfort ,  enjoy  your  stay  at  our  beautiful  hotels',
      ),
      title: Text('Hotels'),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF1D2671),
      
      body: Text(
        'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
      ),
      title: Text('Cabs'),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];