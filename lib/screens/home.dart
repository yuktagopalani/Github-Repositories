import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubclone/constants/color_map.dart';
import 'package:githubclone/constants/colors.dart';
import 'package:githubclone/models/repo.dart';
import 'package:githubclone/models/rrepo.dart';
import 'package:githubclone/services/repos.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getAllRepos('yuktagopalani'),
            builder:
                (BuildContext context, AsyncSnapshot<List<Rrepo>> snapshot) {
              final data = snapshot.data;
              if (data == null) {
                return const Center(
                    child: CircularProgressIndicator(color: GithubColors.dart));
              }
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
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
                        Text.rich(
                          TextSpan(
                            text: data[index].name ?? '',
                            style: const TextStyle(
                                color: GithubColors.heading,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                baseline: TextBaseline.ideographic,
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: GithubColors.offWhite,
                                        width: 0.5),
                                  ),
                                  child: Text(
                                    data[index].private == true
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
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: colorMap[data[index].language] ?? GithubColors.offWhite,
                            ),
                            const SizedBox(width: 4),
                            Text(data[index].language ?? '',
                                style: const TextStyle(
                                    color: GithubColors.offWhite, fontSize: 12)),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
