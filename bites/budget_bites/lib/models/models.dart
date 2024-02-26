//rimport 'dart:html';

class userIngredients{
  String name;
  String iconPath;
  //int count;
  userIngredients({required this.name, required this.iconPath,});
  static List<userIngredients> getUserIngredientsList(){
    List<userIngredients> userIngredientsList = [];
    userIngredientsList.add(userIngredients(name: 'Rice', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Orange', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Apple', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Bannana', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Milk', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Chocolate', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Ground Beef', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Pepper', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Salt', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Pepper', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Chicken', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Yogurt', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Eggs', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Cheese', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Fish', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Pork', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Soy sauce', iconPath: ''));
    userIngredientsList.add(userIngredients(name: 'Cabbage', iconPath: ''));
    return userIngredientsList;
  }
}



class mealType{
  String name;
  String iconPath;
  mealType({required this.name, required this.iconPath});
  static List<mealType> getMealTypeList(){
    List<mealType> mealTypeList = [];
    mealTypeList.add(
      mealType(
        name: 'Pasta', 
        iconPath: ''
      )
    );
    mealTypeList.add(
      mealType(
        name: 'Sandwiches', 
        iconPath: ''
      )
    );
    mealTypeList.add(
      mealType(
        name: 'Soup', 
        iconPath: ''
      )
    );
    mealTypeList.add(
      mealType(
        name: 'Breakfest', 
        iconPath: ''
      )
    );
    mealTypeList.add(
      mealType(
        name: 'Noodles', 
        iconPath: ''
      )
    );
    mealTypeList.add(
      mealType(
        name: 'Rice', 
        iconPath: ''
      )
    );
    mealTypeList.add(
      mealType(
        name: 'Vegan', 
        iconPath: ''
      )
    );
    return mealTypeList;
  }
}


class cuisine{
  String cuisineName;
  //bool selected;
  String iconPath;
  cuisine({required this.cuisineName, required this.iconPath});


  static List<cuisine> getCuisineList() {
    List<cuisine> cuisineList = [];
    cuisineList.add(
      cuisine(
        cuisineName: 'African',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Asian',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'American',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'British',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Cajun',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Caribbean',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Chinese',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'European',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'French',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'German',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Greek',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Indian',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Irish',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Italian',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Japanese',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Jewish',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Korean',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Latin American',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Mediterranean',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Mexican',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Middle Eastern',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Nordic',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Southern',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Spanish',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Thai',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    cuisineList.add(
      cuisine(
        cuisineName: 'Vietnamese',
        iconPath: 'assets/imgs/logo.png',
      )
    );
    return cuisineList;
  }
}
