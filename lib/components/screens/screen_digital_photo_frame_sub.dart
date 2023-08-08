import 'package:flutter/material.dart';

import '../../utils/super_helper.dart';


class ScreenDigitalPhotoFrameSub extends StatefulWidget {
  String itemUrl;

  ScreenDigitalPhotoFrameSub({super.key, required this.itemUrl});

  @override
  State<ScreenDigitalPhotoFrameSub> createState() => _ScreenDigitalPhotoFrameSubState();
}

class _ScreenDigitalPhotoFrameSubState extends State<ScreenDigitalPhotoFrameSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*빈컨테이너*/
                // SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                /*사진컨테이너*/
                // Center(child: Image.asset(widget.itemUrl, fit: BoxFit.contain)),

                // /*사진컨테이너*/ Center(
                //   child: Container(
                //     // height:Image.asset(widget.itemUrl, fit: BoxFit.contain).height!*0.7,
                //     // width: Image.asset(widget.itemUrl, fit: BoxFit.contain).width!*0.7,
                //     height: 300,
                //     width: 200,
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: AssetImage(widget.itemUrl),
                //         fit: BoxFit.cover,
                //         // fit: BoxFit.contain,
                //         // fit: BoxFit.fitHeight,
                //         // fit: BoxFit.fill,
                //         // fit: BoxFit.none,
                //         // fit: BoxFit.scaleDown, //scaleDown 이 마음에 든다 //디지털 액자에도 이걸 적용하면 될것 같음
                //       ),
                //     ),
                //   ),
                // ),

                /*사진컨테이너*/
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(child: Image.asset(widget.itemUrl, fit: BoxFit.cover)),
                ),
              ],
            )),
      ),
    );
  }
}

class _SnackBarTestButton extends StatefulWidget {
  @override
  State<_SnackBarTestButton> createState() => _SnackBarTestButtonState();

  const _SnackBarTestButton();
}

class _SnackBarTestButtonState extends State<_SnackBarTestButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.hello));
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.occuredError));
          ScaffoldMessenger.of(context).showSnackBar(MySnackBars.mySnackBar(ment: MyMents.inLoading()));
        },
        child: const Text('스낵바'),
      ),
    );
  }
}
