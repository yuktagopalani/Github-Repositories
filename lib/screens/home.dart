import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubclone/constants/asset_path.dart';
import 'package:githubclone/constants/color_map.dart';
import 'package:githubclone/constants/colors.dart';
import 'package:githubclone/models/repo.dart';
import 'package:githubclone/models/rrepo.dart';
import 'package:githubclone/screens/commits.dart';
import 'package:githubclone/services/repos.dart';

class HomePagee extends StatefulWidget {
  const HomePagee({Key? key}) : super(key: key);

  @override
  State<HomePagee> createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  List<Rrepo> repoList = [];
  int page=1;
  bool isLoading = false;
  late ScrollController _scrollController;
  getRepos() async{
      print('In this func');
      setState(() {
        isLoading = true;
      });
      List<Rrepo> response = await getAllRepos('yuktagopalani', page);
      for(int i=0;i<response.length;i++){
        repoList.add(response[i]);
      }
      setState(() {
        isLoading = false;
        page++;
      });
  }
  @override
  void initState(){
    super.initState();
    getRepos();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.95 && !isLoading){
        getRepos();
      }
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
    Widget iconData(String value, String iconPath){
    return Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(
          vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            color: GithubColors.offWhite,
            width: 0.5),
      ),
      child: Row(
        children: [
          Image.asset(iconPath, height: 16, color: GithubColors.offWhite,),
          const SizedBox(width: 10,),
          Text(
            value,
            style:
            const TextStyle(color: GithubColors.offWhite, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GithubColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: GithubColors.appbarColor,
        title: const Center(
            child: Text(
              'yuktagopalani - Github Repositories',
              style: TextStyle(color: GithubColors.white),
              textAlign: TextAlign.center,
            )),
      ),
      body: SafeArea(
        child: ListView.builder(
            controller: _scrollController,
            itemCount: repoList.length,
            itemBuilder: (context, index){
              if(index==repoList.length){
                return const SizedBox(width: 60,height: 60,
                child: FittedBox(child: CircularProgressIndicator(color: GithubColors.offWhite,),),);
              }
              return Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      color: GithubColors.offWhite,
                      height: 1,
                      thickness: 0.2,
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: (){
                        Get.to(LastCommitPage(user: 'yuktagopalani', repo: repoList[index].name ?? ''));
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            // WidgetSpan(
                            //   alignment: PlaceholderAlignment.middle,
                            //   baseline: TextBaseline.ideographic,
                            // child: Container(
                            //     padding: const EdgeInsets.only(right: 6),
                            //     child: Image.asset(GithubAssetPath.repoIcon, height: 22, color: GithubColors.offWhite,)),
                            // ),
                            TextSpan(
                              text: repoList[index].name ?? '',
                              style: const TextStyle(
                                  color: GithubColors.heading,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              baseline: TextBaseline.ideographic,
                              child: Container(
                                margin:
                                const EdgeInsets.only(left: 6),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: GithubColors.offWhite,
                                      width: 0.5),
                                ),
                                child: Text(
                                  repoList[index].private == true
                                      ? 'Private'
                                      : 'Public',
                                  style:
                                  const TextStyle(color: GithubColors.offWhite),
                                ),
                              ),
                            ),
                            // const TextSpan(text: 'consectetur'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: colorMap[repoList[index].language] ?? GithubColors.offWhite,
                        ),
                        const SizedBox(width: 4),
                        Text(repoList[index].language ?? '',
                            style: const TextStyle(
                                color: GithubColors.offWhite, fontSize: 12)),
                        const SizedBox(width: 10),
                        Text('last updated on ${repoList[index].updatedAt?.substring(0,10)}', style: const TextStyle(color: GithubColors.offWhite),)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        iconData(repoList[index].forks.toString(), GithubAssetPath.forkIcon),
                        iconData(repoList[index].stargazersCount.toString(), GithubAssetPath.starIcon),
                        iconData(repoList[index].watchers.toString(), GithubAssetPath.watchIcon),
                      ],
                    )
                  ],
                ),
              );
        })
      )
    );
  }
}




















// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//
//   Widget iconData(String value, String iconPath){
//     return Container(
//       margin:
//       const EdgeInsets.symmetric(horizontal: 4),
//       padding: const EdgeInsets.symmetric(
//           vertical: 4, horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(
//             color: GithubColors.offWhite,
//             width: 0.5),
//       ),
//       child: Row(
//         children: [
//           Image.asset(iconPath, height: 16, color: GithubColors.offWhite,),
//           const SizedBox(width: 10,),
//           Text(
//             value,
//             style:
//             const TextStyle(color: GithubColors.offWhite, fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: GithubColors.backgroundColor,
//       appBar: AppBar(
//
//         backgroundColor: GithubColors.appbarColor,
//         title: const Center(
//             child: Text(
//               'yuktagopalani - Github Repositories',
//               style: TextStyle(color: GithubColors.white),
//               textAlign: TextAlign.center,
//             )),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: FutureBuilder(
//             future: getAllRepos('yuktagopalani'),
//             builder:
//                 (BuildContext context, AsyncSnapshot<List<Rrepo>> snapshot) {
//               final data = snapshot.data;
//               if (data == null) {
//                 return const Center(
//                     child: CircularProgressIndicator(color: GithubColors.white));
//               }
//               return ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     width: Get.width,
//                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Divider(
//                           color: GithubColors.offWhite,
//                           height: 1,
//                           thickness: 0.2,
//                         ),
//                         const SizedBox(height: 10),
//                         InkWell(
//                           onTap: (){
//                             Get.to(LastCommitPage(user: 'yuktagopalani', repo: data[index].name ?? ''));
//                           },
//                           child: Text.rich(
//                             TextSpan(
//                               children: [
//                                 // WidgetSpan(
//                                 //   alignment: PlaceholderAlignment.middle,
//                                 //   baseline: TextBaseline.ideographic,
//                                   // child: Container(
//                                   //     padding: const EdgeInsets.only(right: 6),
//                                   //     child: Image.asset(GithubAssetPath.repoIcon, height: 22, color: GithubColors.offWhite,)),
//                                 // ),
//                                 TextSpan(
//                                   text: data[index].name ?? '',
//                                   style: const TextStyle(
//                                       color: GithubColors.heading,
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 WidgetSpan(
//                                   alignment: PlaceholderAlignment.middle,
//                                   baseline: TextBaseline.ideographic,
//                                   child: Container(
//                                     margin:
//                                     const EdgeInsets.only(left: 6),
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 2, horizontal: 4),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(12),
//                                       border: Border.all(
//                                           color: GithubColors.offWhite,
//                                           width: 0.5),
//                                     ),
//                                     child: Text(
//                                       data[index].private == true
//                                           ? 'Private'
//                                           : 'Public',
//                                       style:
//                                       const TextStyle(color: GithubColors.offWhite),
//                                     ),
//                                   ),
//                                 ),
//                                 // const TextSpan(text: 'consectetur'),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 5,
//                               backgroundColor: colorMap[data[index].language] ?? GithubColors.offWhite,
//                             ),
//                             const SizedBox(width: 4),
//                             Text(data[index].language ?? '',
//                                 style: const TextStyle(
//                                     color: GithubColors.offWhite, fontSize: 12)),
//                             const SizedBox(width: 10),
//                             Text('last updated on ${data[index].updatedAt?.substring(0,10)}', style: const TextStyle(color: GithubColors.offWhite),)
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             iconData(data[index].forks.toString(), GithubAssetPath.forkIcon),
//                             iconData(data[index].stargazersCount.toString(), GithubAssetPath.starIcon),
//                             iconData(data[index].watchers.toString(), GithubAssetPath.watchIcon),
//                           ],
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
