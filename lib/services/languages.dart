import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:githubclone/models/languages.dart';

Future<Languages> getAllLanguages(user, repo) async{
   Languages languages = Languages.ForNull();
   try{
     print('In language section');
     String url = "https://api.github.com/repos/" + user + "/" + repo + "/languages";
     final response = await http.get(Uri.parse(url));
     print(response.statusCode);
     languages = Languages.fromJson(jsonDecode(response.body));

     print(languages.languages);
   }
   catch(e){
      print(e);
   }
  return languages;
}