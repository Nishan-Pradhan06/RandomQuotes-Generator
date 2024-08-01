import 'package:flutter/material.dart';
import 'package:learngin/core/theme/colors.dart';
import 'package:learngin/model/custom_app_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CustomAppBarModel model;
  const CustomAppBar({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      elevation: 8.0,
      foregroundColor: Colors.black,
      backgroundColor: BrandColors.primary,
      scrolledUnderElevation: 6.0,
      actions: [
        if (model.icon != null && model.onPressed != null)
          IconButton(
            icon: Icon(
              model.icon,
              color: BrandColors.secondary,
            ),
            onPressed: model.onPressed,
          ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      centerTitle: true,
      title: Text(
        model.title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}