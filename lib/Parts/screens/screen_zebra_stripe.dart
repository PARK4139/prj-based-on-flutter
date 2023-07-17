import 'package:flutter/material.dart';

class ScreenZebraStripe extends StatefulWidget {
  const ScreenZebraStripe({super.key});

  @override
  State<ScreenZebraStripe> createState() => _ScreenZebraStripeState();
}

class _ScreenZebraStripeState extends State<ScreenZebraStripe> {
  int zebraStripeCount=12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
        leading:  /*뒤로가기 버튼*/ InkWell(
          child: const Icon(Icons.chevron_left),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.9),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          color: Colors.black,
          // width: 50,
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          // child: Column(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
            // mainAxisSize: MainAxisSize.max, //아주 유용하다.적당히 맞출 필요가 없다
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i=0; i<zebraStripeCount; i++)
                if (i%2==0)
                  Container(height: 50, width: MediaQuery.of(context).size.width/zebraStripeCount, color: Colors.white)
                else
                  Container(height: 50, width: MediaQuery.of(context).size.width/zebraStripeCount, color: Colors.black)
               ],
          ),
        ),
      ),
    );
  }
}
