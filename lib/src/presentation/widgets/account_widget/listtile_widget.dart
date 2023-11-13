import 'package:flutter/material.dart';

class AccountButtonsWidget extends StatelessWidget {

  final VoidCallback onFavoriteTap;
  final VoidCallback onEditAccountTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onHelpTap;

  const AccountButtonsWidget({
    super.key,

    required this.onFavoriteTap,
    required this.onEditAccountTap,
    required this.onSettingsTap,
    required this.onHelpTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        ListTileButton(
          label: 'Favourite',
          onTap: onFavoriteTap,
          height: 20,
        ),
        ListTileButton(
          label: 'Edit Account',
          onTap: onEditAccountTap,
          height: 20,
        ),
        ListTileButton(
          label: 'Settings and Privacy',
          onTap: onSettingsTap,
          height: 20,
        ),
        ListTileButton(
          label: 'Help',
          onTap: onHelpTap,
          height: 20,
        ),
      ],
    );
  }
}

class ListTileButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ListTileButton({
    super.key,
    required this.label,
    required this.onTap,
    required int height,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      onTap: onTap,
      trailing: const Icon(
          Icons.chevron_right), // Thêm icon chevron_right vào mỗi nút
    );
  }
}
