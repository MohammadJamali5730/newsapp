import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/models/modelnews.dart';

class Servicnews {
  List<Modelnews>Articles =[];
  Future<List<Modelnews>> getapi() async {
    String  Api_Key = '12cdadafc7508dd5e50a50e083e5fdae';
    Client client = Client();
    final result = await client.get(Uri.parse(
        'http://api.mediastack.com/v1/news?access_key=$Api_Key'));

        if(result.statusCode == 200 )
        {
          Map<String,dynamic>responsjson = jsonDecode(result.body);
          List <dynamic> section = responsjson['data'];
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
