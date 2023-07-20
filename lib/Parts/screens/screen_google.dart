import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../helpers/super_worker.dart';

class ScreenGoogoole extends StatefulWidget {


  // const ScreenGoogoole({
  //   super.key,
  // })

//  위의 constructor 와 뭐가 다른거지?  key 는 뭐지?, 부모에게 꼭 줘야 하나?
  const ScreenGoogoole({
    Key? key,
  }) : super(key: key);

  // ScreenGoogoole({
  //   Key? key,
  // }) : super(key: key){
  //   print("wiget constructor");
  // }




  @override
  State<ScreenGoogoole> createState() => _ScreenGoogooleState();
}

class _ScreenGoogooleState extends State<ScreenGoogoole> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: const SafeArea(
        child: WebViewExample(),
      ),
    );
  }
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController webViewController = WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            printWithoutErrorOrPrintWithError('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            printWithoutErrorOrPrintWithError('Page started loading: $url');
          },
          onPageFinished: (String url) {
            printWithoutErrorOrPrintWithError('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            printWithoutErrorOrPrintWithError('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              printWithoutErrorOrPrintWithError('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            printWithoutErrorOrPrintWithError('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            printWithoutErrorOrPrintWithError('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.message)));
        },
      )
      ..loadRequest(Uri.parse(indexUrl));

    // #docregion platform_features
    if (webViewController.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (webViewController.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = webViewController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(''),
        actions: <Widget>[
          NavigationControlBar(webViewController: _controller),
        ],
      ),
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}

enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
  doPostRequest,
  loadLocalFile,
  loadFlutterAsset,
  loadHtmlString,
  transparentBackground,
  setCookie,
}

class NavigationControlBar extends StatelessWidget {
  const NavigationControlBar({super.key, required this.webViewController});

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          /*뒤로가기 버튼*/ InkWell(
            child: const Icon(Icons.chevron_left, size: 20),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back, size: 30),
            onPressed: () async {
              if (await webViewController.canGoBack()) {
                await webViewController.goBack();
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('back history item 이 없습니다.')));
                }
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward, size: 30),
            onPressed: () async {
              if (await webViewController.canGoForward()) {
                await webViewController.goForward();
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('forward history item 이 없습니다.')));
                }
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.replay, size: 20),
            onPressed: () {
              webViewController.reload();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('새로고침 되었습니다')));
            },
          ),
          /*도움말버튼*/ InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 1000), content: Text('해당 기능은 아직 준비되지 않은 서비스입니다.\n다음에 만나요!')));
            },
            child: const Icon(Icons.question_mark, size: 20),
          )
        ],
      ),
    );
  }
}

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';

const String kLocalExamplePage = '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>

<h1>Local demo page</h1>
<p>
  This is an example page used to demonstrate how to load a local file or HTML
  string using the <a href="https://pub.dev/packages/webview_flutter">Flutter
  webview</a> plugin.
</p>

</body>
</html>
''';

const String kTransparentBackgroundPage = '''
  <!DOCTYPE html>
  <html>
  <head>
    <title>Transparent background test</title>
  </head>
  <style type="text/css">
    body { background: transparent; margin: 0; padding: 0; }
    #container { position: relative; margin: 0; padding: 0; width: 100vw; height: 100vh; }
    #shape { background: red; width: 200px; height: 200px; margin: 0; padding: 0; position: absolute; top: calc(50% - 100px); left: calc(50% - 100px); }
    p { text-align: center; }
  </style>
  <body>
    <div id="container">
      <p>Transparent background test</p>
      <div id="shape"></div>
    </div>
  </body>
  </html>
''';

// String indexUrl='https://flutter.dev';
// String indexUrl='https://github.com/PARK4139';
// String indexUrl='https://www.naver.com';
// String indexUrl='https://www.google.com/webhp?hl=en&sa=X&ved=0ahUKEwiguL3Zy5CAAxVKGYgKHWOFDb0QPAgJ';
String indexUrl = 'https://www.google.com';
// String indexUrl='https://www.youtube.com/';

String naverUrl = 'https://www.naver.com';
String startingUrl = 'https://www.naver.com';
String openingUrl = 'https://www.naver.com';
