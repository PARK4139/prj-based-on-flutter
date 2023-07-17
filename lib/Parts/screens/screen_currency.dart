import 'package:flutter/material.dart';

class Screen_currency extends StatefulWidget {
  const Screen_currency({Key? key}) : super(key: key);

  @override
  State<Screen_currency> createState() => _Screen_currencyState();
}

class _Screen_currencyState extends State<Screen_currency> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
// width: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Selena',
                          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
// width: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Balance', style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20, fontWeight: FontWeight.w500)),
                        const Text(
                          '\$5 194 482',
                          style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20, // width: 100
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: 'Transfer',
                      color: Colors.black,
                      bgcolor: Colors.amber,
                    ),
                    Button(
                      text: 'Request',
                      color: Colors.white,
                      bgcolor: Colors.black12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50, // width: 100
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Color(0xFF181818),
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Button_v3(
                      text: 'View All',
                      color: Colors.white.withOpacity(0.6),
                      bgcolor: const Color(0xFF181818),
                      font_size: 18,
                      fontWeight: FontWeight.w500,
                      padding_horizontal: 0,
                      padding_vertical: 0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20, // width: 100
                ),
                Card_v2(),
                Transform.translate(
                  offset: Offset(0, -20),
                  child: Card_v3(),
                ),
                Transform.translate(
                  offset: Offset(0, -35),
                  child: Card_v4(),
                ),
                Transform.translate(
                  offset: Offset(0, -50),
                  child: const Card_currency(
                    text_currency_category: 'Won',
                    currency_unit: 'KRW',
                    currency_number: '180,000',
                    currency_icon_or_text: Text(
                      'KRW',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -60),
                  child: const Card_currency(
                    text_currency_category: 'Bitcoin',
                    currency_unit: 'BTC',
                    currency_number: '9 785',
                    currency_icon_or_text: Icon(
                      Icons.currency_bitcoin_outlined,
                      color: Colors.white54,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -75),
                  child: const Card_currency(
                    text_currency_category: 'Dollar',
                    currency_unit: 'USD',
                    currency_number: '1313',
                    currency_icon_or_text: Icon(Icons.attach_money_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card_currency extends StatelessWidget {
  final String text_currency_category;
  final String currency_unit;
  final String currency_number;
  final Widget currency_icon_or_text;

  const Card_currency({super.key, required this.text_currency_category, required this.currency_unit, required this.currency_number, required Widget this.currency_icon_or_text});

  @override
  Widget build(BuildContext context) {
    var IconOrText;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text_currency_category,
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    currency_number + ' ',
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    currency_unit,
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 6.2,
                  child: Transform.translate(
                    offset: const Offset(-7.2, 4.2),
                    child: currency_icon_or_text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Card_v4 extends StatelessWidget {
  const Card_v4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent.shade200,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Won',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '180,000' + ' ',
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'KRW',
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 5.2,
                  child: Transform.translate(
                    offset: const Offset(-7.2, 7.2),
                    child: const Text(
                      'KRW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Card_v3 extends StatelessWidget {
  const Card_v3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Won',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
                // width: 100,
              ),
              Row(
                children: [
                  Text(
                    '180,000' + ' ',
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'KRW',
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 5.2,
                  child: Transform.translate(
                    offset: Offset(-1.2, 4.2),
                    child: Icon(Icons.account_circle_rounded),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
    );
  }
}

class Card_v2 extends StatelessWidget {
  const Card_v2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Euro',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '6 428' + ' ',
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'EUR',
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.euro_rounded,
                  size: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Button_v3 extends StatelessWidget {
  final String text;
  final Color bgcolor;
  final Color? color;
  final double? font_size;
  final FontWeight? fontWeight;
  final double padding_vertical;
  final double padding_horizontal;

  const Button_v3({
    Key? key,
    required this.text,
    required this.bgcolor,
    required this.color,
    required this.font_size,
    required this.fontWeight,
    required this.padding_vertical,
    required this.padding_horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(45),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: padding_horizontal,
        vertical: padding_vertical,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: font_size,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Color bgcolor;
  final Color color;

  const Button({
    Key? key,
    required this.text,
    required this.bgcolor,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(45),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 15,
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
