import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:githubclone/models/commits.dart';
Future<Commits> getLastCommit(user, repo) async{
    Commits lastCommit = Commits();
    try{
      String url = "https://api.github.com/repos/" + user + "/" + repo + "/commits";
      final response = await http.get(Uri.parse(url));
      print('In the commit service');
      print(response.statusCode);
      final commit_list = jsonDecode(response.body);
      lastCommit = Commits.fromJson(commit_list[0]);
      print(lastCommit.commit?.message);
    }
    catch(e){
      print(e);
    }
    return lastCommit;
}





