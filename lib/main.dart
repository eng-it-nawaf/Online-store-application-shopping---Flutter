import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/features/start/presintation/manager/start_bloc.dart'; // Add the correct import
import 'routes/app_routes.dart';  // Assuming this file contains the routes logic
import 'injection_container.dart' as object;
import 'package:shoppe_ui/core/AppTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // تأكد من التهيئة هنا
  await object.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartBloc(), // Provide StartBloc globally
      child: MaterialApp(
        title: 'Shoppe',
        theme: ThemeData(

          fontFamily: 'Roboto',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.start, // Use the AppRoutes class for better management
        onGenerateRoute: AppRoutes.generateRoute, // Use AppRoutes to generate routes
      ),
    );
  }
}