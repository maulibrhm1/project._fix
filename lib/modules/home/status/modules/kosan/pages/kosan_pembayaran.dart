part of 'kosan.dart';

class _PembayaranPageState extends State<PembayaranPage> {
  List<String> metodePembayaran = ['Ovo', 'Gopay', 'Qris', 'Shopee Pay'];
  List<String> bulan = ['1 Bulan', '2 Bulan', '3 Bulan', '4 Bulan'];
  List<String> tipe = ["Lunas", "DP"];
  int index = 0;
  var selectedPayment;
  var selectedBulan;
  var selectedTipe;
  DateTime? _date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title: const Text("Pembayaran"),
        ),
        body: Background(
            child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 42),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRow(left: "Nama Kosan", right: "Kosa Arifin"),
                      _buildRow(left: "1 Orang 1 Kamar", right: "Rp. 400.000"),
                      _buildRow(left: "Durasi Tanggal", right: ""),
                      _tanggalMulai(context),
                      _bulan(),
                      _paymentMethod(context),
                      _tipePembayaran(),
                      _buildRow(
                          left: "Total",
                          right: selectedBulan == "1 Bulan"
                              ? "Rp. 400.000,-"
                              : selectedBulan == "2 Bulan"
                                  ? "Rp. 800.000,-"
                                  : selectedBulan == "3 Bulan"
                                      ? "Rp. 1.200.000,-"
                                      : selectedBulan == "4 Bulan"
                                          ? "Rp. 1.600.000-,"
                                          : "Rp. ,-"),
                      const SizedBox(height: 16),
                      CommonButton(buttonText: "Bayar", onTap: () {})
                    ],
                  ),
                ),
              ]),
            ),
          ],
        )));
  }

  _tanggalMulai(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Mulai",
          style: TextStyles(context).getRegularStyle(),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.orange[300]),
          child: Row(
            children: [
              Text(
                _date == null
                    ? 'Pilih Tanggal'
                    : '${_date!.day}/${_date!.month}/${_date!.year}',
                style: TextStyles(context)
                    .getRegularStyle()
                    .copyWith(fontSize: 16, color: Colors.black),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              )
            ],
          ),
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: _date ?? DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2050))
                .then((value) {
              setState(() {
                _date = value;
              });
            });
          },
        )
      ],
    );
  }

  _buildRow({String? left, String? right}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left!,
          style: TextStyles(context)
              .getRegularStyle()
              .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          right!,
          style: TextStyles(context)
              .getRegularStyle()
              .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  _bulan() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Bulan',
          style: TextStyles(context).getRegularStyle().copyWith(fontSize: 16),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.orange[300],
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButton(
            underline: const SizedBox(),
            hint: const Text('Pilih...'),
            value: selectedBulan,
            icon: const Icon(Icons.keyboard_arrow_down),
            dropdownColor: Colors.grey[200],
            onChanged: (value) {
              setState(() {
                selectedBulan = value;
              });
            },
            items: bulan
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            style: TextStyles(context).getRegularStyle().copyWith(fontSize: 16),
          ),
        )
      ],
    );
  }

  _tipePembayaran() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tipe Pembayaran',
          style: TextStyles(context)
              .getRegularStyle()
              .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.orange[300],
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButton(
            underline: const SizedBox(),
            hint: const Text('Pilih...'),
            value: selectedTipe,
            icon: const Icon(Icons.keyboard_arrow_down),
            dropdownColor: Colors.grey[200],
            onChanged: (value) {
              setState(() {
                selectedTipe = value;
              });
            },
            items: tipe
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            style: TextStyles(context).getRegularStyle().copyWith(fontSize: 16),
          ),
        )
      ],
    );
  }

  _paymentMethod(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Metode pembayaran',
          style: TextStyles(context)
              .getRegularStyle()
              .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.orange[300],
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButton(
            underline: const SizedBox(),
            hint: const Text('Pilih...'),
            value: selectedPayment,
            icon: const Icon(Icons.keyboard_arrow_down),
            dropdownColor: Colors.grey[200],
            onChanged: (value) {
              setState(() {
                selectedPayment = value;
              });
            },
            items: metodePembayaran
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            style: TextStyles(context).getRegularStyle().copyWith(fontSize: 16),
          ),
        )
      ],
    );
  }
}
