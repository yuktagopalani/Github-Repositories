import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:githubclone/constants/asset_path.dart';
import 'package:githubclone/constants/colors.dart';
import 'package:githubclone/models/repo.dart';
import 'package:githubclone/screens/home.dart';
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
      home: EasySplashScreen(
        logo: Image.asset(GithubAssetPath.githubIcon, height: 80),
        title: const Text(
            "Git Clone",
            style: TextStyle(color: GithubColors.white, fontWeight: FontWeight.bold, fontSize: 24)
        ),
        backgroundColor: GithubColors.backgroundColor,
        loaderColor: GithubColors.white,
        showLoader: true,
        loadingText: const Text("Loading...", style: TextStyle(color: GithubColors.white, fontSize: 18, fontWeight: FontWeight.w500 )),
        navigator: const HomePagee(),
        durationInSeconds: 4,
      ),
      //getPages: AppRoutes.routes,
    );
  }
}