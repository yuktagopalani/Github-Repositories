import 'dart:convert';
import 'package:githubclone/models/repo.dart';
import 'package:githubclone/models/rrepo.dart';
import 'package:http/http.dart' as http;

Future<List<Rrepo>> getAllRepos (String user) async {
    List<Rrepo> result = [];
    try{
        var headers = {
            'authorization': 'Bearer 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'
        };
        String url = "https://api.github.com/users/" + user + "/repos?sort=updated&direction=desc&per_page=100";
        final response = await http.get(Uri.parse(url), headers: headers);

        print(response.statusCode);
        final repoList = jsonDecode(response.body);
        for(int i=0;i<repoList.length;i++){
            Rrepo repo = Rrepo.fromJson(repoList[i]);
            result.add(repo);
        }
    }
    catch(e){
        print(e);
    }
    return result;
}