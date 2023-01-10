import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:githubclone/models/commits.dart';
Future<Commits> getLastCommit(user, repo) async{
    Commits lastCommit = Commits();
    try{
      var headers = {
        'authorization': 'Bearer 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'
      };
      String url = "https://api.github.com/repos/" + user + "/" + repo + "/commits";
      final response = await http.get(Uri.parse(url), headers: headers);
      // print('In the commit service');
      // print(response.statusCode);
      final commit_list = jsonDecode(response.body);
      lastCommit = Commits.fromJson(commit_list[0]);
      // print(lastCommit.commit?.message);
    }
    catch(e){
      print(e);
    }
    return lastCommit;
}





