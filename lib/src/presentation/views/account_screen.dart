import 'package:elearning/src/presentation/widgets/account_widget/avatar_widget.dart';
import 'package:elearning/src/presentation/widgets/account_widget/listtile_widget.dart';
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
              elevation: 0,
              title: const Text(
                'Account',
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
