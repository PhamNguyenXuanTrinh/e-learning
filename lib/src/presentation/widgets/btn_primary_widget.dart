import 'package:elearning/src/presentation/views/dialog/dialog_success_screen.dart';
import 'package:elearning/src/presentation/views/search_filter/detail_search.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:elearning/src/presentation/views/otp/otp_screen.dart';
import 'package:elearning/src/presentation/views/otp/enter_phone_screen.dart';
import 'package:elearning/src/presentation/views/navigation_bar/navigation_bar_screen.dart';

class PrimaryBtn extends StatelessWidget {
  final String text;
  final double? width;

  const PrimaryBtn({super.key, required this.text, this.width});

  void _navigateToView(BuildContext context, Widget view) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => view,
    ));
  }

  void _handleButtonClick(BuildContext context) {
    switch (text) {
      case AppStrings.login:
        _navigateToView(context, const NavView());
        break;
      case AppStrings.signup:
        _navigateToView(context, const EnterOtpView());
        break;
      case AppStrings.btnCtn:
        _navigateToView(context, const OtpView());
        break;
      case AppStrings.btnVerify:
        _navigateToView(context, const DialogSuccessView());
        break;
      case AppStrings.doneBtn:
        _navigateToView(context, const NavView());
        break;
      case AppStrings.apply:
        _navigateToView(context, const DetailFilterView());
      default:
        // Handle default case or do nothing
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFullWidth = width == null;
    final buttonWidth = isFullWidth ? MediaQuery.of(context).size.width : width;

    return SizedBox(
      width: buttonWidth,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          _handleButtonClick(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
        ),
      ),
    );
  }
}
