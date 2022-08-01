part of 'catering.dart';

class CheckoutDetail extends StatefulWidget {
  final Function(CheckoutData) onChange;
  final CheckoutData checkoutData;

  const CheckoutDetail(
      {Key? key, required this.checkoutData, required this.onChange})
      : super(key: key);

  @override
  State<CheckoutDetail> createState() => _CheckoutDetailState();
}

class _CheckoutDetailState extends State<CheckoutDetail> {
  DateTime? _date;

  CheckoutData? _checkoutData;
  String leftText = '';
  String rightText = '';
  bool visible = false;
  var selected;

  List<String> metodePembayaran = ['Ovo', 'Gopay', 'Qris', 'Shopee Pay'];
  @override
  void initState() {
    _checkoutData = CheckoutData(
      widget.checkoutData.menuDays,
      widget.checkoutData.amountPrice,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          _checkoutDetail('Jumlah Paket per-Hari:', 'x2', true, false,
              _checkoutData!.menuDays, TextType.day),
          _checkoutDetail('Harga per-Paket:', 'Rp. 20.000,-', false, false,
              _checkoutData!.menuDays, TextType.day),
          _checkoutDetail('Jumlah:', 'Rp. 20.000,-', false, true,
              _checkoutData!.amountPrice, TextType.am),
          const SizedBox(
            height: 10,
          ),
          _datePicker(context),
          _paymentMethod(context),
          Row(
            children: const [Text('Notes:')],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: TextField(
              decoration: InputDecoration(
                  isDense: true,
                  hintStyle: TextStyles(context)
                      .getDescriptionStyle()
                      .copyWith(fontSize: 16),
                  hintText: 'Masukan catatan pada kami...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
    );
  }

  _paymentMethod(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Metode pembayaran',
          style: TextStyles(context).getRegularStyle().copyWith(fontSize: 16),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: DropdownButton(
            underline: const SizedBox(),
            hint: const Text('Pilih'),
            value: selected,
            icon: const Icon(Icons.keyboard_arrow_down),
            dropdownColor: Colors.grey[200],
            onChanged: (value) {
              setState(() {
                selected = value;
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

  _datePicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rentang waktu:',
          style: TextStyles(context).getRegularStyle().copyWith(fontSize: 16),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white),
          child: Text(
            _date == null
                ? 'Pilih Tanggal'
                : '${_date!.day}/${_date!.month}/${_date!.year}',
            style: TextStyles(context)
                .getRegularStyle()
                .copyWith(fontSize: 16, color: Colors.black),
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

  _checkoutDetail(
      String s1, String s2, bool v1, bool v2, int count, TextType textType) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          s1,
          style: TextStyles(context).getRegularStyle().copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: v1,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(32.0),
                    onTap: () {
                      setState(() {
                        if (textType == TextType.day) {
                          _checkoutData!.menuDays += 1;
                          _checkoutData!.amountPrice += 20000;
                        }
                      });
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 28,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ),
              ),
              Visibility(visible: v2, child: Text('Rp.')),
              Text(
                  v1
                      ? "x$count"
                      : v2
                          ? "$count"
                          : s2,
                  style: TextStyles(context)
                      .getRegularStyle()
                      .copyWith(fontSize: 16)),
              Visibility(visible: v2, child: Text(',-')),
              Visibility(
                visible: v1,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(32.0),
                    onTap: () {
                      setState(() {
                        if (textType == TextType.day) {
                          _checkoutData!.menuDays -= 1;
                          _checkoutData!.amountPrice -= 20000;
                          if (_checkoutData!.menuDays < 0) {
                            _checkoutData!.menuDays = 0;
                            _checkoutData!.amountPrice = 0;
                          }
                        }
                      });
                    },
                    child: Icon(
                      Icons.remove_circle_outline,
                      size: 28,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

enum TextType { day, am }
