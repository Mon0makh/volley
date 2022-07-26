import 'package:flutter/material.dart';
import 'main.dart';
import 'appbar.dart';
import 'package:http/http.dart' as http;

bool zapomnit = false;
int i = 0;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  bool isLoading = false;
  String myerror = "";
  String str = "";
  setLoading(bool state) =>
      setState(() => {isLoading = state, i = 3, myerror = str});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
          child: const SizedBox(
        width: 350,
      )),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          selector(i),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  httpPostMain() async {
    try {
      str = "";
      setLoading(true);
      await httpPost();
    } finally {
      setLoading(false);
    }
  }

  httpPost() async {
    debugPrint('go https!');
    try {
      var response = await http.post(
          Uri(
              scheme: 'https',
              host: 'www.fivb.org',
              path: '/vis/CheckLogin.aspx'),
          body: {
            'U': textController1!.text,
            'P': textController2!.text
          },
          headers: {
            'Accept': 'application/xml',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Allow-Methods': '*',
            'Access-Control-Allow-Credentials': 'true',
          });

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");
      if (response.statusCode == 500) {
        str = "Возникла ошибка в сервере, попробуйте позже!";
      } else {
        int first = response.body.indexOf("<Error>");
        int second = response.body.indexOf("</Error>");
        str = response.body.substring(first + 7, second);
      }
    } catch (error) {
      // ignore: avoid_print
      debugPrint('ERROR $error');
      str = '$error';
    }
  }

  Widget selector(int i) {
    if (i == 0) {
      return sign(signin());
    }
    if (i == 1) {
      return sign(signUpOne());
    }
    if (i == 2) {
      return sign(signUptwo());
    }
    if (i == 3) {
      return sign(vis());
    }
    return const SizedBox(height: 800, width: 800, child: Text("404"));
  }

  Widget sign(Widget box) {
    i = 0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: ListView(shrinkWrap: true, children: [
        box,
      ]),
    );
  }

  Widget signin() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 50, left: 50, top: 100),
          width: 450,
          height: 800,
          child: SizedBox(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
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
                  const Center(
                    widthFactor: 1,
                    child: Text(
                      "Войдите на сайт для управления командой",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 124, 132, 151),
                        fontSize: 16,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Center(
                      child: SizedBox(
                    height: 50,
                  )),
                  const Center(
                    widthFactor: 1,
                    child: Text(
                      "Email",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    widthFactor: 1,
                    child: Container(
                      width: 342,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xff5d5d5d),
                            width: 1,
                          ),
                          color: Colors.white),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 10),
                            hintText: "myteam.trainer@volley.kz"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    widthFactor: 1,
                    child: Text(
                      "Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Center(
                    widthFactor: 1,
                    child: Container(
                      width: 342,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xff5d5d5d),
                            width: 1,
                          ),
                          color: Colors.white),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 10),
                            hintText: "**********"),
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    widthFactor: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: zapomnit,
                                onChanged: (bool? value) {
                                  setState(() {
                                    zapomnit = value!;
                                  });
                                }),
                            const Text(
                              "Запомнить",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const TextButton(
                          onPressed: null,
                          child: Text(
                            "Забыли пароль?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                      onPressed: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Main(logged: true)))),
                      child: const Text(
                        "Войти",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: (() => setState(() {
                            i = 1;
                          })),
                      child: const Text(
                        "Зарегистрировать команду",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        onPressed: () => setState(() {
                          i = 3;
                        }),
                        child: const Text(
                          "Войти в систему VIS",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: AssetImage("assets/SignIn.png"),
              width: 575,
              height: 800,
            ),
          ),
        ),
      ],
    );
  }

  Widget signUpOne() {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(right: 50, left: 50, top: 100),
          width: 450,
          height: 800,
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                    widthFactor: 1,
                    child: Text(
                      "Регистрация в Volley.kz",
                      style: TextStyle(
                        color: Color.fromARGB(255, 49, 62, 83),
                        fontSize: 30,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                const Center(
                  widthFactor: 1,
                  child: Text(
                    "Регистрация команды",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 124, 132, 151),
                      fontSize: 16,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Шаг 1/2",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  widthFactor: 1,
                  child: Text(
                    "Email",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  widthFactor: 1,
                  child: Container(
                    width: 342,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xff5d5d5d),
                          width: 1,
                        ),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "myteam.trainer@volley.kz"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  widthFactor: 1,
                  child: Text(
                    "Название команды",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  widthFactor: 1,
                  child: Container(
                    width: 342,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xff5d5d5d),
                          width: 1,
                        ),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "My Team"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Center(
                  widthFactor: 1,
                  child: Text(
                    "Регион",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  widthFactor: 1,
                  child: Container(
                    width: 342,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xff5d5d5d),
                          width: 1,
                        ),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Алматы"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Center(
                  widthFactor: 1,
                  child: Text(
                    "ФИО Тренера",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  widthFactor: 1,
                  child: Container(
                    width: 342,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xff5d5d5d),
                          width: 1,
                        ),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Василий Васильков Васильевич"),
                    ),
                  ),
                ),
                const Center(
                    child: SizedBox(
                  height: 5,
                )),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue)),
                    onPressed: (() => setState(() {
                          i = 2;
                        })),
                    child: const Text(
                      "Далее >",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Main(logged: false)))),
                    child: const Text(
                      "Отмена",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: (() => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Возникли проблемы с регистрацией?",
                                    style: TextStyle(
                                        fontFamily: "Ubuntu",
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Оставьте нам свои контакты, и мы поможем",
                                    style: TextStyle(
                                        fontFamily: "Ubuntu",
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Ваше имя:",
                                          style: TextStyle(
                                              fontFamily: "Ubuntu",
                                              fontSize: 38,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(left: 10),
                                            hintText: "Олег"),
                                      ),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Ваш номер телефона:",
                                          style: TextStyle(
                                              fontFamily: "Ubuntu",
                                              fontSize: 38,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(left: 10),
                                            hintText: "+7 777 777 7777"),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                          height: 50,
                                          width: double.maxFinite,
                                          child: Center(
                                              heightFactor: 1,
                                              widthFactor: 1,
                                              child: OutlinedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.blue)),
                                                  onPressed: null,
                                                  child: const Text(
                                                    "Позвоните мне!",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ))))
                                    ],
                                  ),
                                ]),
                          );
                        })),
                    child: const Text(
                      "Проблемы при регистрации?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: AssetImage("assets/SignIn.png"),
              width: 575,
              height: 800,
            ),
          ),
        ),
      ],
    );
  }

  Widget signUptwo() {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(right: 50, left: 50, top: 100),
          width: 450,
          height: 800,
          child: SizedBox(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                      widthFactor: 1,
                      child: Text(
                        "Регистрация в Volley.kz",
                        style: TextStyle(
                          color: Color.fromARGB(255, 49, 62, 83),
                          fontSize: 30,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  const Center(
                    widthFactor: 1,
                    child: Text(
                      "Регистрация команды",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 124, 132, 151),
                        fontFamily: "Ubuntu",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Шаг 2/2",
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    widthFactor: 1,
                    child: Text(
                      "Тип",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Ubuntu",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Center(
                    widthFactor: 1,
                    child: Container(
                      width: 342,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xff5d5d5d),
                            width: 1,
                          ),
                          color: Colors.white),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Школьная"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    widthFactor: 1,
                    child: Text(
                      "Пароль",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Ubuntu",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Center(
                    widthFactor: 1,
                    child: Container(
                      width: 342,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xff5d5d5d),
                            width: 1,
                          ),
                          color: Colors.white),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Пароль"),
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Center(
                    widthFactor: 1,
                    child: Text(
                      "Повторите пароль",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Center(
                    widthFactor: 1,
                    child: Container(
                      width: 342,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xff5d5d5d),
                            width: 1,
                          ),
                          color: Colors.white),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Пароль"),
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                      onPressed: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const Main(
                                    logged: true,
                                  )))),
                      child: const Text(
                        "Зарегистрироваться",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Main(logged: false))),
                      child: const Text(
                        "Отмена",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: AssetImage("assets/SignIn.png"),
              width: 575,
              height: 800,
            ),
          ),
        ),
      ],
    );
  }

  Widget vis() {
    return Row(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: const Image(
            image: AssetImage("assets/Devki.png"),
            width: 575,
            height: 800,
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Container(
        padding: const EdgeInsets.only(right: 50, left: 50, top: 100),
        width: 450,
        height: 800,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                  widthFactor: 1,
                  child: Text(
                    "Вход в VIS",
                    style: TextStyle(
                      color: Color.fromARGB(255, 49, 62, 83),
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              const SizedBox(
                height: 60,
              ),
              const Center(
                widthFactor: 1,
                child: Text(
                  "Login",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Center(
                widthFactor: 1,
                child: Container(
                  width: 342,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xff5d5d5d),
                        width: 1,
                      ),
                      color: Colors.white),
                  child: TextFormField(
                    controller: textController1,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                      hintText: "visLogin123",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                widthFactor: 1,
                child: Text(
                  "Пароль",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Center(
                widthFactor: 1,
                child: Container(
                  width: 342,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xff5d5d5d),
                        width: 1,
                      ),
                      color: Colors.white),
                  child: TextFormField(
                    controller: textController2,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                        hintText: "Пароль"),
                    obscureText: true,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Text(
                  myerror,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: isLoading ? null : httpPostMain,
                  child: const Text(
                    "Войти",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Main(logged: false)))),
                  child: const Text(
                    "Отмена",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
