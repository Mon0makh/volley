import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final Widget mysvg = SvgPicture.asset("assets\\LOGO.svg", width: 130, height: 130,);

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffe4e4e4),
        toolbarHeight: 142,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 10),
            mysvg,
            const Padding(
              padding: EdgeInsets.only(left: 30),
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
          ],
        ), 
        actions: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: ButtonBar(
                      children: <Widget>[
                        PopupMenuButton<String>(
                          child: const Text("ФЕДЕРАЦИЯ  |",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "Новости",
                              child: TextButton(
                                onPressed: (() => print("Новости")), 
                                child: const Text("Новости",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Матч-Центр",
                              child: TextButton(
                                onPressed: (() => print("Матч-Центр")), 
                                child: const Text("Матч-Центр",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Руководство",
                              child: TextButton(
                                onPressed: (() => print("Руководство")), 
                                child: const Text("Руководство",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Арбитры",
                              child: TextButton(
                                onPressed: (() => print("Арбитры")), 
                                child: const Text("Арбитры",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Контакты",
                              child: TextButton(
                                onPressed: (() => print("Контакты")), 
                                child: const Text("Контакты",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Структура",
                              child: TextButton(
                                onPressed: (() => print("Структура")), 
                                child: const Text("Структура",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "История",
                              child: TextButton(
                                onPressed: (() => print("История")), 
                                child: const Text("История",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Документы",
                              child: TextButton(
                                onPressed: (() => print("Документы")), 
                                child: const Text("Документы",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Отчет деятельности",
                              child: TextButton(
                                onPressed: (() => print("Отчет деятельности")), 
                                child: const Text("Отчет деятельности",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Государственные символы РК",
                              child: TextButton(
                                onPressed: (() => print("Государственные символы РК")), 
                                child: const Text("Государственные символы РК",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        PopupMenuButton<String>(
                          child: const Text("НОВОСТИ  |",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "СМИ о волейболе",
                              child: TextButton(
                                onPressed: (() => print("СМИ о волейболе")), 
                                child: const Text("СМИ о волейболе",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Международные соревнования",
                              child: TextButton(
                                onPressed: (() => print("Международные соревнования")), 
                                child: const Text("Международные соревнования",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Национальная Лига",
                              child: TextButton(
                                onPressed: (() => print("Национальная Лига")), 
                                child: const Text("Национальная Лига",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Высшая Лига",
                              child: TextButton(
                                onPressed: (() => print("Высшая Лига")), 
                                child: const Text("Высшая Лига",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Высшая Лига U-23",
                              child: TextButton(
                                onPressed: (() => print("Высшая Лига U-23")), 
                                child: const Text("Высшая Лига U-23",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Сборные",
                              child: TextButton(
                                onPressed: (() => print("Сборные")), 
                                child: const Text("Сборные",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Детский волейбол",
                              child: TextButton(
                                onPressed: (() => print("Детский волейбол")), 
                                child: const Text("Детский волейбол",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Федерация",
                              child: TextButton(
                                onPressed: (() => print("Фередация")), 
                                child: const Text("Федерация",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        PopupMenuButton<String>(
                          child: const Text("СБОРНЫЕ  |",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "Мужская",
                              child: TextButton(
                                onPressed: (() => print("Мужская")), 
                                child: const Text("Мужская",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Женская",
                              child: TextButton(
                                onPressed: (() => print("Женская")), 
                                child: const Text("Женская",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Молодежные",
                              child: TextButton(
                                onPressed: (() => print("Молодежные")), 
                                child: const Text("Молодежные",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        PopupMenuButton<String>(
                          child: const Text("КЛУБЫ  |",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "Национальная Лига",
                              child: TextButton(
                                onPressed: (() => print("Национальная Лига")), 
                                child: const Text("Национальная Лига",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Высшая Лига",
                              child: TextButton(
                                onPressed: (() => print("Высшая Лига")), 
                                child: const Text("Высшая Лига",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Высшая Лига U-23",
                              child: TextButton(
                                onPressed: (() => print("Высшая Лига U-23")), 
                                child: const Text("Высшая Лига U-23",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        PopupMenuButton<String>(
                          child: const Text("МЕДИА  |",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "Фотогалерея",
                              child: TextButton(
                                onPressed: (() => print("Фотогалерея")), 
                                child: const Text("Фотогалерея",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Видеогалерея",
                              child: TextButton(
                                onPressed: (() => print("Видеогалерея")), 
                                child: const Text("Видеогалерея",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        PopupMenuButton<String>(
                          child: const Text("ПРОЧЕЕ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "Календарь",
                              child: TextButton(
                                onPressed: (() => print("Молодежные")), 
                                child: const Text("Календарь",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Пляжный волейбол",
                              child: TextButton(
                                onPressed: (() => print("Молодежные")), 
                                child: const Text("Пляжный волейбол",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Детский волейбол",
                              child: TextButton(
                                onPressed: (() => print("Молодежные")), 
                                child: const Text("Детский волейбол",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Партнеры",
                              child: TextButton(
                                onPressed: (() => print("Молодежные")), 
                                child: const Text("Партнеры",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "WADA",
                              child: TextButton(
                                onPressed: (() => print("Молодежные")), 
                                child: const Text("WADA",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Сборные",
                              child: TextButton(
                                onPressed: (() => print("Молодежные")), 
                                child: const Text("Сборные",
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ]
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]
          ),
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