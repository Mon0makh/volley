import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'appbar.dart';

void main() {
  runApp(MaterialApp(
      title: "Казахстанская Федерация Волйбола",
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: const Main(logged: false)));
}

class Main extends StatelessWidget {
  final bool logged;

  const Main({Key? key, required this.logged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logged ? MyAppBar(
        child: Row(
          children: [
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
          ],
        )      
      )
    : MyAppBar(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 46),
              child: TextButton(
                onPressed: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SignInPage()
                  )
                )),
                child: Row(
                  children: const [
                    Text(
                      "Регистрация",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color.fromARGB(255, 172, 172, 172),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 20),
                      child: Icon(Icons.account_box_outlined,
                          size: 70,
                          color: Color.fromARGB(255, 199, 199, 199)
                      ),
                    ),
                  ]
                )
              )
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: ListView(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Image(
              image: AssetImage("assets/front_header.png"),
              width: double.maxFinite,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                height: 600,
                width: 845,
                padding: const EdgeInsets.only(right: 0),
                child: const Image(
                  image: AssetImage("assets/front.png"),
                ),
              ),
              Container(
                width: 335,
                height: 600,
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
      )
    );
  }
}
