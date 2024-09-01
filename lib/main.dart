import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/routes/router.dart';
import 'package:notes_app/themes/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'services/note_boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Notely',
      theme: lightMode,
      darkTheme: darkMode,
      routerConfig: router,
    );
  }
}
