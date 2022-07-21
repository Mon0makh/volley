import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final Widget mysvg = SvgPicture.asset("assets\\LOGO.svg", width: 142, height: 142,);

enum FederationDropDown{itemOne, itemTwo}
enum NewsDropDown{itemOne, itemTwo}
enum TeamsDropDown{itemOne, itemTwo}
enum ClubsDropDown{itemOne, itemTwo}
enum MediaDropDown{itemOne, itemTwo}
enum OthersDropDown{itemOne, itemTwo}

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
          toolbarHeight: 142,
          title: Row(children: [
            const SizedBox(width: 10),
            mysvg,
          const Padding(
                    padding: EdgeInsets.only(left: 32),
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
          ],), 
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: ButtonBar(
                          children: <Widget>[
                            PopupMenuButton<FederationDropDown>(
                              child: const Text("ФЕДЕРАЦИЯ  |",
                              style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),
                              ),
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<FederationDropDown>>[
                                PopupMenuItem<FederationDropDown>(
                                  value: FederationDropDown.itemOne,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemOne)), 
                                    child: const Text('Item 1',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                  ),
                                PopupMenuItem<FederationDropDown>(
                                  value: FederationDropDown.itemTwo,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemTwo)), 
                                    child: const Text('Item 2',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                              ],
                            ),
                            PopupMenuButton<NewsDropDown>(
                              child: const Text("НОВОСТИ  |",
                              style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),
                              ),
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<NewsDropDown>>[
                                PopupMenuItem<NewsDropDown>(
                                  value: NewsDropDown.itemOne,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemOne)), 
                                    child: const Text('Item 1',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                                PopupMenuItem<NewsDropDown>(
                                  value: NewsDropDown.itemTwo,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemTwo)), 
                                    child: const Text('Item 2',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                              ],
                            ),
                            PopupMenuButton<TeamsDropDown>(
                              child: const Text("СБОРНЫЕ  |",
                              style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),
                              ),
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<TeamsDropDown>>[
                                PopupMenuItem<TeamsDropDown>(
                                  value: TeamsDropDown.itemOne,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemOne)), 
                                    child: const Text('Item 2',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                                PopupMenuItem<TeamsDropDown>(
                                  value: TeamsDropDown.itemTwo,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemTwo)), 
                                    child: const Text('Item 2',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                              ],
                            ),
                            PopupMenuButton<ClubsDropDown>(
                              child: const Text("КЛУБЫ  |",
                              style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),
                              ),
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<ClubsDropDown>>[
                                PopupMenuItem<ClubsDropDown>(
                                  value: ClubsDropDown.itemOne,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemOne)), 
                                    child: const Text('Item 1',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                                PopupMenuItem<ClubsDropDown>(
                                  value: ClubsDropDown.itemTwo,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemTwo)), 
                                    child: const Text('Item 2',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                              ],
                            ),
                            PopupMenuButton<MediaDropDown>(
                              child: const Text("МЕДИА  |",
                              style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),
                              ),
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<MediaDropDown>>[
                                PopupMenuItem<MediaDropDown>(
                                  value: MediaDropDown.itemOne,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemOne)), 
                                    child: const Text('Item 1',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                                PopupMenuItem<MediaDropDown>(
                                  value: MediaDropDown.itemTwo,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemTwo)), 
                                    child: const Text('Item 2',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                              ],
                            ),
                            PopupMenuButton<OthersDropDown>(
                              child: const Text("ПРОЧЕЕ",
                              style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),
                              ),
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<OthersDropDown>>[
                                PopupMenuItem<OthersDropDown>(
                                  value: OthersDropDown.itemOne,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemOne)), 
                                    child: const Text('Item 1',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                                PopupMenuItem<OthersDropDown>(
                                  value: OthersDropDown.itemTwo,
                                  child: TextButton(
                                    onPressed: (() => print(FederationDropDown.itemTwo)), 
                                    child: const Text('Item 2',
                                  style: TextStyle(
                                color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                              ),),),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      "РЕГИСТРАЦИЯ\n КОМАНДЫ",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                      ),
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
