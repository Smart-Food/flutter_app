import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "assets/orderFoodOnline.jpg",
      title: "Закажите еду онлайн",
      body: "Доставка день в день, в удобное для вас время",
      titleGradient: gradients[0]),
  PageModel(
      imageUrl: "assets/onlineMenu.jpg",
      title: "Онлайн меню",
      body: "Выберем лучшее с полок магазинов, как для себя",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "assets/restaurantsNearMe.jpg",
      title: "Магазины рядом со мной",
      body: "Привезём тяжелые сумки из них  прямо до вашей двери",
      titleGradient: gradients[2]),
];

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}