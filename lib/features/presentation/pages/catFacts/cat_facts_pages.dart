import 'dart:math';

import 'package:cat_trivia_app/features/application/factsCat/bloc/facts_cat_bloc.dart';
import 'package:cat_trivia_app/features/presentation/pages/historyFact/history_fact_pages.dart';
import 'package:cat_trivia_app/features/presentation/widgets/style/base_colors.dart';
import 'package:cat_trivia_app/features/presentation/widgets/style/button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CatFactsPages extends StatefulWidget {
  const CatFactsPages({super.key});

  @override
  State<CatFactsPages> createState() => _CatFactsPagesState();
}

class _CatFactsPagesState extends State<CatFactsPages> {
  @override
  void initState() {
    super.initState();
    context.read<FactsCatBloc>().add(GetFactsCat());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FactsCatBloc, FactsCatState>(
        buildWhen: (context, state) {
          return state is FactsCatLoading ||
              state is FactsCatError ||
              state is FactsCatSuccess;
        },
        builder: (context, state) {
          if (state is FactsCatLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Gap(10.0),
                  Text("Please Waiting"),
                ],
              ),
            );
          } else if (state is FactsCatError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is FactsCatSuccess) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Column(
                children: [
                  const Text(
                    "Cat Facts",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(25.0),
                        Image.network(
                          "https://cataas.com/cat?v=${Random().nextInt(100)}",
                          key: UniqueKey(),
                          height: 300.0,
                          width: 500.0,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const SizedBox(
                              height: 300.0,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                        const Gap(
                          15.0,
                        ),
                        Text(
                          state.infoCat.text,
                          maxLines: 5,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(
                          10.0,
                        ),
                        Text(
                          state.infoCat.createdat,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const Gap(25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: buttonPrimary,
                              onPressed: () {
                                context.read<FactsCatBloc>().add(GetFactsCat());
                              },
                              child: Text(
                                "ANOTHER FACT!",
                                style: TextStyle(
                                    color: white, fontWeight: FontWeight.w500),
                              ),
                            ),
                            ElevatedButton(
                              style: buttonPrimary,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return const HistoryFactPages();
                                }));
                              },
                              child: Text(
                                "FACT HISTORY",
                                style: TextStyle(
                                    color: white, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text(
              "Empty",
              style: TextStyle(color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
