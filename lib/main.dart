import 'package:cat_trivia_app/features/appServices/hive_services/history_facts.dart';
import 'package:cat_trivia_app/features/application/factsCat/bloc/facts_cat_bloc.dart';
import 'package:cat_trivia_app/features/presentation/pages/catFacts/cat_facts_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'features/presentation/widgets/style/theme.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FactsHistoryAdapter());

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    AppTheme.init();
    return BlocProvider(
      create: (context) => FactsCatBloc(),
      child: MaterialApp(
        home: CatFactsPages(),
      ),
    );
  }
}
