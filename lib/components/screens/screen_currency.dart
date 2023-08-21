import 'package:flutter/material.dart';

class ScreenCurrency extends StatefulWidget {
  const ScreenCurrency({Key? key}) : super(key: key);

  @override
  State<ScreenCurrency> createState() => _ScreenCurrencyState();
}

class _ScreenCurrencyState extends State<ScreenCurrency> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                const Row(
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
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF181818),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20, // width: 100
                ),
                  Container(
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
                                '6 428' ' ',
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.euro_rounded,
                            size: 100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child:  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
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
                            const SizedBox(
                              height: 5,
                              // width: 100,
                            ),
                            Row(
                              children: [
                                Text(
                                  '180,000' ' ',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Transform.scale(
                              scale: 5.2,
                              child: Transform.translate(
                                offset:const  Offset(-1.2, 4.2),
                                child: const Icon(Icons.account_circle_rounded),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset:const  Offset(0, -35),
                  child: Container(
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
                                  '180,000' ' ',
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
                        Column(
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
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset:const  Offset(0, -50),
                  child: const CardCurrency(
                    textCurrencyCategory: 'Won',
                    currencyUnit: 'KRW',
                    currencyNumber: '180,000',
                    currencyIconOrText: Text(
                      'KRW',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset:const  Offset(0, -60),
                  child: const CardCurrency(
                    textCurrencyCategory: 'Bitcoin',
                    currencyUnit: 'BTC',
                    currencyNumber: '9 785',
                    currencyIconOrText: Icon(
                      Icons.currency_bitcoin_outlined,
                      color: Colors.white54,
                    ),
                  ),
                ),
                Transform.translate(
                  offset:const  Offset(0, -75),
                  child: const CardCurrency(
                    textCurrencyCategory: 'Dollar',
                    currencyUnit: 'USD',
                    currencyNumber: '1313',
                    currencyIconOrText: Icon(Icons.attach_money_outlined),
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

class CardCurrency extends StatelessWidget {
  final String textCurrencyCategory;
  final String currencyUnit;
  final String currencyNumber;
  final Widget currencyIconOrText;

  const CardCurrency({super.key, required this.textCurrencyCategory, required this.currencyUnit, required this.currencyNumber, required this.currencyIconOrText});

  @override
  Widget build(BuildContext context) {
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
                textCurrencyCategory,
                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '$currencyNumber ',
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    currencyUnit,
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Transform.scale(
                scale: 6.2,
                child: Transform.translate(
                  offset: const Offset(-7.2, 4.2),
                  child: currencyIconOrText,
                ),
              ),
            ],
          ),
        ],
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
