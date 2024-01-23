import 'package:cat_trivia_app/features/application/factsCat/bloc/facts_cat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HistoryFactPages extends StatefulWidget {
  const HistoryFactPages({super.key});

  @override
  State<HistoryFactPages> createState() => _HistoryFactPagesState();
}

class _HistoryFactPagesState extends State<HistoryFactPages> {
  @override
  void initState() {
    super.initState();
    context.read<FactsCatBloc>().add(GetFactsHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facts History"),
      ),
      body: BlocBuilder<FactsCatBloc, FactsCatState>(
        builder: (context, state) {
          if (state is FactsHistoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FactsHistoryError) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is FactsHistorySuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 25.0,
              ),
              child: ListView.builder(
                itemCount: state.history.length,
                itemBuilder: (context, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.history[i].text,
                        maxLines: 10,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      const Gap(5.0),
                      Text(state.history[i].createdAt),
                      const Gap(10.0),
                    ],
                  );
                },
              ),
            );
          }
          return const Center(
            child: Text("Empty"),
          );
        },
      ),
    );
  }
}
