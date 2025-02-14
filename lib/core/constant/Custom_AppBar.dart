import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppbar;
  final IconData? iconAppbar;
  final void Function()? onPressAppbar;

  const CustomAppbar({super.key, required this.titleAppbar,this.iconAppbar,this.onPressAppbar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
       centerTitle: true,
      leading: IconButton(onPressed: onPressAppbar, icon: Icon(iconAppbar)),
      title: Text(
        titleAppbar,style: TextStyle(color: Color(0xFF02369C),fontWeight: FontWeight.w500,fontSize: 30),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
