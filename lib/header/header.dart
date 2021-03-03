import 'package:alcorec/record/record_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'header_model.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HeaderModel>(
      create: (_) => HeaderModel(),
      child: Consumer<HeaderModel>(
        builder: (context, model, child) {
          return AppBar(
            title: Text(model.title),
          );
        },
      ),
    );
  }
}
