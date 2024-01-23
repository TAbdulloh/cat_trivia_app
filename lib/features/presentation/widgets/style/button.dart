import 'package:cat_trivia_app/features/presentation/widgets/style/base_colors.dart';

import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size(30.0, 50.0),
  backgroundColor: orange,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25.0),
    ),
  ),
);
