import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIText(
              'Welcome to Your Account... or What\'s Left of It!',
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            UIText(
              "Here lies your account info, probably lost somewhere in the digital abyss. If you find it, let us know! Meanwhile, feel free to stare at this page and contemplate life's mysteries.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
