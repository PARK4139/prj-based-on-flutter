import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:clipboard/clipboard.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;

class CustomCard_v2 extends StatelessWidget {
  const CustomCard_v2({Key? key}) : super(key: key);

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
              const SizedBox(
                height: 5,
                // width: 100,
              ),
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

class CustomCard_v3 extends StatelessWidget {
  const CustomCard_v3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class CustomCard_v4 extends StatelessWidget {
  const CustomCard_v4({Key? key}) : super(key: key);

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
              const SizedBox(
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

class CurrencyCard extends StatelessWidget {
  final String text_currency_category;
  final String currency_unit;
  final String currency_number;
  final Widget currency_icon_or_text;

  const CurrencyCard({super.key, required this.text_currency_category, required this.currency_unit, required this.currency_number, required Widget this.currency_icon_or_text});

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
              const SizedBox(
                height: 5,
                // width: 100,
              ),
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