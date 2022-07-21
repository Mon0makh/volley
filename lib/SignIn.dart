import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Icon(Icons.abc, size: 120, color: Colors.white),
                ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "ALTAY CLUB",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: "Open Sans",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Личный кабинет",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: "Open Sans",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
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
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: 50, left: 50, top: 100),
                width: 450,
                height: 650,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff5d5d5d),
                    width: 2,
                  ),
                  color: Colors.white,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Center(
                            widthFactor: 1,
                            child: Text(
                              "Вход в Volley.kz",
                              style: TextStyle(
                                color: Color.fromARGB(255, 49, 62, 83),
                                fontSize: 30,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Center(
                          widthFactor: 1,
                          child: Text(
                            "Войдите на сайт для управления командой",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(255, 124, 132, 151),
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Center(
                            child: SizedBox(
                          height: 50,
                        )),
                        Center(
                          widthFactor: 1,
                          child: Text(
                            "Email",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Image(
                  image: AssetImage("assets\\SignIn.png"),
                  width: 600,
                  height: 800,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
