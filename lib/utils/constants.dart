import 'package:flutter/material.dart';

import '../wallet_ui/price_model.dart';


TextStyle kTextStyle({Color? color, double size = 14, FontWeight fontWeight = FontWeight.w500, double? letterSpacing, double? height}) {
  return TextStyle(color: color ?? Colors.white, fontSize: size, fontWeight: fontWeight, letterSpacing: letterSpacing, height: height);
}

List<PriceModel> listPrices = [
  PriceModel(name: 'Groceries', date: '5:20 PM', price: 678),
  PriceModel(name: 'Shopping', date: '6:25 PM', price: 892),
  PriceModel(name: 'Parking', date: '8:25 PM', price: 200),
];
