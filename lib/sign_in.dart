import 'package:flutter/material.dart';
import 'main.dart';
import 'appbar.dart';
import 'package:http/http.dart' as http;

bool zapomnit = false;

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  int i = 0;
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
            height: 20,
          ),
          selector(),
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

  Widget selector() {
    if (i == 0) {
      debugPrint("first ${i.toString()}");
      return Row(
        children: [
          sign(
            "Вход в Volley.kz",
            "Войдите на сайт для управления командой",
            null,
            ["Email", "Пароль"],
            Column(
              children: [
                Row(
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
                            debugPrint(zapomnit.toString());
                          }
                        ),
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
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
                    ),
                    onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Main(logged: true)
                      )
                    )),
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
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                    ),
                    onPressed: (() {
                      debugPrint("second ${i.toString()}");
                      setState(() {
                        i = 1;
                      });
                      debugPrint("third ${i.toString()}");
                    }),
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
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                    ),
                    onPressed: () {
                      setState(() {
                        i = 3;
                      });
                      debugPrint(i.toString());
                    },
                    child: const Text(
                      "Войти в систему VIS",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ),
              ],
            )
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
    if (i == 1) {
      debugPrint(i.toString());
      debugPrint("return step 1");
      return Row(
        children: [
          sign(
            "Регистрация в Volley.kz",
            "Регистрация команды",
            "Шаг 1/2",
            ["Email", "Название команды", "Регион", "ФИО Тренера"],
            Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
                    ),
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
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                    ),
                    onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Main(logged: false)
                      )
                    )),
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
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const Text(
                                  "Оставьте нам свои контакты, и мы поможем",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Ваше имя:",
                                        style: TextStyle(
                                          fontSize: 38,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: 10),
                                        hintText: "Олег"
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Ваш номер телефона:",
                                        style: TextStyle(
                                          fontSize: 38,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: 10),
                                        hintText: "+7 777 777 7777"
                                      ),
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
                                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                                          onPressed: null,
                                          child: const Text(
                                            "Позвоните мне!",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          )
                                        )
                                      )
                                    ),
                                  ],
                                ),
                              ]
                            ),
                          );
                        }
                      )
                    ),
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
            )
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
    if (i == 2) {
      debugPrint(i.toString());
      debugPrint("return step 2");
      return Row(
        children: [
          sign(
            "Регистрация в Volley.kz",
            "Регистрация команды",
            "Шаг 2/2",
            ["Тип", "Пароль", "Повторите пароль"],
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
              ],
            )
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
    if (i == 3) {
      debugPrint(i.toString());
      debugPrint("return VIS");
      return Row(
        children: [
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
          sign(
            "                 Вход в VIS",
            null,
            null,
            ["Login", "Пароль"],
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                      "Войти",
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
              ],
            )
          ),
        ],
      );
    }
    return const SizedBox(height: 800, width: 800, child: Text("404"));
  }

  Widget sign(String header, String? header2, String? header3, List<String> textForms, Widget buttons) {
    return Container(
      padding: const EdgeInsets.only(right: 50, left: 50, top: 20),
      width: 450,
      height: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            widthFactor: 1,
            child: Text(
              header,
              style: const TextStyle(
                color: Color.fromARGB(255, 49, 62, 83),
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            )),
          (header2 != null) ? Center(
            widthFactor: 1,
            child: Text(
              header2,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Color.fromARGB(255, 124, 132, 151),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ) : const SizedBox(height: 20,),
          const SizedBox(height: 10,),
          (header3 != null) ? Align(
            alignment: Alignment.centerRight,
            child: Text(
              header3,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ) : const SizedBox(height: 50,),
          const SizedBox(height: 50,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: textForms.length,
            itemBuilder: (BuildContext context, int index){
              return Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textForms[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
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
                        color: Colors.white
                      ),
                      child: TextFormField(
                        obscureText: (textForms[index] == "Пароль"),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            }
          ),
          const SizedBox(height: 50,),
          buttons,
        ],
      )
    );
  }
}