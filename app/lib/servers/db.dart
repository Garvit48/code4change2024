import "package:mongo_dart/mongo_dart.dart" as mongo;
import "dart:io";
import "dart:convert";
void main() async {
  var db = await mongo.Db.create("mongodb+srv://root:1234567890@test.ao2hqux.mongodb.net/code4change");
  await db.open();
  HttpServer server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  print("Database Server is up...");
  await server.forEach((HttpRequest req) async {
    switch (req.uri.path) {
      case "/content":
        // String rawData = await utf8.decoder.bind(req).join();
        // var dbQueryParams = await jsonDecode(rawData) as Map<String, dynamic>;
        mongo.DbCollection collection = db.collection("content");
        List collData = await collection.find().toList();
        req.response.write(jsonEncode(collData));
        

      default:
        print("No response for this request");
      
      
    }
    req.response.close();
  });
}