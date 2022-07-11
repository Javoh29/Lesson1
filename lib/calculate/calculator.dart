import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var icMoonPath = 'assets/images/ic_moon.png';
  var icSunPath = 'assets/images/ic_sun.png';
  var icSelectedPath = 'assets/images/ic_selected.png';
  var first = 'assets/images/ic_selected.png';
  var second = 'assets/images/ic_moon.png';
  Color pageBackground = const Color(0xff1E1E1E);
  Color defaultButtonColor = const Color(0xff2E2F38);
  Color defaultButtonTextColor = Colors.white;
  Color defaultInputTextColor = Colors.white;
  Color defaultThemeBgColor = const Color(0xff2E2F38);
  Color defaultTopButtonColor = const Color(0xff4E505F);


  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    '÷',
    '7',
    '8',
    '9',
    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '.',
    '0',
    '<=',
    '=',
  ];

  themeChanger() {
    if (first == 'assets/images/ic_selected.png') {
      second = 'assets/images/ic_selected.png';
      first = icSunPath;
      pageBackground = const Color(0xffF1F2F3);
      defaultButtonColor = Colors.white;
      defaultButtonTextColor = Colors.black;
      defaultInputTextColor = Colors.black;
      defaultThemeBgColor = Colors.white;
      defaultTopButtonColor = const Color(0xffD2D3DA);
    } else {
      first = 'assets/images/ic_selected.png';
      second = icMoonPath;
      pageBackground = const Color(0xff1E1E1E);
      defaultButtonColor = const Color(0xff2E2F38);
      defaultButtonTextColor = Colors.white;
      defaultInputTextColor = Colors.white;
      defaultThemeBgColor = const Color(0xff2E2F38);
      defaultTopButtonColor = const Color(0xff4E505F);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final isPlatformDark =
    //     WidgetsBinding.instance!.window.platformBrightness == Brightness.dark;
    // final initTheme = isPlatformDark ? darkTheme : lightTheme;
    return Scaffold(
      backgroundColor: pageBackground,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => themeChanger(),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  width: 72,
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: defaultThemeBgColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(first),
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Image(
                          image: AssetImage(second),
                          width: 24,
                          height: 24,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 750,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      height: 80,
                      child: const Text(
                        '6,291÷5',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.topRight,
                      height: 120,
                      child: Text(
                        '1,258.2',
                        style: TextStyle(
                          fontSize: 96,
                          fontWeight: FontWeight.w300,
                          color: defaultInputTextColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 550,
                      child: GridView.builder(
                          itemCount: buttons.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            if (index < 3) {
                              return _button(buttons[index],
                                  defaultTopButtonColor, defaultButtonTextColor);
                            } else if (index == 3 ||
                                index == 7 ||
                                index == 11 ||
                                index == 15 ||
                                index == 19) {
                              return _button(buttons[index],
                                  const Color(0xff4B5EFC), Colors.white);
                            }
                            //  other buttons
                            else {
                              return _button(buttons[index], defaultButtonColor,
                                  defaultButtonTextColor);
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(String buttonText, Color color, Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 72,
          height: 72,
          color: color,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
