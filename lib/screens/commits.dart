import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubclone/models/commits.dart';
import 'package:githubclone/services/commits.dart';

import '../constants/colors.dart';

class LastCommitPage extends StatelessWidget {
  final String user;
  final String repo;

  const LastCommitPage({required this.user, required this.repo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GithubColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: GithubColors.white)),
        backgroundColor: GithubColors.appbarColor,
        title: Text(
          'Last Commit: $repo',
          style: const TextStyle(color: GithubColors.white),
          textAlign: TextAlign.start,
          maxLines: 1,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getLastCommit(user, repo),
            builder: (BuildContext context,AsyncSnapshot<Commits> snapshot) {
              final data = snapshot.data;
              if(data== null){
                return const Center(
                  child: CircularProgressIndicator(
                    color: GithubColors.white,
                  ),
                );
              }
              // print("data is ");
              // print((data.commit?.owner));
              return Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(data.author?.avatarUrl ?? ''),
                            radius: 30,
                          ),
                          const
                          SizedBox(width: 20,),
                          Text(data.author?.login ?? '',
                              style: const TextStyle(color: GithubColors.offWhite,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Text(data.commit?.message ?? '',
                          style: const TextStyle(color: GithubColors.offWhite,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: GithubColors.offWhite,
                              width: 0.5),
                        ),
                        child: Text(data.sha?.substring(0,7) ?? '',
                          style:
                          const TextStyle(color: GithubColors.offWhite),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.access_time_outlined,
                            color: GithubColors.offWhite, size: 15,
                          ),
                          const SizedBox(width: 10,),
                          Text('last updated on ${data.commit?.owner?.date?.substring(0,10)}',
                            style:
                            const TextStyle(color: GithubColors.offWhite),
                          )

                        ],
                      ),
                      Row()
                    ],
                  )
              );
            },

          ),
        ),
      ),
    );
  }
}
