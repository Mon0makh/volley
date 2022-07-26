import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final Widget mysvg = SvgPicture.asset(
  "assets\\LOGO.svg",
  width: 80,
  height: 80,
);

List<OnHoverButton> _mainMenuElemensts(Map<String, Map<String, String>> val, dynamic context) {
  List<OnHoverButton> buttons = [];
  for (var item in val.entries) {
    buttons.add(
      OnHoverButton(item: item)
    );
  }
  return buttons;
}

Iterable<PopupMenuItem> _popupButtonsElement(Map<String, String> val, BuildContext context) sync* {
  for (var item in val.entries) {
    yield PopupMenuItem(
      value: item.key,
      child: MouseRegion(
        onExit: (event) => Navigator.pop(context),
        child: TextButton(
          onPressed: null,
          child: Text(
            item.key,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OnHoverButton extends StatefulWidget{
  late MapEntry<String, Map<String, String>> item;
  OnHoverButton({super.key, required this.item});

  @override
  State<OnHoverButton> createState() => OnHoverButtonState();
}

class OnHoverButtonState extends State<OnHoverButton>{
  final buttonKey = GlobalKey();
  @override
  Widget build(BuildContext context){
    return MouseRegion(
      key: buttonKey,
      onEnter: (event){
        showMenu(
          useRootNavigator: true,
          context: context, 
          position: RelativeRect.fromSize(buttonKey.globalPaintBounds!, Size.infinite),
          items: _popupButtonsElement(widget.item.value, context).toList(),
        );
      },
      child: Text(
        "${widget.item.key}  |  ",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  late Widget child;
  MyAppBar({
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      toolbarHeight: 100,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 20),
          mysvg,
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "ҚАЗАҚСТАНДЫҚ \nВОЛЕЙБОЛ \nФЕДЕРАЦИЯСЫ",
              style: TextStyle(
                color: Color(0xff17529d),
                fontSize: 18,
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
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(children: const [
                            Text(
                              "ҚАЗ /",
                              style: TextStyle(
                                color: Color.fromARGB(255, 93, 93, 93),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              " РУС ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 233, 155, 2),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "/ ENG",
                              style: TextStyle(
                                color: Color.fromARGB(255, 93, 93, 93),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ])),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Container(
                          width: 342,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color.fromARGB(255, 146, 146, 146),
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            style: const TextStyle(fontSize: 20),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Color.fromARGB(255, 146, 146, 146),
                                ),
                                hintText: " Поиск по сайту...",
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 146, 146, 146),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      children: _mainMenuElemensts({
                        "ФЕДЕРАЦИЯ": {
                          "Новости": "1",
                          "Матч-центр": "2",
                          "Руководство": "3",
                          "Арбитры": "4",
                          "Контакты": "5",
                          "Структура": "6",
                          "История": "7",
                          "Документы": "8",
                          "Отчет деятельности": "9",
                          "Государственные символы РК": "10"
                        },
                        "НОВОСТИ": {
                          "СМИ о волейболе": "1",
                          "Международные соревнования": "2",
                          "Национальная лига": "3",
                          "Высшая лига": "4",
                          "Высшая лига U-23": "5",
                          "Сборные": "6",
                          "Детский волейбол": "7",
                          "Федерация": "8"
                        },
                        "СБОРНЫЕ": {
                          "Мужская": "1",
                          "Женская": "2",
                          "Молодёжные": "3"
                        },
                        "КЛУБЫ": {
                          "Национальная лига": "1",
                          "Высшая лига": "2",
                          "Высшая лига U-23": "3"
                        },
                        "МЕДИА": {"Фотогалерея": "1", "Видеогаларея": "2"},
                        "ПРОЧЕЕ": {
                          "Календарь": "1",
                          "Пляжный волйбол": "2",
                          "Детский волейбол": "3",
                          "Партнеры": "4",
                          "WADA": "5",
                          "Сборные": "6",
                        }
                      }, context),
                    ),
                  ),
                ],
              ),
              child
            ]),
      ],
    );
  }
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}