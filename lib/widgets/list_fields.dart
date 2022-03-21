import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './field_item.dart';
import '../providers/field_provider_item.dart';

class ListFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<FieldProviderItem>(context, listen: false)
          .fetchAndSetPlaces(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<FieldProviderItem>(
                  child: Center(
                    child: Text(
                      'Got no fields yet, start adding some!',
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  builder: (ctx, fieldItem, ch) => fieldItem.items.isEmpty
                      ? ch!
                      : Expanded(
                          child: ListView.builder(
                            itemCount: fieldItem.items.length,
                            itemBuilder: (ctx, i) => FieldItem(
                              fieldItem.items[i].id,
                              fieldItem.items[i].title,
                              fieldItem.items[i].isTrue,
                            ),
                          ),
                        ),
                ),
    );
  }
}
