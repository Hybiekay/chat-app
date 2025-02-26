import 'package:dating_app/core/constants/images_const.dart';
import 'package:dating_app/core/theme/custom_colors.dart';
import 'package:dating_app/core/theme/custom_textstyle.dart';
import 'package:dating_app/model/user_model.dart';
import 'package:dating_app/provider/current_user_provider.dart';
import 'package:dating_app/view/view_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    UserModel? userModel = context.watch<CurrentUserProvider>().userModel;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              height: MediaQuery.sizeOf(context).height * 0.28,
              width: double.infinity,
              decoration: BoxDecoration(color: CustomColors.black),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Settings",
                  style: CustomTextstyle.title.copyWith(
                    color: CustomColors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: MediaQuery.sizeOf(context).height * 0.78,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: userModel == null
                      ? Container()
                      : Column(children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 30,
                              bottom: 10,
                            ),
                            height: 60,
                            child: Row(
                              spacing: 5,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewProfile(
                                          userModel: userModel,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        userModel.name,
                                        style: CustomTextstyle.title,
                                      ),
                                      Text(
                                        userModel.about,
                                        style: CustomTextstyle.body,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Image.asset(ImagesConst.qrCode),
                              ],
                            ),
                          ),
                          Divider(
                            height: 0.5,
                          ),
                          SettingsListTile(
                            title: "Account",
                            subTitle: "Privacy, security, change number",
                            imagePath: ImagesConst.key,
                          ),
                          SettingsListTile(
                            title: "Chat",
                            subTitle: "Chat history,theme,wallpapers",
                            imagePath: ImagesConst.message,
                          ),
                          SettingsListTile(
                            title: "Notifications",
                            subTitle: "Privacy, security, change number",
                            imagePath: ImagesConst.notification,
                          ),
                          SettingsListTile(
                            title: "Help",
                            subTitle: "Privacy, security, change number",
                            imagePath: ImagesConst.help,
                          ),
                          SettingsListTile(
                            title: "Storage and data",
                            subTitle: "Privacy, security, change number",
                            imagePath: ImagesConst.data,
                          ),
                          SettingsListTile(
                            title: "Invite a Friend",
                            subTitle: "Privacy, security, change number",
                            imagePath: ImagesConst.users,
                          ),
                        ])),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;
  const SettingsListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: CircleAvatar(
          child: imagePath.endsWith("svg")
              ? Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(imagePath),
                )
              : Image.asset(imagePath),
        ),
        title: Text(
          title,
          style: CustomTextstyle.title.copyWith(fontSize: 18),
        ),
        subtitle: Text(
          subTitle,
          style: CustomTextstyle.caption.copyWith(
            fontSize: 14,
            color: CustomColors.text,
          ),
        ),
      ),
    );
  }
}
