import 'package:flutter/material.dart';

var dataList = [
  Data(
    shopColor: Colors.green,
    gradientColor1: Colors.green[900],
    gradientColor2: Colors.green[800],
    gradientColor3: Colors.green[400],
    imageLogo: "assets/globusLogo.png",
    imageShop: "assets/globusShop.png",
    stories: [
      Story(
        "https://clck.ru/N8Wo6",
        "Успей",
        "купить",
      ),
      Story(
        "https://clck.ru/N8Wrd",
        "Социальная",
        "скидка",
      ),
      Story(
        "https://clck.ru/N8WsL",
        "Скидки",
        "по карте",
      ),
      Story(
        "https://clck.ru/N8Wsi",
        "Бонусы",
        "по карте",
      )
    ],
    categories: [
      "Собственное производство",
      "Наши марки",
      "Эксклюзивный алкоголь",
      "Здоровый выбор",
      "Молочные продукты, сыр, яйца",
      "Мясо, рыба, кулинария",
      "Овощи, фрукты, зелень",
      "Хлеб, кондитерские изделия",
      "Бакалея",
      "Замороженные продукты",
      "Напитки",
      "Алкоголь",
      "Косметика",
      "Гигиена",
      "Детские товары",
      "Уборка, бытовая химия",
      "Дом, хобби, техника",
      "Товары для животных",
      "Всё для автомобиля и дачи",
      "Канцтовары и печатная продукция",
      "Гардероб и текстиль",
      "Новинки",
      "Всё для сада и огорода"
    ],
    cardsColumn1: [
      CatalogCard(
          cardName: "Собственное производство",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffF7DFB9,
          cardColor2: 0XffFAF0DA
      ),
      CatalogCard(
          cardName: "Наши марки",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Эксклюзивный алкоголь",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffF0AEAF,
          cardColor2: 0XffF8C6CA
      ),
      CatalogCard(
          cardName: "Здоровый выбор",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffFFC498,
          cardColor2: 0XffFDDCC1
      ),
      CatalogCard(
          cardName: "Молочные продукты, сыр, яйца",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffF6E475,
          cardColor2: 0XffF9EFB0
      ),
      CatalogCard(
          cardName: "Мясо, рыба, кулинария",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Овощи, фрукты, зелень",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Хлеб, кондитерские изделия",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Бакалея",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Замороженные продукты",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Напитки",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      )
    ],
    cardsColumn2: [
      CatalogCard(
          cardName: "Алкоголь",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Косметика и гигиена",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Детские товары",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Уборка, бытовая химия",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Дом, хобби, техника",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Товары для животных",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Всё для автомобиля и дачи",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Канцтовары и печатная продукция",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Гардероб и текстиль",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Новинки",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Всё для сада и огорода",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      )
    ],
  ),
  Data(
    shopColor: Colors.blue,
    gradientColor1: Colors.blue[900],
    gradientColor2: Colors.blue[800],
    gradientColor3: Colors.blue[400],
    imageLogo: "assets/metroLogo.png",
    imageShop: "assets/metroShop.png",
    stories: [
      Story(
        "https://www.metro-cc.ru/~/media/RU-Metro/image/catalogs/2020/mm10/tiz/310x160.jpg",
        "Новое мобильное",
        "приложение",
      ),
      Story(
        "https://www.metro-cc.ru/~/media/RU-Metro/image/catalogs/2020/mm09/tiz-mp/310x160-1.jpg",
        "Проходим",
        "по ценам",
      ),
      Story(
        "https://www.metro-cc.ru/~/media/RU-Metro/image/catalogs/2020/mm09/tiz-mp/310x160-3.jpg",
        "Выгодные предложения",
        "каждый день",
      )
    ],
    categories: [
      "Продукты",
      "Электроника и техника",
      "Автотовары",
      "Бумага и бумажная продукция",
      "Всё для ремонта",
      "Игрушки",
      "Канцтовары",
      "Косметика и бытовая химия",
      "Офисный интерьер",
      "Посуда и принадлежности",
      "Профессиональное оборудование",
      "Сад и дача",
      "Спорт и отдых",
      "Товары для дома",
      "Бизнес-подарки",
      "Зоотовары",
      "Книги и хобби"
    ],
    cardsColumn1: [
      CatalogCard(
          cardName: "Продукты",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Электроника и техника",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Автотовары",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Бумага и бумажная продукция",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Всё для ремонта",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Игрушки",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Канцтовары",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Косметика и бытовая химия",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Офисный интерьер",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      )
    ],
    cardsColumn2: [
      CatalogCard(
          cardName: "Посуда и принадлежности",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Профессиональное оборудование",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Сад и дача",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Спорт и отдых",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Товары для дома",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Бизнес-подарки",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Зоотовары",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Книги и хобби",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      )
    ],
  ),
  Data(
    shopColor: Colors.red,
    gradientColor1: Colors.red[900],
    gradientColor2: Colors.red[800],
    gradientColor3: Colors.red[400],
    imageLogo: "assets/auschanLogo.png",
    imageShop: "assets/auschanShop.png",
    stories: [
      Story(
        "https://www.auchan.ru/pokupki/media/banners19/200420-chitayem_vmeste_290x322-2.jpg",
        "Читаем",
        "вместе",
      ),
      Story(
        "https://www.auchan.ru/pokupki/media/banners19/220420-Ukhod_za_volosami_290x322.jpg",
        "Уход",
        "за волосами",
      )
    ],
    categories: [
      "Продукты",
      "Игрушки",
      "Товары для дома",
      "Мебель",
      "Авто",
      "Бытовая техника",
      "Электроника",
      "Спорт и отдых",
      "Хозтовары",
      "Красота и здоровье",
      "Детям и мамам",
      "Одежда и обувь",
      "Всё для праздника",
      "Дача и сад",
      "Ремонт",
      "Багаж",
      "Зоотовары",
      "Канцтовары",
      "Другое"
    ],
    cardsColumn1: [
      CatalogCard(
          cardName: "Продукты",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Игрушки",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Товары для дома",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Мебель",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Авто",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Бытовая техника",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Электроника",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Спорт и отдых",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Хозтовары",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      )
    ],
    cardsColumn2: [
      CatalogCard(
          cardName: "Красота и здоровье",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Детям и мамам",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Одежда и обувь",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Всё для праздника",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Дача и сад",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Ремонт",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Багаж",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Зоотовары",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Другое",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      )
    ],
  ),
  Data(
    shopColor: Colors.yellow,
    gradientColor1: Colors.yellow[900],
    gradientColor2: Colors.yellow[800],
    gradientColor3: Colors.yellow[400],
    imageLogo: "assets/lentaLogo.png",
    imageShop: "assets/lentaShop.png",
    stories: [
      Story(
        "https://lenta.gcdn.co/globalassets/medoviks/okko-208.gif",
        "Okko",
        "онлайн-кинотеатр",
      ),
      Story(
        "https://lenta.gcdn.co/globalassets/medoviks/superdetstvo-208.gif",
        "Детский клуб",
        "Супердетство",
      ),
      Story(
        "https://lenta.gcdn.co/globalassets/medoviks/edadil-208.jpg",
        "Лента и",
        "Едадил",
      )
    ],
    categories: [
      "Мясо, птица, колбаса",
      "Фрукты и овощи",
      "Кондитерские изделия",
      "Чай, кофе, какао",
      "Бакалея",
      "Замороженная продукция",
      "Молоко, сыр, яйцо",
      "Рыба и морепродукты",
      "Функциональное питание",
      "Продукция собственного производства",
      "Безалкаголные напитки",
      "Алкогольные напитки",
      "Хлеб и хлебобулочные изделия",
      "Красота и здоровье",
      "Бытовая химия",
      "Спорт и активный отдых",
      "Товары для животных",
      "Лента Зоомаркет - профессиональный уход",
      "Автотовары",
      "Бытовая техника и электроника",
      "Дача, сад",
      "Товары для детей",
      "Всё для дома",
      "Посуда",
      "Одежда и обувь",
      "Канцелярия и печатная продукция",
      "Текстиль для дома"
    ],
    cardsColumn1: [
      CatalogCard(
          cardName: "Мясо, птица, колбаса",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Фрукты и овощи",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Кондитерские изделия",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Чай, кофе, какао",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Бакалея",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Замороженная продукция",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Молоко, сыр, яйцо",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Рыба и морепродукты",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Функциональное питание",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Продукция собственного производства",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Безалкагольные напитки",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Алкогольные напитки",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Хлеб и хлебобулочные изделия",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Красота и здоровье",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      )
    ],
    cardsColumn2: [
      CatalogCard(
          cardName: "Бытовая химия",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Спорт и активный отдых",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Товары для животных",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Лента Зоомаркет - профессиональный уход",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Автотовары",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Бытовая техника и электроника",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Дача, сад",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Товары для детей",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Всё для дома",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Посуда",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Одежда и обувь",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Канцелярия и печатная продукция",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      ),
      CatalogCard(
          cardName: "Текстиль для дома",
          cardImage: "assets/globusCatalog/globusPng/Собственное производство.png",
          cardColor1: 0xffC4D4A3,
          cardColor2: 0XffE0E8CF
      )
    ]
  ),
];

class Data {
  Color shopColor;
  Color gradientColor1;
  Color gradientColor2;
  Color gradientColor3;
  var imageLogo;
  var imageShop;
  List stories;
  List<String> categories;
  List<CatalogCard> cardsColumn1;
  List<CatalogCard> cardsColumn2;
  Data({
    this.shopColor,
    this.gradientColor1,
    this.gradientColor2,
    this.gradientColor3,
    this.imageLogo,
    this.imageShop,
    this.stories,
    this.categories,
    this.cardsColumn1,
    this.cardsColumn2
  });
}

class Story {
  final String image;
  final String name1;
  final String name2;
  Story(this.image, this.name1, this.name2);
}

class CatalogCard {
  var cardName;
  var cardImage;
  final int cardColor1;
  final int cardColor2;
  CatalogCard({this.cardName, this.cardImage, this.cardColor1, this.cardColor2});
}