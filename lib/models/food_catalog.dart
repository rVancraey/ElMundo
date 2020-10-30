import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'food_item.dart';
import 'json_interface.dart';

class FoodCatalog extends ChangeNotifier {
  List<FoodItem> _foodBasket = [];
  List<FoodItem> _foodFavorites = [];
  List<String> _foodCategories = ["Sandwich", "Wraps", "Salade", "Boissons"];
  List<List<FoodItem>> _allItems;
  List<FoodItem> _foodItems = [];

  List<String> get foodCategories => _foodCategories;
  List<FoodItem> get foodBasket => _foodBasket;
  List<FoodItem> get foodFavorites => _foodFavorites;
  List<FoodItem> get foodItems => _foodItems;
  List<List<FoodItem>> get allItems => _allItems;

  FoodCatalog() {
    String test =
        '[{"CategoryID":0,"Name":"Belge","Prix":3,"Ingredient1":"Jambon","Ingredient2":"Asperges","Ingredient3":"Œufs","Ingredient4":"Mayo","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Français","Prix":3,"Ingredient1":"Jambon","Ingredient2":"Brie","Ingredient3":"Mayo","Ingredient4":"","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Espagnol","Prix":3,"Ingredient1":"Chorizo","Ingredient2":"Mozza","Ingredient3":"Andalouse","Ingredient4":"","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Anglais","Prix":3,"Ingredient1":"Pain de viande","Ingredient2":"Gouda","Ingredient3":"Cocktail","Ingredient4":"","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Allemand","Prix":3,"Ingredient1":"Dinde","Ingredient2":"Gouda","Ingredient3":"Mayo","Ingredient4":"","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Autrichien","Prix":3,"Ingredient1":"Pommes de terre","Ingredient2":"Salami","Ingredient3":"Oignios grillés","Ingredient4":"","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Luxembourgeois","Prix":3,"Ingredient1":"Pommes de terre","Ingredient2":"Gouda","Ingredient3":"Oignios grillés","Ingredient4":"","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Grec","Prix":3,"Ingredient1":"Feta","Ingredient2":"Concombre","Ingredient3":"Oignons","Ingredient4":"Poivrons","Ingredient5":"Tomates","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Suisse","Prix":3,"Ingredient1":"Jambon","Ingredient2":"Gouda","Ingredient3":"Œufs","Ingredient4":"Mayo","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Magagascar","Prix":3,"Ingredient1":"Thon","Ingredient2":"Mayo","Ingredient3":"Pêches","Ingredient4":"Maïs","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Polynesien","Prix":3,"Ingredient1":"Crabe","Ingredient2":"Poires","Ingredient3":"Maïs","Ingredient4":"","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Californien","Prix":3,"Ingredient1":"Américain (porc/bœuf)","Ingredient2":"Gouda","Ingredient3":"Oignons","Ingredient4":"","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Mexicain","Prix":3,"Ingredient1":"Chorizo","Ingredient2":"Poivrons","Ingredient3":"Maïs","Ingredient4":"Oignons","Ingredient5":"Andalouse","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Hongrois","Prix":3,"Ingredient1":"Boulettes","Ingredient2":"Gouda","Ingredient3":"Oignons grillés","Ingredient4":"Ketchup","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Egyptien","Prix":3,"Ingredient1":"Pita","Ingredient2":"Poivrons","Ingredient3":"Oignons","Ingredient4":"Œufs","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Bresilien","Prix":3,"Ingredient1":"DInde","Ingredient2":"Salami","Ingredient3":"Fromage","Ingredient4":"Ananas","Ingredient5":"Maïs","Ingredient6":"Andalouse","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Tahitien","Prix":3,"Ingredient1":"Dinde","Ingredient2":"Salami","Ingredient3":"Pêches","Ingredient4":"Cocktail","Ingredient5":"Oignons grillés","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Tunisien","Prix":3,"Ingredient1":"Dinde","Ingredient2":"Taboulet","Ingredient3":"Citron","Ingredient4":"Poivrons","Ingredient5":"Oignons","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Hawaïen","Prix":3,"Ingredient1":"Jambon","Ingredient2":"Fromage","Ingredient3":"Ananas","Ingredient4":"MaÏs","Ingredient5":"Cocktail","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Indonesien","Prix":3,"Ingredient1":"Dinde","Ingredient2":"Ananas","Ingredient3":"Maïs","Ingredient4":"Oignons grillés","Ingredient5":"Curry","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Cayenne","Prix":3,"Ingredient1":"Dinde","Ingredient2":"Fromage","Ingredient3":"Oignons grillés","Ingredient4":"Tomate","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Italien","Prix":3,"Ingredient1":"Parme","Ingredient2":"Mozza","Ingredient3":"Basilic","Ingredient4":"Huiles d olives","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Portugais","Prix":3,"Ingredient1":"Thon piquant","Ingredient2":"Poivrons","Ingredient3":"Oignons","Ingredient4":"Œufs","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Pyreneen","Prix":3,"Ingredient1":"Chèvre","Ingredient2":"Lardon grillés","Ingredient3":"Miel","Ingredient4":"","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Europeen","Prix":3,"Ingredient1":"Jambon","Ingredient2":"Dinde","Ingredient3":"Chorizo","Ingredient4":"Salami","Ingredient5":"Pain de viande","Ingredient6":"Oignons grillés","Ingredient7":"Mayo","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Floridien","Prix":3.4,"Ingredient1":"Philadelphia","Ingredient2":"Rôti","Ingredient3":"Chorizo","Ingredient4":"Oignons","Ingredient5":"","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Norvegien","Prix":3.4,"Ingredient1":"Philadelphia","Ingredient2":"Saumon fumé","Ingredient3":"Oignons","Ingredient4":"Citron","Ingredient5":"Roquette","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Napolitain","Prix":3.4,"Ingredient1":"Parme","Ingredient2":"Mozza","Ingredient3":"Pamersan","Ingredient4":"Roquette","Ingredient5":"Pesto","Ingredient6":"Philadelphia","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"New Delhy","Prix":3.4,"Ingredient1":"Poulet grillé","Ingredient2":"Rôti","Ingredient3":"Ananas","Ingredient4":"Maïs","Ingredient5":"Roquette","Ingredient6":"Curry","Ingredient7":"Philadelphia","Ingredient8":"","Ingredient9":"","Ingredient10":""},{"CategoryID":0,"Name":"Sud Ouest","Prix":3.4,"Ingredient1":"Magret de Canard","Ingredient2":"Noix","Ingredient3":"Philadelphia","Ingredient4":"Roquette","Ingredient5":"Dressing framboise","Ingredient6":"","Ingredient7":"","Ingredient8":"","Ingredient9":"","Ingredient10":""}]';
    var tagObjsJson = jsonDecode(test) as List;

    List<ItemJson> jsonObjs =
        tagObjsJson.map((tagJson) => ItemJson.fromJson(tagJson)).toList();

    jsonObjs.forEach((element) {
      _foodItems
          .add(FoodItem(element.name, element.price, element.ingredients));
    });

    _allItems = [_foodItems, [], [], []];
    print("fini");
  }

