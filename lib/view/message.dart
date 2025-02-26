import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/core/constants/images_const.dart';
import 'package:dating_app/core/helper/all_extenson.dart';
import 'package:dating_app/core/theme/theme.dart';
import 'package:dating_app/provider/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    context.watch<CurrentUserProvider>().getCurrentUser();
    final userModel = context.watch<CurrentUserProvider>().userModel;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: userModel == null
            ? CircularProgressIndicator()
            : Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.isDark
                          ? CustomColors.primaryColor
                          : CustomColors.black,
                    ),
                    child: Column(
                      children: [
                        30.toHeightWhiteSpace,
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: CustomColors.white)),
                                child: Image.asset(ImagesConst.search),
                              ),
                              Text(
                                "Home",
                                style: CustomTextstyle.title.copyWith(
                                  color: CustomColors.white,
                                ),
                              ),
                              userModel.profileUrl == null
                                  ? CircleAvatar()
                                  : CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              userModel.profileUrl!),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      decoration: BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                    ),
                  )
                ],
              ),
      ),
      floatingActionButton: SpeedDial(
        activeIcon: Icons.cancel,
        backgroundColor: CustomColors.primaryColor,
        icon: Icons.mark_email_read,
        iconTheme: IconThemeData(color: CustomColors.white),
        openCloseDial: isDialOpen,
        onPress: () {
          isDialOpen.value = !isDialOpen.value;
        },
        children: [
          SpeedDialChild(
            label: "Messages",
            onTap: () {},
            child: SvgPicture.asset(ImagesConst.message),
          ),
          SpeedDialChild(
            label: "Add Status",
            onTap: () {},
            child: SvgPicture.asset(ImagesConst.calls),
          ),
          SpeedDialChild(
            label: "Call",
            onTap: () {},
            child: Transform.flip(
              flipX: true,
              child: SvgPicture.asset(
                ImagesConst.calls,
                color: CustomColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
