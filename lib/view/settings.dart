import 'package:dating_app/core/constants/images_const.dart';
import 'package:dating_app/core/theme/custom_colors.dart';
import 'package:dating_app/core/theme/custom_textstyle.dart';
import 'package:dating_app/model/user_model.dart';
import 'package:dating_app/provider/current_user_provider.dart';
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                              ),
                              Column(
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ],
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
          style: CustomTextstyle.title,
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
