import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_clean_architecture/core/injector/injection_container.dart';

import '../blocs/history_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter TDD Clean Architecture'),
      ),
      body: BlocProvider(
        create: (context) => getIt<HistoryBloc>(),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: 0, itemBuilder: (_, index) => Text(''));
          },
        ),
      ),
    );
  }
}
