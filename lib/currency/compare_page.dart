import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lesson1/currency/currency_model.dart';
import 'package:lesson1/utils/constants.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({Key? key}) : super(key: key);

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  final TextEditingController _editingControllerTop = TextEditingController();
  final TextEditingController _editingControllerBottom = TextEditingController();
  final List<CurrencyModel> _listCurrency = [];
  CurrencyModel? topCur;
  CurrencyModel? bottomCur;

  @override
  void initState() {
    super.initState();
    _editingControllerTop.addListener(() {
      print(_editingControllerTop.text);
    });
    _editingControllerBottom.addListener(() {
      print(_editingControllerBottom.text);
    });
  }

  @override
  void dispose() {
    _editingControllerTop.dispose();
    _editingControllerBottom.dispose();
    super.dispose();
  }

  Future<bool?> _loadData() async {
    try {
      var response = await get(Uri.parse('https://cbu.uz/uz/arkhiv-kursov-valyut/json/'));
      if (response.statusCode == 200) {
        for (final item in jsonDecode(response.body)) {
          var model = CurrencyModel.fromJson(item);
          if (model.ccy == 'USD') {
            topCur = model;
          } else if (model.ccy == 'RUB') {
            bottomCur = model;
          }
          _listCurrency.add(model);
        }
        return true;
      } else {
        _showMessage('Unknown error');
      }
    } on SocketException {
      _showMessage('Connection error');
    } catch (e) {
      _showMessage(e.toString());
    }
    return null;
  }

  _showMessage(String text, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : Colors.green[400],
        content: Text(
          text,
          style: kTextStyle(size: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f2235),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Hello Javoh,\n',
                      style: kTextStyle(size: 16),
                      children: [
                        TextSpan(
                          text: 'Wellcome Back',
                          style: kTextStyle(size: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white12),
                      ),
                      child: const Icon(
                        Icons.more_vert,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              FutureBuilder(
                  future: _loadData(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(
                          color: const Color(0xff2d334d),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Exchange',
                                  style: kTextStyle(size: 16, fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 20,
                                  icon: const Icon(
                                    Icons.settings,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  children: [
                                    _itemExch(_editingControllerTop, topCur),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    _itemExch(_editingControllerBottom, bottomCur),
                                  ],
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff2d334d),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white12),
                                  ),
                                  child: const Icon(
                                    Icons.currency_exchange,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            'Error',
                            style: kTextStyle(size: 18),
                          ),
                        ),
                      );
                    } else {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  }))
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemExch(TextEditingController controller, CurrencyModel? model) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(border: Border.all(color: Colors.white12), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextField(
                  controller: controller,
                  style: kTextStyle(size: 24, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: '0.00',
                    hintStyle: kTextStyle(size: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color(0xff10a4d4)),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/img_${model?.ccy??'usd'}.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 10),
                      child: Text(
                        model?.ccy ?? 'UNK',
                        style: kTextStyle(size: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white54,
                      size: 15,
                    )
                  ]),
                ),
              )
            ],
          ),
          Text(
            '0.00',
            style: kTextStyle(fontWeight: FontWeight.w600, color: Colors.white54),
          )
        ],
      ),
    );
  }
}
