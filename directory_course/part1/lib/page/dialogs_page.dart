import 'package:flutter/material.dart';
import 'package:navigation3_course/page/home_page.dart';
import 'package:navigation3_course/widget/show_alert_dialog.dart';
import 'package:navigation3_course/widget/show_modal_bottom_sheet.dart';
import 'package:navigation3_course/widget/show_simple_dialog.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs and Modal Bottom Sheets'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ShowAlertDialog(),
            SizedBox(height: 20),
            ShowSimpleDialog(),
            SizedBox(height: 20),
            ShowModalBottomSheet(),
          ],
        ),
      ),
    );
  }
}

