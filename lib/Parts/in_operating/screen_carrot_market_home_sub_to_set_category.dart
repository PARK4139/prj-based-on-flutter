import 'package:flutter/material.dart';

import 'buttons_icon_with_text.dart';

class Screen_carrot_market_home_sub_to_set_category extends StatefulWidget {
  const Screen_carrot_market_home_sub_to_set_category({Key? key}) : super(key: key);

  @override
  State<Screen_carrot_market_home_sub_to_set_category> createState() => _Screen_carrot_market_home_sub_to_set_categoryState();
}

class _Screen_carrot_market_home_sub_to_set_categoryState extends State<Screen_carrot_market_home_sub_to_set_category> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('중고거래 카테고리', style: TextStyle(fontSize: 14, color: Colors.grey)),
        elevation: 1,
        foregroundColor: Colors.grey,
      ),
      body: GridView(
        children: <Widget>[
          // for (var IconTextButton in Buttons_icon_with_text) IconTextButton,
          Buttons_icon_with_text(
            icon: Icon(Icons.star_purple500_outlined, color: Colors.orange),
            text: Text('인기매물', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.laptop, color: Colors.grey),
            text: Text('디지털기기', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.orange),
            text: Text('생활가전', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('가구/인테리어', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('생활/주방', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('유아동', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('유아도서', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('여성의류', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('여성잡화', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('남성패션/잡화', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('뷰티/미용', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('스포츠/레저', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('취미/게임/음반', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('중고차', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('도서', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('티켓/교환권', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('가공식품', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('반려동물용품', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('식물', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('기타 중고물품', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('삽니다', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Buttons_icon_with_text(
            icon: Icon(Icons.question_mark, color: Colors.grey),
            text: Text('부동산', style: TextStyle(color: Colors.grey, fontSize: 10)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        // scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1.0,
        ),
      ),
    );
  }
}
