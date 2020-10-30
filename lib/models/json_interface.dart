class ItemJson {
  String name;
  int categoryID;
  String price;
  List<String> ingredients;

  ItemJson(this.name, this.categoryID, this.price, this.ingredients);

  factory ItemJson.fromJson(dynamic json) {
    return ItemJson(json['Name'] as String, json['CategoryID'] as int,
        json['Prix'].toString(), [
      json['Ingredient2'] as String,
      json['Ingredient1'] as String,
      json['Ingredient3'] as String,
      json['Ingredient4'] as String,
      json['Ingredient5'] as String,
      json['Ingredient6'] as String,
      json['Ingredient7'] as String,
      json['Ingredient8'] as String,
      json['Ingredient9'] as String,
      json['Ingredient10'] as String,
    ]);
  }
}
