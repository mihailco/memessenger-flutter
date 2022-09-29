import 'package:statrco/features/data/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:web_socket_channel/io.dart';

abstract class MyWs {
  void connect();
}

class MyWsImpl implements MyWs {
  // ignore: non_constant_identifier_names
  final String jwt;
  MyWsImpl(this.jwt);
  late IOWebSocketChannel channel;
  
  @override
  void connect() async {
     channel = IOWebSocketChannel.connect(Uri.parse(Urls.ws),
        headers: {'Authorization': 'Bearer $jwt'});
  }

  void t() {
    channel.sink.add("hello world");
    channel.stream.listen((event) {
      print("get $event");
    });
  }
}
