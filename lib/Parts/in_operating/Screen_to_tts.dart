import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Screen_tts extends StatefulWidget {
  const Screen_tts({Key? key}) : super(key: key);

  @override
  State<Screen_tts> createState() => _Screen_ttsState();
}

class _Screen_ttsState extends State<Screen_tts> {
  final ment = '해당 스크린에서는 TTS 기능을 제공해주는 서비스를 제공합니다 \n\n'
      '＊"" :.';
  FlutterTts flutterTts = FlutterTts();

  TextEditingController textEditingController = TextEditingController();

  convert_to_voice(String text) async {
    List<dynamic> languages = await flutterTts.getLanguages;
    // print(languages);//DEVELOPMENT
    var language;
    // language = "en-US";
    // language = "ja-JP";
    language = "ko-KR";
    await flutterTts.setLanguage(language);
    await flutterTts.isLanguageAvailable(language);
    await flutterTts.setSpeechRate(1.5);
    await flutterTts.setPitch(1.9);
    await flutterTts.setVolume(1.0);
    if (text.contains('!')) {
      await flutterTts.setSpeechRate(0.75);
      String result = text.replaceAll("!", " 느낌표 ");
      String result_ = "";
      for (int i = 0; i < result.length; i++) {
        result_ = result_ + result[i] + "  ";
      }
      await flutterTts.speak(result_.trim());
    } else {
      await flutterTts.speak(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            ElevatedButton(
              child: Text('go to index'.toUpperCase()),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              child: Column(
                children: <Widget>[
                  const Icon(Icons.android, color: Colors.lightBlueAccent),
                  Text(
                    "$ment",
                    style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Column(
                children: [
                  TextFormField(
                    controller: textEditingController,
                    cursorColor: Colors.blueAccent,
                    style: TextStyle(color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: '여기에 한국어를 입력하세요',
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      hintText: 'ex ) 테스트',
                      hintStyle: TextStyle(color: Colors.blueAccent),
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      fillColor: Colors.blueAccent,
                      focusColor: Colors.blueAccent,
                      hoverColor: Colors.blueAccent,
                      iconColor: Colors.blueAccent,
                      prefixIconColor: Colors.blueAccent,
                      suffixIconColor: Colors.blueAccent,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '입력되지 않았네요.다시 작성해주세요.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print("onChanged: ${value}");
                    },
                    onFieldSubmitted: (value) {},
                  ),
                  TextButton(
                    onPressed: () => convert_to_voice(textEditingController.text),
                    child: Text('Convert To Voice', style: TextStyle(color: Colors.lightBlueAccent)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
