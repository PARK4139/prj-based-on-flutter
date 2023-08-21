import 'package:flutter/material.dart';
import 'package:prj_app_mvp/utils/hardcoding_stamp_maker.dart';

import '../utils/super_helper.dart';

class FoldableStampsContainerMaker extends StatefulWidget {
  final GestureTapCallback? onTap;

  bool isVisiable;

  DateTime now;

  String title;

  List<dynamic> items;

  FoldableStampsContainerMaker({super.key, required this.onTap, required this.isVisiable, required this.now, required this.title, required this.items});

  @override
  State<FoldableStampsContainerMaker> createState() => _FoldableStampsContainerMakerState();
}

class _FoldableStampsContainerMakerState extends State<FoldableStampsContainerMaker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black38.withOpacity(0.5),
            // color: MyColors.black12,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
            // border:   Border(
            //   top: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            //   bottom: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            //   left: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            //   right: BorderSide(color: Colors.black.withOpacity(0.3), width: 3.0),
            // ),
          ),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Flexible(
                child: RichText(
                  selectionColor: Colors.blueAccent,
                  // overflow: TextOverflow.clip,//오버플로우 텍스트를 잘라내어 보이지 않도록 렌더링
                  overflow: TextOverflow.fade, //오버플로우 텍스트를 그라데이션효과로 사라지도록 렌더링
                  // overflow: TextOverflow.ellipsis,//오버플로우 텍스트를 ...으로 렌더링
                  // overflow: TextOverflow.visible,//오버플로우 텍스트를 보이도록 렌더링
                  maxLines: 2, //2 줄까지만 보이도록
                  // strutStyle: const StrutStyle(fontSize: 9.0),//이거 어디에 쓰이는지?..
                  text: TextSpan(text: widget.title, style: MyTextStyles.textStyle20230719),
                ),
              ),
              GestureDetector(onTap: widget.onTap, child: Icon(Icons.more_vert, color: MyColors.whiteWithOpacity60Percent)),
            ],
          ),
        ),
        if (widget.isVisiable == true)
          for (int i = 0; i < widget.items.length; i++) widget.items[i],
      ],
    );
  }
}
