import 'package:elearning/src/presentation/views/account_page/widgets/avatar_widget.dart';
import 'package:elearning/src/presentation/views/account_page/widgets/listtile_widget.dart';
import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              title: const Text(
                AppStrings.account,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AvatarWidget(
                  onAvatarTap: () {},
                ),
                const SizedBox(height: 20),
                AccountButtonsWidget(
                  onFavoriteTap: () {},
                  onEditAccountTap: () {},
                  onSettingsTap: () {},
                  onHelpTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
