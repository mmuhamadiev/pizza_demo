import 'package:pizza_demo/generated/assets.dart';

class PizzaModel {
  String name;
  String description;
  double priceS;
  double priceM;
  double priceL;
  String image;
  String largeImage;
  bool isLiked;

  PizzaModel(
      this.name,
      this.description,
      this.priceS,
      this.priceM,
      this.priceL,
      this.image,
      this.largeImage,
      this.isLiked,
      );
}