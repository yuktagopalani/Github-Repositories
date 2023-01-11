import 'dart:convert';
import 'package:githubclone/models/repo.dart';
import 'package:githubclone/models/rrepo.dart';
import 'package:http/http.dart' as http;

Future<List<Rrepo>> getAllRepos (String user, int page) async {
    List<Rrepo> result = [];
    try{
        print('In service section');
        var headers = {
            'USERNAME': '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'
        };
        print(user);
        print(page);
        String url = "https://api.github.com/users/$user/repos?sort=updated&direction=desc&page=$page&per_page=15";
        // String url = "https://api.github.com/users/" + user + "/repos?sort=updated&direction=desc&per_page=100";
        print('before api call');
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