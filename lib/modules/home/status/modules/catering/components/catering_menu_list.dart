part of 'catering.dart';

class CateringMenuList extends StatelessWidget {
  final MenuListData menuData;
  const CateringMenuList({Key? key, required this.menuData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Menu Catering',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Expanded(
                              child: Container(
                                  width: size.width * 0.7,
                                  child: ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Text(menuData.labelMenu);
                                    },
                                  ))),
                        )
                        // menuLabel(
                        //   text: 'Senin',
                        // ),
                        // menuItem(
                        //   text1:
                        //       'Siang: ayam ketumbar, tumis kacang panjang, tempe goreng, sambal, buah',
                        //   text2:
                        //       'Malam: Pecel lele, cahkangkung, tahu, tempe, sambel lamongan, buah',
                        // ),
                        // menuLabel(text: 'Selasa'),
                        // menuItem(
                        //     text1:
                        //         'Siang: ayam ketumbar, tumis kacang panjang, tempe goreng, sambal, buah',
                        //     text2:
                        //         'Malam: ayam teriaki, tumis tauge, mendoan, sambal, buah'),
                        // menuLabel(text: 'Rabu'),
                        // menuItem(
                        //     text1:
                        //         'Siang: ayam keremes, sayur bayam, mendoan, sambel buah',
                        //     text2:
                        //         'Malam: telur cabe ijo, capcay, tahu, bakso, sambal, buah'),
                        // menuLabel(text: 'Kamis'),
                        // menuItem(
                        //     text1:
                        //         'Siang: samgor, ati ampela, sayur lodeh, tempe crispy, sambal, buah',
                        //     text2:
                        //         'Malam: cumi hitam, posol cabe ijo, bakwan, sambel, buah'),
                        // menuLabel(text: "Jum'at"),
                        // menuItem(
                        //     text1:
                        //         'Siang: ikan bumbu sarden, tumis sawi putih, tahu goreng, sambal, buah',
                        //     text2:
                        //         'Malam: ayam bakar bumbu kacang, tumis buncis, tempe goreng, sambal, buah'),
                        // menuLabel(text: 'Sabtu'),
                        // menuItem(text1: '', text2: '')
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
