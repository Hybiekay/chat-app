import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/core/constants/images_const.dart';
import 'package:dating_app/core/helper/checkers.dart';
import 'package:dating_app/core/theme/custom_colors.dart';
import 'package:dating_app/core/theme/custom_textstyle.dart';
import 'package:dating_app/model/user_model.dart';
import 'package:dating_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ViewProfile extends StatefulWidget {
  final UserModel userModel;
  const ViewProfile({super.key, required this.userModel});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  bool isMe = false;

  @override
  void initState() {
    isCurrentUserId(widget.userModel.id).then((value) {
      setState(() {
        isMe = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<CurrentUserProvider, AuthProvider>(
          builder: (context, currentUser, authProvider, _) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                height: MediaQuery.sizeOf(context).height * 0.45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomColors.black,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: currentUser.image != null
                                ? FileImage(currentUser.image!)
                                : widget.userModel.profileUrl == null
                                    ? null
                                    : CachedNetworkImageProvider(
                                        widget.userModel.profileUrl!),
                          ),
                          isMe
                              ? Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {
                                      currentUser.pickImageAndUpload(
                                          ImageSource.camera);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          CustomColors.primaryColor,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: CustomColors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      Text(widget.userModel.name,
                          style: CustomTextstyle.title.copyWith(
                              color: CustomColors.white, fontSize: 20)),
                      Text(
                        "@${widget.userModel.name.toLowerCase()}",
                        style: CustomTextstyle.body
                            .copyWith(color: CustomColors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      isMe
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  authProvider.logOut(context);
                                },
                                child: Text("Log out"),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: CustomColors.primaryColor,
                                    child: SvgPicture.asset(
                                      ImagesConst.text,
                                      width: 30,
                                      color: CustomColors.white,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: CustomColors.primaryColor,
                                    child: SvgPicture.asset(
                                      ImagesConst.video,
                                      color: CustomColors.white,
                                      width: 30,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: CustomColors.primaryColor,
                                    child: SvgPicture.asset(
                                      ImagesConst.phone,
                                      width: 30,
                                      color: CustomColors.white,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: CustomColors.primaryColor,
                                    child: SvgPicture.asset(
                                      ImagesConst.more,
                                      width: 30,
                                      color: CustomColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.63,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: CustomColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            SettingsListTile(
                              title: "Display Name",
                              subtitle: widget.userModel.name,
                            ),
                            SettingsListTile(
                              title: "Email Address",
                              subtitle: widget.userModel.email,
                            ),
                            SettingsListTile(
                              title: "Address",
                              subtitle: "",
                            ),
                            SettingsListTile(
                              title: "Phone Number",
                              subtitle: "",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Media Shared",
                                      style: CustomTextstyle.caption.copyWith(
                                        color: Color(0xff797C7B),
                                      )),
                                  Text("View All",
                                      style: CustomTextstyle.caption.copyWith(
                                          color: CustomColors.primaryColor)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const SettingsListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        subtitle,
        style: CustomTextstyle.title,
      ),
      title: Text(
        title,
        style: CustomTextstyle.caption.copyWith(color: Color(0xff797C7B)),
      ),
    );
  }
}
