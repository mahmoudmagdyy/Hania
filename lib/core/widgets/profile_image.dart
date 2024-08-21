/*
import 'dart:io';

import '/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_colors.dart';
import '../utils/constants.dart';
import 'diff_img.dart';

class ProfileImage extends StatefulWidget {
  final ValueChanged<File>? updateBannerImage;
  final String? image;
  const ProfileImage({Key? key, this.updateBannerImage, this.image})
      : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  final ImagePicker _picker = ImagePicker();
  File? avatarImageFile;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double raduis = (screenWidth * 0.388) * 0.5;
    double width = screenWidth * 0.299;
    double height = screenHeight * 0.1639;
    return InkWell(
      onTap: () => onPickImage(),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: width,
                height: width,
                decoration: BoxDecoration(
                  color: const Color(0xffEDEEEF),
                  borderRadius: BorderRadius.circular(raduis),
                ),
                child: avatarImageFile == null
                    ? widget.image == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(raduis),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(screenWidth * 0), //padding_16
                              child: Image.asset(ImgAssets.logo),
                            ),
                          )
                        : DiffImage(
                            width: width,
                            height: width,
                            image: widget.image ?? '',
                            fitType: BoxFit.cover,
                            raduis: raduis,
                          )
                    : Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffEDEEEF),
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(raduis),
                          child: Image.file(
                            avatarImageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            Positioned(
              bottom: 15,
              right: 10,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.main,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  FontAwesomeIcons.pen,
                  color: AppColors.upBackGround,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onPickImage() async {
    Constants.imagesSourcesShowModel(
      context: context,
      onCameraPressed: () => _onCameraTapped(),
      onGalleryPressed: () => _onGalleryTapped(),
    );
  }

  _onCameraTapped() async {
    Navigator.pop(context);
    final XFile? xImage = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 88,
    );
    if (!mounted) return;
    if (xImage != null) {
      setState(() {
        avatarImageFile = File(xImage.path);
        widget.updateBannerImage!(avatarImageFile!);
      });
    }
  }

  _onGalleryTapped() async {
    Navigator.pop(context);
    final XFile? xImage = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 88,
    );
    if (!mounted) return;
    if (xImage != null) {
      setState(() {
        avatarImageFile = File(xImage.path);
        widget.updateBannerImage!(avatarImageFile!);
      });
    }
  }
}
*/