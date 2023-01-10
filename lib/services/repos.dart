import 'dart:convert';
import 'package:githubclone/models/repo.dart';
import 'package:githubclone/models/rrepo.dart';
import 'package:http/http.dart' as http;

Future<List<Rrepo>> getAllRepos (String user) async {
    List<Rrepo> result = [];
    try{
        String url = "https://api.github.com/users/" + user + "/repos?sort=updated&direction=desc&per_page=100";
        final response = await http.get(Uri.parse(url));
        print(response.statusCode);
        // print(jsonDecode(response.body)[0]);
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