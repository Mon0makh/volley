import 'package:flutter/material.dart';

class LogInVisWidget extends StatefulWidget {
  const LogInVisWidget({Key? key}) : super(key: key);

  @override
  _LogInVisWidgetState createState() => _LogInVisWidgetState();
}

class _LogInVisWidgetState extends State<LogInVisWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
        child: AppBar(
          backgroundColor: const Color(0xFFE4E4E4),
          automaticallyImplyLeading: false,
          flexibleSpace: const Align(
            alignment: AlignmentDirectional(-0.85, 0),
            child: Text(
              'ҚАЗАҚСТАНДЫҚ \nВОЛЕЙБОЛ \nФЕДЕРАЦИЯСЫ',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: Color(0xFF17529D),
                fontSize: 20,
              ),
            ),
          ),
          actions: [],
          elevation: 2,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(mainAxisSize: MainAxisSize.max, children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 40, 0, 0),
                  child: Image(
                    image: const AssetImage('assets\\Devki.png'),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.8,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(200, 0, 50, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: SizedBox(
                      width: double.infinity,
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              'Вход в VIS',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 40,
                              ),
                            ),
                            const Divider(
                              height: 3,
                              thickness: 3,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: TextFormField(
                                  controller: textController1,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Login',
                                    hintText: 'Введите логин',
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 40,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: TextFormField(
                                  controller: textController2,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Пароль',
                                    hintText: 'Введите пароль',
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 40,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 24,
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 50, 0, 10),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.deepPurpleAccent,
                                    primary: Colors.white,
                                    minimumSize: const Size(300, 40),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Войти'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0),
                                child: TextButton(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  style: TextButton.styleFrom(
                                    side: const BorderSide(
                                        color: Colors.black, width: 1),
                                    primary: Colors.black,
                                    minimumSize: const Size(300, 40),
                                  ),
                                  child: const Text('Отмена'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
