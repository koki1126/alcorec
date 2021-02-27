import 'package:alcorec/record/record_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Record extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordModel>(
      create: (_) => RecordModel(),
      child: Consumer<RecordModel>(
        builder: (context, model, child) {
          return GestureDetector(
            onTap: () {
              model.shopFocusNode.unfocus();
            },
            child: Container(
              color: Colors.green,
              child: Column(
                children: [
                  TextField(
                    focusNode: model.shopFocusNode,
                    controller: model.shopEditingController,
                    keyboardType: TextInputType.number, // キーボードは数値のみ
                    decoration: InputDecoration(
                      labelText: '日付',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
