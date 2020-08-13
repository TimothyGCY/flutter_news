import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const apiKey = "a35debb2a4104c729fdeba2b0fa15414";

const newsCategory = ["viral", "covid", "msia", "global"];
var covidNews, viralNews, msiaNews, globNews;

var activeTab = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
);

var inactiveTab = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14,
    color: Colors.grey[400],
  ),
);

var titleTxt = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
);

var newsTitle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
);

var contentTxt = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14,
    color: Colors.black,
  ),
);

