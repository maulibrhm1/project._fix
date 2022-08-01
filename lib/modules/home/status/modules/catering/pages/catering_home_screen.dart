// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

part of 'catering.dart';

class CateringHomeScreen extends StatefulWidget {
  const CateringHomeScreen({Key? key}) : super(key: key);

  @override
  State<CateringHomeScreen> createState() => _CateringHomeScreenState();
}

class _CateringHomeScreenState extends State<CateringHomeScreen> {
  StatusData _statusData = StatusData('Alamat Pengiriman', '', 'Durasi', '');

  var menuCatering = MenuListData.menuCatering;
  CheckoutData _checkoutData = CheckoutData(1, 20000);
  String leftText = '';
  String rightText = '';
  bool visible = false;
  ScrollController scrollController = new ScrollController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.primaryColor, actions: [
        Container(
            margin: EdgeInsets.only(right: 14),
            child: menuButton(
                onClicked: () =>
                    NavigationServices(context).gotoCateringMenu()))
      ]),
      body: Background(
          child: SizedBox(
        width: size.width,
        child: Container(
          margin: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Text(
                'Catering',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 10),
              Text(DateFormat.yMd().format(DateTime.now()),
                  style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 10,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () => showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                    enableDrag: false,
                    context: context,
                    builder: (index) {
                      return _orderDetail();
                    }),
                child: Container(
                    padding: EdgeInsets.all(40),
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Column(children: [
                      Icon(
                        Icons.touch_app,
                        color: Colors.white,
                        size: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Catering yuk',
                          style: TextStyles(context)
                              .getBoldStyle()
                              .copyWith(color: Colors.white, fontSize: 18))
                    ]),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.white, Colors.orange.shade500]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(5, 15),
                          )
                        ])),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Alamat Pengantaran:'),
              SizedBox(
                height: 40,
              ),
              CommonButton(
                buttonText: 'Status',
                textColor: Colors.black,
                onTap: () => showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                    enableDrag: false,
                    context: context,
                    builder: (index) {
                      return Scaffold(
                        appBar: AppBar(
                          leading: IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          title: Text(
                            'Order Detail',
                            style: TextStyles(context)
                                .getBoldStyle()
                                .copyWith(fontSize: 26),
                          ),
                          backgroundColor: Colors.white,
                          elevation: 0,
                        ),
                        body: Padding(
                            padding: EdgeInsets.all(14),
                            child: StatusDetail(
                              statusData: _statusData,
                            )),
                      );
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }

  menuButton({required VoidCallback onClicked}) => InkWell(
        onTap: onClicked,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu_book,
              size: 30,
            ),
            Text(
              'Menu',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      );

  _orderDetail() {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Order Detail',
          style: TextStyles(context).getBoldStyle().copyWith(fontSize: 26),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: CheckoutDetail(
                  checkoutData: _checkoutData,
                  onChange: (data) {
                    setState(() {
                      _checkoutData = data;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
