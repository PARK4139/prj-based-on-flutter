import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ScreenWebSocketClient extends StatefulWidget {

  // 웹소켓 채널을 생성
  final WebSocketChannel channel = IOWebSocketChannel.connect('ws://echo.websocket.org'); // 웹 서버에 접속 시도

  ScreenWebSocketClient({ super.key});

  @override
  _ScreenWebSocketClientState createState() => _ScreenWebSocketClientState();
}

class _ScreenWebSocketClientState extends State<ScreenWebSocketClient> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                // 상태 변화가 일어나는 필드
                controller: _controller,
                decoration: const InputDecoration(labelText: '웹소켓서버에 보낼 데이터 입력'),
              ),
            ),
            StreamBuilder(
              // 채널의 스트림을 stream 항목에 설정.
              stream: widget.channel.stream,
              // 채널 stream에 변화가 발생하면 빌더 호출
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  // 수신 데이터가 존재할 경우 해당 데이터를 텍스트로 출력
                  child: Text(snapshot.hasData ? '웹소켓서버서 받은 데이터: ${snapshot.data}' : ''),
                );
              },
            )
          ],
        ),
      ),
      // 플로팅 버튼이 눌리면 _sendMessage 함수 호출
      floatingActionButton: FloatingActionButton(onPressed: _sendMessage, tooltip: 'Send message', child: Icon(Icons.send)),
    );
  }

  // 플로팅 버튼이 눌리면 호출
  void _sendMessage() {
    // TextFormField에 입력된 텍스트가 존재하면
    if (_controller.text.isNotEmpty) {
      // 해당 텍스트를 서버로 전송.
      widget.channel.sink.add(_controller.text);
    }
  }

  // 상태 클래스가 종료될 때 호출
  @override
  void dispose() {
    // 채널을 닫음
    widget.channel.sink.close();
    super.dispose();
  }
}
