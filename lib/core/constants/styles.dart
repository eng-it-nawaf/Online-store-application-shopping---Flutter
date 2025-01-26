import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

class AppStyles {
  static ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(27),
    ),
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
  );

  static ButtonStyle cancelButtonStyle = TextButton.styleFrom(
    foregroundColor: AppTheme.cancel,
    textStyle: const TextStyle(fontSize: 16),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: AppStyles.customButtonStyle,
              onPressed: () {},
              child: Text('Done'),
            ),
            SizedBox(height: 20),
            TextButton(
              style: AppStyles.cancelButtonStyle,
              onPressed: () {},
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
