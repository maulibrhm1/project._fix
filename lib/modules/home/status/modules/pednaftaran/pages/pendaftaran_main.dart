part of 'pendaftaran.dart';

class PendaftaranMain extends StatefulWidget {
  const PendaftaranMain({Key? key}) : super(key: key);

  @override
  State<PendaftaranMain> createState() => _PendaftaranMainState();
}

class _PendaftaranMainState extends State<PendaftaranMain> {
  Timer? timer;
  int index = 0;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        index = 1;
      });
    });
    Timer(const Duration(seconds: 6), () {
      setState(() {
        index = 2;
      });
    });
    Timer(const Duration(seconds: 9), () {
      setState(() {
        index = 3;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status'),
        centerTitle: true,
        backgroundColor: Colors.tealAccent[700],
        // ignore: prefer_const_literals_to_create_immutables
      ),
      body: Background(
          child: ListView(
        children: [
          Column(
            children: [
              _profileWidget(user),
              _buildText('Maulana Ibrahim',
                  TextStyles(context).getBoldStyle().copyWith(fontSize: 24)),
              _buildText("Divisi: ", TextStyles(context).getRegularStyle()),
              _buildText("Programmer", TextStyles(context).getRegularStyle()),
              _buildText("Status : ",
                  TextStyles(context).getRegularStyle().copyWith(fontSize: 16)),
              _buildImage(context),
              _buildProgress(context),
              const SizedBox(height: 24),
              CommonButton(
                buttonText: "Daftar Sini",
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const FormPendaftaran()));
                },
              ),
              const SizedBox(height: 24)
            ],
          )
        ],
      )),
    );
  }

  _buildImage(BuildContext context) {
    if (index == 0) {
      return Column(
        children: [
          ClipOval(
            child: Container(
                padding: const EdgeInsets.all(14),
                child: Image.asset("assets/images/daftar.png")),
          ),
          Text(
            "Daftar dulu yuk...\nBiar bisa magang sama kita",
            style: TextStyles(context)
                .getBoldStyle()
                .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (index == 1) {
      return Column(
        children: [
          ClipOval(
            child: Container(
                padding: const EdgeInsets.all(14),
                child: Image.asset("assets/images/wait.png")),
          ),
          Text(
            "Tunggu ya...\nData kamu sedang dicek",
            style: TextStyles(context)
                .getBoldStyle()
                .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (index == 2) {
      return Column(
        children: [
          ClipOval(
            child: Container(
                padding: const EdgeInsets.all(14),
                child: Image.asset("assets/images/success.png")),
          ),
          Text(
            "Yeay !!!\nKamu sudah diterima",
            style: TextStyles(context)
                .getBoldStyle()
                .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (index == 3) {
      return Column(
        children: [
          ClipOval(
            child: Container(
                padding: const EdgeInsets.all(14),
                child: Image.asset("assets/images/failed.png")),
          ),
          Text(
            "Yah...\nKamu ditolak magang disini",
            style: TextStyles(context)
                .getBoldStyle()
                .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
  }

  _buildText(String text, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Text(text, style: style),
    );
  }

  _profileWidget(User user) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ProfileWidget(
        imagePath: user.imagePath,
        onClicked: () async {},
      ),
    );
  }

  _buildProgress(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.all(16),
          child: Stack(alignment: AlignmentDirectional.center, children: [
            Positioned(
              left: 11,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppTheme.primaryColor),
                  ),
                  index > 0
                      ? Row(
                          children: [
                            Container(
                              height: 10,
                              width: size.width * 0.3,
                              decoration:
                                  BoxDecoration(color: AppTheme.primaryColor),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppTheme.primaryColor),
                            ),
                          ],
                        )
                      : Container(),
                  index > 1
                      ? Row(
                          children: [
                            Container(
                              height: 10,
                              width: size.width * 0.3,
                              decoration:
                                  BoxDecoration(color: AppTheme.primaryColor),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppTheme.primaryColor),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppTheme.primaryColor.withOpacity(0.4)),
                ),
                Container(
                  height: 10,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.4)),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppTheme.primaryColor.withOpacity(0.4)),
                ),
                Container(
                  height: 10,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.4)),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppTheme.primaryColor.withOpacity(0.4)),
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
