import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:githubclone/models/repo.dart';
import 'package:githubclone/screens/home.dart';
import 'package:githubclone/services/commits.dart';
import 'package:githubclone/services/repos.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // List<Repo> repoList = await getAllRepos('rox999');
  // for(int i = 0; i< repoList.length; i++)
  // {
  //   print(repoList[i].language);
  // }
  await getLastCommit('yuktagopalani', 'Kitaab');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'gitclone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      //initialRoute: RoutesName.onBoardScreen,
      home: const HomePage(),
      //getPages: AppRoutes.routes,
    );
  }
}