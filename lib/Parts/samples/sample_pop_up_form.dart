import 'package:flutter/material.dart';

class SamplePopUpForm extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  const SamplePopUpForm({
    Key? key,
    required this.text,
    required this.background_color,
    required this.color,
    required this.font_size,
    required this.font_weight,
    required this.padding_vertical,
    required this.padding_horizontal,
    required this.border_radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background_color,
        borderRadius: border_radius,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: padding_horizontal,
        vertical: padding_vertical,
      ),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: font_size,
            fontWeight: font_weight,
          ),
        ),
        onPressed: () {
// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return Container(
//       height: 10.0,
//       width: 10.0,
//       color: Colors.white,
//     );
//   },
// );

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.lightGreenAccent,
                          ),
                        ),
                      ),
                      Form(
// key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                child: Text("제출"),
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('경고'),
                                        content: const SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text('한번 양식을 제출하면 개인이 수정할 수 없습니다.'),
                                              Text('제출한 데이터를 수정하려면 관리자에게 문의 하세요.'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('양식수정'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          TextButton(
                                            child: const Text('제출확정'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop(); // 부모 까지 닫을 때
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
// if (_formKey.currentState.validate()) {
//   _formKey.currentState.save();
// }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
