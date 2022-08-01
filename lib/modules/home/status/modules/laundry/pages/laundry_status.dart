part of 'laundry.dart';

class LaundryStatus extends StatelessWidget {
  const LaundryStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text("Status Laundry"),
      ),
      body: Background(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 52, horizontal: 12),
              height: size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Alamat Pengantaran:',
                    style: TextStyles(context)
                        .getTitleStyle()
                        .copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    width: size.width * 0.7,
                    child: const Text(
                        "Jembatan Janti, Gg. Arjuna No.59, Jaranan, Karangjambe, Banguntapan, Bantul Regency, Special Region of Yogyakarta 55198",
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: size.height * 0.3,
                    child: Stack(children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: size.width * 0.5,
                              child: const Text(
                                "Pesanan diterima dengan kode pemesanan #1234567 atas nama Randy",
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 14,
                        left: 5,
                        child: Container(
                          height: 100,
                          width: 10,
                          decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: AppTheme.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                width: size.width * 0.5,
                                child: const Text(
                                  "Kurir telah mengambil pakaian yang diminta untuk laundry",
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 104,
                        left: 5,
                        child: Container(
                          height: 100,
                          width: 10,
                          decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: AppTheme.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                width: size.width * 0.5,
                                child: const Text(
                                  "Laundry sudah selesai dan harga detail bisa dilihat disini",
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  CommonButton(
                      width: 100,
                      buttonText: "Harga",
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => LaundryDetailHarga()));
                      })
                ],
              ))
        ],
      )),
    );
  }
}
