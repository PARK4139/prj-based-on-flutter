import 'package:flutter/material.dart';


class ScreenCarrotMarketHomeSubToSetCategory extends StatefulWidget {
  const ScreenCarrotMarketHomeSubToSetCategory({Key? key}) : super(key: key);

  @override
  State<ScreenCarrotMarketHomeSubToSetCategory> createState() => _ScreenCarrotMarketHomeSubToSetCategoryState();
}

class _ScreenCarrotMarketHomeSubToSetCategoryState extends State<ScreenCarrotMarketHomeSubToSetCategory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('중고거래 카테고리', style: TextStyle(fontSize: 14, color: Colors.grey)),
        elevation: 1,
        foregroundColor: Colors.grey,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1.0,
        ),
        children: <Widget>[
          // for (var IconTextButton in Buttons_icon_with_text) IconTextButton,
          ModuleIconWithText(
            icon: const Icon(Icons.star_purple500_outlined, color: Colors.orange),
            text: const Text('인기매물', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.laptop, color: Colors.grey),
            text: const Text('디지털기기', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.orange),
            text: const Text('생활가전', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('가구/인테리어', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('생활/주방', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('유아동', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('유아도서', style:

            TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('여성의류', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('여성잡화', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('남성패션/잡화', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('뷰티/미용', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('스포츠/레저', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('취미/게임/음반', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('중고차', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('도서', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('티켓/교환권', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('가공식품', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('반려동물용품', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('식물', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('기타 중고물품', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('삽니다', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ModuleIconWithText(
            icon: const Icon(Icons.question_mark, color: Colors.grey),
            text: const Text('부동산', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class ModuleIconWithText extends StatefulWidget {
  Icon icon;

  Text text;

  Function onPressed;

  ModuleIconWithText({super.key, required this.icon, required this.text, required this.onPressed});

  @override
  State<ModuleIconWithText> createState() => _ModuleIconWithTextState();
}

class _ModuleIconWithTextState extends State<ModuleIconWithText> {
  _ModuleIconWithTextState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: IconButton(
        onPressed: () {
          widget.onPressed();
        },
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            const SizedBox(height: 5),
            widget.text,
          ],
        ),
      ),
    );
  }
}
