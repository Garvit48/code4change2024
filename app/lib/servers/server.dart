import 'dart:io';
import 'dart:convert';
void main() async {

  List<String> arr = ["Hello World", "How are you doing", "I am doing good", "Nice"];
  int index = 0;
  var server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  print(InternetAddress.anyIPv4);
  await server.forEach((HttpRequest req) async {
    switch (req.uri.path) {
      case "/chat":
        String content = await utf8.decoder.bind(req).join();
        var data = jsonDecode(content) as Map<String, dynamic>;
        print(data);
        req.response.write(arr[index]);
        req.response.close();
        index++;
      default:
        req.response.write("Wrong");
        req.response.close();
    }
  });
}