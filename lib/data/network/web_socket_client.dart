import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:alindor_assessment/app/utils/log_utils.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketClient {
  IOWebSocketChannel? channel;

  void connect(Function(String) onDataReceived, Function(bool) onErrorOccur) {
    if (channel != null && channel?.closeCode == null) {
      debugPrint("Already connected");
      return;
    }

    debugPrint("Connecting to the server...");
   final url =  Uri.parse("wss://api.deepgram.com/v1/listen?encoding=linear16&sample_rate=16000&language=en-GB");

    channel = IOWebSocketChannel.connect(
        url,
        headers: {
          "Authorization": "Token 7967640dbd81fbd386beb5cf95a0f8124f30d6f6"
        });
    debugPrint("Connected");
    channel?.stream.listen((event) {
      final parsedResponse = jsonDecode(event);
      print("----message----");
      print(parsedResponse);
      final message =
          parsedResponse['channel']['alternatives'][0]['transcript'];
      print(message);
     onDataReceived(message);
    }, onDone: () {
      debugPrint("Connection closed...");
    }, onError: (error) {
      onErrorOccur(true);
      debugPrint("Errror: $error");
    });
  }

  void send(dynamic message) {
    if (channel == null || channel?.closeCode != null) {
      debugPrint("Not connected");
      return;
    }
    channel?.sink.add(message);
  }

  void disconnect() {
    if (channel == null || channel?.closeCode != null) {
      debugPrint('Not connected');
      return;
    }
    channel?.sink.close();
  }
}
