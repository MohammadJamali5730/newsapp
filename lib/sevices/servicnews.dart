import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/models/modelnews.dart';

class Servicnews {
  List<Modelnews>Articles =[];
  Future<List<Modelnews>> getapi() async {
    String  Api_Key = '261409d2b21b4a47acba2bf6d5d3cb7f';
    Client client = Client();
    final result = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2024-09-07&sortBy=publishedAt&apiKey=$Api_Key'));

        if(result.statusCode == 200 )
        {
          Map<String,dynamic>responsjson = jsonDecode(result.body);
          List <dynamic> section = responsjson['articles'];
          List<Modelnews> mylist = section.map((e) {
            return Modelnews.fromMap(e);
          },).toList();
          Articles.addAll(mylist);
          return Articles;
        }else{
          return[];
        }
  }
}
