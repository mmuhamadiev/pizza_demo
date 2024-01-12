import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:pizza_demo/data/models/pizza_model.dart';
import 'package:pizza_demo/generated/assets.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {

  PageController mainPageController = PageController(initialPage: 1, viewportFraction: 0.53);

  late AnimationController controller;

  List<PizzaModel> pizzas = [
    PizzaModel(
        'Midnight Harvest',
        'This pizza celebrates the rich and bold flavors of black olives paired with a medley of cheeses. The deep, earthy taste of black olives harmonizes beautifully with the creamy, melted cheeses.',
        14.99,
        16.99,
        24.99,
        Assets.imagesPropertyPizza2,
        Assets.imagesMidnightHarvestZOOM,
        false
    ),
    PizzaModel(
        'Pepperoni Blast',
        'The combination of perfectly melted mozzarella cheese, tangy tomato sauce, and a crispy yet chewy crust creates a harmonious balance that leaves you wanting more.',
        15.99,
        17.99,
        25.99,
        Assets.imagesPropertyPizza1,
        Assets.imagesPepperoniBlastZOOM,
        false
    ),
    PizzaModel(
        'Shrimplastic',
        'This pizza showcases the perfect combination of shrimp and cheese, with gooey melted cheeses complementing the savory shrimp toppings for a truly indulgent experience.',
        17.99,
        19.99,
        27.99,
        Assets.imagesPropertyPizza3,
        Assets.imagesShrimptasticZOOM,
        false
    ),
  ];

  MainCubit() : super(MainState(1, PizzaModel(
      'Pepperoni Blast',
      'The combination of perfectly melted mozzarella cheese, tangy tomato sauce, and a crispy yet chewy crust creates a harmonious balance that leaves you wanting more.',
      15.99,
      17.99,
      25.99,
      Assets.imagesPropertyPizza1,
      Assets.imagesPepperoniBlastZOOM,
      false
  ), 1, PizzaSize.M, 1.2));


  String pizzaSizeToString(PizzaSize size) {
    switch (size) {
      case PizzaSize.S:
        return 'S';
      case PizzaSize.M:
        return 'M';
      case PizzaSize.L:
        return 'L';
      default:
        return ''; // Handle unexpected cases
    }
  }

  void toggleSize() {
      if('S' == pizzaSizeToString( state.pizzaSize)) {
        emit(MainState(state.currentIndex, state.chosenPizza, state.quantity, state.pizzaSize, 1));
      } else if('M' == pizzaSizeToString( state.pizzaSize)) {
        emit(MainState(state.currentIndex, state.chosenPizza, state.quantity, state.pizzaSize, 1.2));
      } else {
        emit(MainState(state.currentIndex, state.chosenPizza, state.quantity, state.pizzaSize, 1.45));
      }
  }

  String formatCurrencySom(double currency) {
    var noSimbolInUSFormat = NumberFormat.currency(locale: "en_US", decimalDigits: 2, symbol: '\$');

    return noSimbolInUSFormat.format(currency);
  }

  void addQuantity() {
    if(state.quantity == 10) {
      emit(QuantityMaxErrorState(state.currentIndex, state.chosenPizza, state.quantity, state.pizzaSize, state.scale));
    } else {
      state.quantity++;
    }
    emit(MainState(state.currentIndex, state.chosenPizza, state.quantity, state.pizzaSize, state.scale));
  }

  void reduceQuantity() {
    if(state.quantity == 1) {
      emit(QuantityErrorState(state.currentIndex, state.chosenPizza, state.quantity, state.pizzaSize, state.scale));
    } else {
      state.quantity--;
    }
    emit(MainState(state.currentIndex, state.chosenPizza, state.quantity, state.pizzaSize, state.scale));
  }

  void changeIndex(int index) {
    emit(MainState(index, pizzas[index], state.quantity, state.pizzaSize, state.scale));
  }

  void like() {

    PizzaModel pizza = PizzaModel(
        pizzas[state.currentIndex].name,
        pizzas[state.currentIndex].description,
        pizzas[state.currentIndex].priceS,
        pizzas[state.currentIndex].priceM,
        pizzas[state.currentIndex].priceL,
        pizzas[state.currentIndex].image,
        pizzas[state.currentIndex].largeImage,
        !pizzas[state.currentIndex].isLiked);
    pizzas.replaceRange(state.currentIndex, state.currentIndex + 1, [pizza]);

    emit(MainState(state.currentIndex, state.chosenPizza, state.quantity, state.pizzaSize, state.scale));
  }

  void changePizzaType(PizzaModel pizzaModel) {
    emit(MainState(state.currentIndex, pizzaModel, state.quantity, state.pizzaSize, state.scale));
  }

  void changePizzaSize(PizzaSize pizzaSize) {
    emit(MainState(state.currentIndex, state.chosenPizza, state.quantity, pizzaSize, state.scale));
  }

}
