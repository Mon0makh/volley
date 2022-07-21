import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'SignIn.dart' as signin;

final Widget mysvg = SvgPicture.asset(
  "assets\\LOGO.svg",
  width: 120,
);

void main() {
  runApp(const MaterialApp(home: MyWidget()));
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffe4e4e4),
          toolbarHeight: 130,
          actions: <Widget>[
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10), child: mysvg),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      "ҚАЗАҚСТАНДЫҚ \nВОЛЕЙБОЛ \nФЕДЕРАЦИЯСЫ",
                      style: TextStyle(
                        color: Color(0xff17529d),
                        fontSize: 20,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              "ҚАЗ / РУС / ENG",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Container(
                              width: 342,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xff5d5d5d),
                                  width: 2,
                                ),
                                color: const Color(0xffe4e4e4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Поиск по сайту...",
                                    style: TextStyle(
                                      color: Color(0xff5d5d5d),
                                      fontSize: 17,
                                      fontFamily: "Open Sans",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 27,
                                    height: 32,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xff5d5d5d),
                                          width: 2,
                                        ),
                                        color: const Color(0xffd9d9d9),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Text(
                          "ФЕДЕРАЦИЯ | НОВОСТИ | СБОРНЫЕ | КЛУБЫ | МЕДИА | ПРОЧЕЕ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: "Open Sans",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const signin.SignInPage())),
                        child: const Text(
                          "РЕГИСТРАЦИЯ\n КОМАНДЫ",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: "Open Sans",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Icon(Icons.account_box_outlined,
                        size: 120, color: Colors.white),
                  )
                ]),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: ListView(children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Image(
                image: AssetImage("assets\\front_header.png"),
                width: double.maxFinite,
              ),
            ),
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Image(
                    image: AssetImage("assets\\front.png"),
                    width: 800,
                    height: 600,
                  ),
                ),
                Container(
                  width: 335,
                  height: 614,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff5d5d5d),
                      width: 2,
                    ),
                    color: Colors.white,
                  ),
                  child: Column(children: const <Widget>[
                    Center(
                        child: Text(
                      "Последние Новости",
                      style: TextStyle(
                        color: Color(0xff17529d),
                        fontSize: 23,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                    Center(
                      child: Text(
                        "14/07/2022",
                        style: TextStyle(
                          color: Color(0xfff2a900),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Чемпионат мира-2022. \nЖенщины: Расписание матчей",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ]),
        ));
  }
}
