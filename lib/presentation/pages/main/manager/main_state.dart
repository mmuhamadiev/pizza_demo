part of 'main_cubit.dart';

enum PizzaSize {
  S,M,L
}

class MainState {

  double scale;

  int currentIndex;
  PizzaModel chosenPizza;

  int quantity;

  PizzaSize pizzaSize;

  MainState(this.currentIndex, this.chosenPizza, this.quantity, this.pizzaSize, this.scale);
}

class QuantityErrorState extends MainState {
  QuantityErrorState(super.currentIndex, super.chosenPizza, super.quantity, super.pizzaSize, super.scale);
}

class QuantityMaxErrorState extends MainState {
  QuantityMaxErrorState(super.currentIndex, super.chosenPizza, super.quantity, super.pizzaSize, super.scale);
}
