import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/list_fields.dart';
import '../providers/field_provider_item.dart';

class HomePage extends StatelessWidget {
  var _textFieldController = TextEditingController();

  Future<void> _inputData(BuildContext ctx, FieldProviderItem fpi) async {
    return showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Enter the sentences',
            style: TextStyle(fontSize: 25),
          ),
          content: TextFormField(
            textInputAction: TextInputAction.done,
            autofocus: true,
            controller: _textFieldController,
            decoration: const InputDecoration(
              labelText: "Input data!",
            ),
            onFieldSubmitted: (_) {
              fpi.addField(_textFieldController.text);
              _textFieldController.clear();
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
            },
            style: Theme.of(context).textTheme.subtitle2,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                fpi.addField(_textFieldController.text);
                _textFieldController.clear();
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var fields = Provider.of<FieldProviderItem>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.outline,
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Theme.of(context).colorScheme.shadow,
                  offset: const Offset(0, 4),
                ),
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Tasks',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    height: 56,
                    width: 56,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => _inputData(context, fields),
                      icon: Image.asset(
                        'assets/images/new_plus_icon.png',
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              ListFields(),
            ],
          ),
        ),
      ),
    );
  }
}
