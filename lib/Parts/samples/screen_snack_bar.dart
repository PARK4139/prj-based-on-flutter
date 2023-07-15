import 'package:flutter/material.dart';

class ScreenSnackBar extends StatefulWidget {
  const ScreenSnackBar({super.key});

  @override
  State<ScreenSnackBar> createState() => _ScreenSnackBarState();
}

class _ScreenSnackBarState extends State<ScreenSnackBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
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
          body: const Center(child: SnackBarTestButton()),
        ),
      ),
    );
  }
}


class SnackBarTestButton extends StatefulWidget {
  const SnackBarTestButton({super.key});

  @override
  State<SnackBarTestButton> createState() => _SnackBarTestButtonState();
}

class _SnackBarTestButtonState extends State<SnackBarTestButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          ScaffoldMessenger.of(context).showSnackBar(basicSnackBar());
          ScaffoldMessenger.of(context).showSnackBar(alertSnackBar());
          ScaffoldMessenger.of(context).showSnackBar(loadingSnackBar());
        },
        child: const Text('스낵바 테스트'),
      ),
    );
  }
}

final snackBar = SnackBar(
  duration: const Duration(seconds: 1),
  content: const Text('해당 기능은 아직 준비되지 않은 서비스입니다.다음에 만나요!'),
  action: SnackBarAction(
    label: '네',
    onPressed: () {
    },
  ),
);

SnackBar basicSnackBar() {
  return SnackBar(
    duration: const Duration(seconds: 1),
    content: const Text("안녕하세요! 반갑습니다!"),
    action: SnackBarAction(
      label: '네',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );
}

SnackBar alertSnackBar() {
  return SnackBar(
    backgroundColor: Colors.red[400],
    duration: const Duration(seconds: 1),
    content: const Text("에러가 발생했습니다"),
    action: SnackBarAction(
      label: '네',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );
}

SnackBar loadingSnackBar() {
  return SnackBar(
    duration: const Duration(seconds: 2),
    content: Row(
      children: [
        const Text("SnackBar 공부 중"),
        Expanded(child: Container(height: 0)),
        const CircularProgressIndicator(),
      ],
    ),
  );
}


Widget RefactoringModule202307152126(var context) {
  return InkWell(
    child: const Icon(Icons.chevron_left),
    onTap: () {
      Navigator.pop(context);
    },
  );
}