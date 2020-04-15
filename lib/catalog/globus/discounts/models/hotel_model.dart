class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Кекс Пасхальный',
    address: 'Цена действительна до 28.04',
    price: 180,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Сосиски Глобус',
    address: 'Цена действительна до 28.04',
    price: 240,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Хлеб Хорватский',
    address: 'Цена действительна до 28.04',
    price: 46,
  ),
];