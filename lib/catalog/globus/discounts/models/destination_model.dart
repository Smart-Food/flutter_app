import 'package:flutterapp/catalog/globus/discounts/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/stmarksbasilica.jpg',
    name: 'Гречка Агро-Альянс',
    type: 'Арт. 22104007',
    startTimes: 'Агро-Альянс',
    rating: 5,
    price: 93,
  ),
  Activity(
    imageUrl: 'assets/gondola.jpg',
    name: 'Гречка Чёрный хлеб',
    type: 'Арт. 447686003',
    startTimes: 'Чёрный хлеб',
    rating: 4,
    price: 200,
  ),
  Activity(
    imageUrl: 'assets/murano.jpg',
    name: 'Гречка Сыроед',
    type: 'Арт. 209472004',
    startTimes: 'Сыроед',
    rating: 3,
    price: 155,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/venice.jpg',
    city: 'Творог Простоквашино',
    country: '85,99 руб.',
    description: 'Цена действительна до 28.04',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/paris.jpg',
    city: 'Нектар Добрый Персик-яблоко',
    country: '109,99',
    description: 'Цена действительна до 28.04',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/newdelhi.jpg',
    city: 'Капли Mr. Bruno',
    country: '199,99',
    description: 'Цена действительна до 28.04',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/saopaulo.jpg',
    city: 'Бекон Велком',
    country: '149,99',
    description: 'Цена действительна до 28.04',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'Игрушка Белка',
    country: '89,99',
    description: 'Цена действительна до 28.04',
    activities: activities,
  ),
];