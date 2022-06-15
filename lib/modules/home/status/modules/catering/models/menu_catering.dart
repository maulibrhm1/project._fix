part of 'catering_models.dart';

class MenuListData {
  String labelMenu;
  String menuSiang;
  String menuMalam;
  double dist;

  MenuListData({
    this.labelMenu = '',
    this.menuSiang = '',
    this.menuMalam = '',
    this.dist = 1.8,
  });

  static List<MenuListData> menuCatering = [
    MenuListData(
      labelMenu: 'Senin',
      menuSiang:
          'Siang: ayam ketumbar, tumis kacang panjang, tempe goreng, sambal, buah',
      menuMalam:
          'Malam: Pecel lele, cahkangkung, tahu, tempe, sambel lamongan, buah',
      dist: 2.0,
    ),
    MenuListData(
      labelMenu: 'Selasa',
      menuSiang:
          'Siang: ayam ketumbar, tumis kacang panjang, tempe goreng, sambal, buah',
      menuMalam: 'Malam: ayam teriaki, tumis tauge, mendoan, sambal, buah',
      dist: 2.0,
    ),
    MenuListData(
      labelMenu: 'Rabu',
      menuSiang: 'Siang: ayam keremes, sayur bayam, mendoan, sambel buah',
      menuMalam: 'Malam: telur cabe ijo, capcay, tahu, bakso, sambal, buah',
      dist: 2.0,
    ),
    MenuListData(
      labelMenu: 'Kamis',
      menuSiang:
          'Siang: samgor, ati ampela, sayur lodeh, tempe crispy, sambal, buah',
      menuMalam: 'Malam: cumi hitam, posol cabe ijo, bakwan, sambel, buah',
      dist: 2.0,
    ),
    MenuListData(
      labelMenu: "Jum'at",
      menuSiang:
          'Siang: ikan bumbu sarden, tumis sawi putih, tahu goreng, sambal, buah',
      menuMalam:
          'Malam: ayam bakar bumbu kacang, tumis buncis, tempe goreng, sambal, buah',
      dist: 2.0,
    ),
    MenuListData(labelMenu: 'Sabtu'),
  ];
}

class CheckoutListData {
  String leftText;
  String rightText;

  CheckoutListData({
    this.leftText = '',
    this.rightText = '',
  });

  static List<CheckoutListData> checkoutData = [
    CheckoutListData(
      leftText: 'Jumlah Paket',
      rightText: 'x2',
    ),
    CheckoutListData(
      leftText: 'Harga per-Paket',
      rightText: 'Rp. 140.000',
    ),
  ];
}


// class MenuCatering = {
//   String labelMenu;
//   String itemMenu;

//   MenuCatering({
//     this.labelMenu = '';
//     this.itemMenu = '';
//   });

//   static List<MenuCatering> menuCatering = []
// }
