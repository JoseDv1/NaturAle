import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';

class DiaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiaryAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: const Text(
        'Diario de Alimentos',
        style: TextStyle(
            color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
