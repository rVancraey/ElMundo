class FoodItem {
  String _name;
  String _prix;
  List<String> _ingredients;
  bool _isFavorited = false;
  int _amountSelected = 0;
  String _ingredientsNames;
  String _ingredientsNamesShort = "";
  int displayedIngredients = 3;

  FoodItem(this._name, this._prix, this._ingredients) {
    // _ingredientsNamesShort = getIngredientsNames(true);
  }

  get prix {
    return _prix;
  }

  get name {
    return _name;
  }

  get ingredients {
    return _ingredients;
  }

  get amountOfIngredients {
    int tmp = 0;
    _ingredients.asMap().forEach((index, element) {
      if (element.isNotEmpty) {
        tmp = index + 1;
      }
    });
    return tmp;
  }

  get ingredientsNames {
    String tmp = "";
    _ingredients.asMap().forEach((index, element) {
      if (element.isNotEmpty) {
        tmp += element + ", ";
      }
    });
    return tmp.substring(0, tmp.length - 2);
  }

  get ingredientsNamesShort {
    int amount = amountOfIngredients;
    String tmp = "";

    for (int i = 0; i < amount; i++) {
      if (i == amount - 1) {
        tmp += _ingredients[i];
      } else {
        if (i == displayedIngredients - 1) {
          tmp += _ingredients[i] + " ...";
          break;
        }
        tmp += _ingredients[i] + ", ";
      }
    }
    return tmp;
    // _ingredients.asMap().forEach((index, element) {
    //   if (index < displayedIngredients) {
    //     tmp += element + ", ";
    //   }
    // });
    // if (displayedIngredients - 1 < amount) {
    //   tmp += "...";
    // }
    // return tmp;
  }

  get isFavorited {
    return _isFavorited;
  }

  set isFavorited(bool value) {
    _isFavorited = value;
  }

  get amountSelected {
    return _amountSelected;
  }

  set amountSelected(int value) {
    _amountSelected = value;
  }

  void incrementAmountSelected() {
    _amountSelected++;
  }

  void decrementAmountSelected() {
    _amountSelected--;
  }

  // String getIngredientsNames(bool shortVersion) {
  //   String tmp = "";
  //   for (int i = 0; i < ingredients.length;) {
  //     if (ingredients[i] != "") {
  //       tmp += _ingredients[i] + ", ";
  //       if (i == displayedIngredients - 1 && shortVersion) {
  //         tmp += "...";
  //       }
  //     }
  //   }
  //   return tmp;
  // }
}
