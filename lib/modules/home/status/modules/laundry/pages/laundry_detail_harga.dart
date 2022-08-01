part of 'laundry.dart';

class LaundryDetailHarga extends StatefulWidget {
  const LaundryDetailHarga({Key? key}) : super(key: key);

  @override
  State<LaundryDetailHarga> createState() => _LaundryDetailHargaState();
}

class _LaundryDetailHargaState extends State<LaundryDetailHarga> {
  bool pembayaranSukses = false;
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
                  SizedBox(
                    height: size.height * 0.2,
                    width: size.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRow(context, left: "List Detail", right: ""),
                        _buildRow(context, left: "Baju:", right: "5 pcs"),
                        _buildRow(context, left: "Celana:", right: "3 pcs"),
                        _buildRow(context, left: "Berat:", right: "3 kg"),
                        _buildRow(context,
                            left: "Subtotal:", right: "Rp. 15.000"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRow(context, left: "List Detail", right: ""),
                        _buildRow(context,
                            left: "Tambahan:", right: "Rp. 15.000"),
                        _buildRow(context,
                            left: "Boneka:", right: "Rp. 15.000"),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: size.width * 0.7,
                      child: _buildRow(context,
                          left: "Total", right: "Rp. 45.000")),
                  SizedBox(
                    width: size.width * 0.7,
                    child: Column(
                      children: [
                        _buildRow(context,
                            left: "Metode Pembayaran", right: ""),
                        const SizedBox(height: 10),
                        _buildRow(context,
                            left: "Saldo Akun", right: "Di potong-Rp. 45.000"),
                      ],
                    ),
                  ),
                  CommonButton(
                      width: 100,
                      buttonText: "Harga",
                      onTap: () {
                        pembayaranSukses
                            ? pembayaranSukses = false
                            : pembayaranSukses = true;
                        print(pembayaranSukses);
                        showModalBottomSheet(
                            context: context,
                            builder: (index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 32),
                                height: size.height * 0.5,
                                child: Column(children: [
                                  pembayaranSukses
                                      ? Image.asset("assets/images/success.png")
                                      : Image.asset("assets/images/failed.png"),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    width: size.width * 0.5,
                                    child: Text(
                                      pembayaranSukses
                                          ? "Yeay !\nKamu telah berhasil Membayar Laundry\nLaundry kamu akan segera kami antar"
                                          : "Yah...\nKamu tidak berhasil membayar laundry",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ]),
                              );
                            });
                      })
                ],
              ))
        ],
      )),
    );
  }

  Row _buildRow(BuildContext context, {String? left, String? right}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left!,
            style: TextStyles(context)
                .getRegularStyle()
                .copyWith(fontWeight: FontWeight.w600)),
        Text(right!,
            style: TextStyles(context)
                .getRegularStyle()
                .copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
