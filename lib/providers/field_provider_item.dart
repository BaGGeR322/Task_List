import 'package:flutter/foundation.dart';

import '../models/field_model.dart';
import '../helpers/DBHelper.dart';

class FieldProviderItem with ChangeNotifier {
  List<FieldModel> _items = [];

  List<FieldModel> get items {
    return [..._items];
  }

  Future<void> addField(String pickedTitle) async {
    final newField = FieldModel(
      id: DateTime.now().toString(),
      title: pickedTitle,
      isTrue: false,
    );
    _items.add(newField);
    notifyListeners();
    DBHelper.insert('field_models', {
      'id': newField.id,
      'title': newField.title,
      'isTrue': newField.isTrue,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('field_models');
    _items = dataList
        .map((item) => FieldModel(
              id: item['id'],
              title: item['title'],
              isTrue: item['isTrue'] == 1,
            ))
        .toList();
    notifyListeners();
  }
}