  FoodItem getItem(int categoryIndex, int itemIndex) {
    return _allItems[categoryIndex][itemIndex];
  }

  FoodItem getItemFromBasket(int index) {
    return _foodBasket[index];
  }

  FoodItem getFavoriteItem(int index) {
    return _foodFavorites[index];
  }

  get amountOfItemsInBasket {
    int tmp = 0;
    _foodBasket.forEach((element) {
      tmp += element.amountSelected;
    });
    return tmp;
  }

  get totalPrice {
    double total = 0;
    _foodBasket.forEach((element) {
      total += (double.parse(element.prix)) * element.amountSelected;
    });
    return total.toStringAsFixed(1);
  }

  void addToFoodBasket(FoodItem item) {
    if (item.amountSelected == 0) {
      _foodBasket.add(item);
    }
    item.incrementAmountSelected();
    notifyListeners();
  }

  void emptyBasket() {
    _foodBasket.forEach((element) {
      element.amountSelected = 0;
    });
    _foodBasket.clear();
    notifyListeners();
  }

  void removeFromFoodBasket(FoodItem item) {
    item.decrementAmountSelected();
    if (item.amountSelected == 0) {
      _foodBasket.remove(item);
    }
    notifyListeners();
  }

  void toggleFavorite(FoodItem item) {
    item.isFavorited = !item.isFavorited;
    if (item.isFavorited) {
      _foodFavorites.add(item);
    } else {
      _foodFavorites.remove(item);
    }
    notifyListeners();
  }
}
