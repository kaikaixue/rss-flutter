import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final bool isBackButton;
  final Widget? title;
  final List<Widget>? actions;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Size appBarHeight = const Size.fromHeight(56.0);

  const CustomAppBar({super.key, this.isBackButton = false, this.title, this.actions, this.scaffoldKey,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackButton
          ? const BackButton(color: Colors.white,)
          : IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => appBarHeight;
}
