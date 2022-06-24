import 'package:flutter/material.dart';

import '../price_model.dart';

const Color scaffoldColor = Color(0xffffffff);
const Color accentColor = Color(0xff4AADFB);
const Color textColor1 = Color(0xff010101);

TextStyle kTextStyle({Color? color, double size = 14, FontWeight fontWeight = FontWeight.w500, double? letterSpacing}) {
  return TextStyle(color: color ?? textColor1, fontSize: size, fontWeight: fontWeight, letterSpacing: letterSpacing);
}

List<PriceModel> listPrices = [
  PriceModel(name: 'Groceries', date: '5:20 PM', price: 678),
  PriceModel(name: 'Shopping', date: '6:25 PM', price: 892),
  PriceModel(name: 'Parking', date: '8:25 PM', price: 200),
];
