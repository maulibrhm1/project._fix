part of 'splash.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  var pageController = PageController(initialPage: 0);
  List<PageViewData> pageViewModelData = [];

  late Timer sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    pageViewModelData.add(PageViewData(
      titleText: 'Seven Inc.',
      subText:
          'Seven Inc membuka kesempatan buat Kamu yang ingin menjajal pengalaman kerja di bisnis yang dijalankan Seven Inc',
      assetsImage: Localfiles.introduction1,
    ));

    pageViewModelData.add(PageViewData(
      titleText: 'Magangjogja.com',
      subText:
          'Kamu siswa smk atau mahasiswa? Cari tempat PKL, Magang, PRAKERIN, OJT, atau Praktik Kerja?'
          'Ayo gabung bersama kami!',
      assetsImage: Localfiles.introduction2,
    ));

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(0,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sliderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              pageSnapping: true,
              onPageChanged: (index) {
                currentShowIndex = index;
              },
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                PagePopup(imageData: pageViewModelData[0]),
                PagePopup(imageData: pageViewModelData[1]),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: pageController, // PageController
            count: 2,
            effect: WormEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Theme.of(context).dividerColor,
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 5.0),
          ),
          CommonButton(
            padding:
                const EdgeInsets.only(left: 48, right: 48, bottom: 8, top: 32),
            buttonText: "Login",
            onTap: () {
              Get.to(LoginScreen());
            },
          ),
          CommonButton(
            padding:
                const EdgeInsets.only(left: 48, right: 48, bottom: 32, top: 8),
            buttonText: AppLocalizations(context).of("create_account"),
            backgroundColor: AppTheme.backgroundColor,
            textColor: AppTheme.primaryTextColor,
            onTap: () {
              Get.to(const SignUpScreen());
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
