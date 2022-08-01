part of 'kosan.dart';

class KosanPage extends StatefulWidget {
  const KosanPage({Key? key}) : super(key: key);

  @override
  State<KosanPage> createState() => _KosanPageState();
}

class _KosanPageState extends State<KosanPage> {
  var button = true;
  var changeColor1 = true;
  var changeColor2 = true;
  var changeColor3 = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.primaryColor),
      body: Background(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
            child: Column(
              children: [
                Text(
                  "Kosan",
                  style: TextStyles(context)
                      .getTitleStyle()
                      .copyWith(fontSize: 38),
                ),
                const SizedBox(height: 48),
                Text("Pilihan Kosan",
                    style: TextStyles(context)
                        .getRegularStyle()
                        .copyWith(fontSize: 24)),
                const SizedBox(height: 24),
                _pilihanKosan("1 orang 1 kamar", onTap: () {
                  setState(() {
                    if (changeColor1 == true) {
                      changeColor1 = false;
                      button = false;
                    } else {
                      changeColor1 = true;
                      button = true;
                    }
                  });
                },
                    color: changeColor1 == true
                        ? Colors.white
                        : AppTheme.primaryColor),
                _pilihanKosan("2 orang 1 kamar", onTap: () {
                  setState(() {
                    if (changeColor2 == true) {
                      changeColor2 = false;
                      button = false;
                    } else {
                      changeColor2 = true;
                      button = true;
                    }
                  });
                },
                    color: changeColor2 == true
                        ? Colors.white
                        : AppTheme.primaryColor),
                _pilihanKosan("3 orang 1 kamar", onTap: () {
                  setState(() {
                    if (changeColor3 == true) {
                      changeColor3 = false;
                      button = false;
                    } else {
                      changeColor3 = true;
                      button = true;
                    }
                  });
                },
                    color: changeColor3 == true
                        ? Colors.white
                        : AppTheme.primaryColor),
                const SizedBox(height: 24),
                Visibility(
                  visible: button,
                  child: CommonButton(
                    buttonText: "Pembayaran",
                    backgroundColor: changeColor1 ? Colors.grey[300] : null,
                  ),
                ),
                _buttonPembayaran(!changeColor1, "Pembayaran",
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const PembayaranPage()))),
                _buttonPembayaran(!changeColor2, "Pembayaran",
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const PembayaranPage()))),
                _buttonPembayaran(!changeColor3, "Pembayaran",
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const PembayaranPage()))),
                const SizedBox(height: 24),
                CommonButton(
                  buttonText: "Status",
                  backgroundColor: Colors.grey[300],
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  _buttonPembayaran(bool visible, String text, {Function()? onTap}) {
    return Visibility(
      visible: visible,
      child: CommonButton(
        onTap: onTap,
        buttonText: text,
      ),
    );
  }

  _pilihanKosan(String s, {Function()? onTap, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 18),
          decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10)),
          child: Text(s,
              style: TextStyles(context)
                  .getRegularStyle()
                  .copyWith(fontSize: 14, color: color)),
        ),
      ),
    );
  }
}

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key? key}) : super(key: key);

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}
