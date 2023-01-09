import 'dart:convert';
import 'package:githubclone/models/repo.dart';
import 'package:http/http.dart' as http;

Future<List<Repo>> getAllRepos (String user) async {
    List<Repo> result = [];

    try{
        String url = "https://api.github.com/users/" + user + "repos";
        final response = await http.get(Uri.parse(url));
        List<dynamic> repoList = jsonDecode(response.body);
        for(int i=0;i<repoList.length;i++){
            // Repo repo = Repo.fromJson(data)
        }
    }
    catch(e){

    }

    return result;
}