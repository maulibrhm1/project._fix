part of 'catering.dart';

class CateringMenu extends StatefulWidget {
  @override
  _CateringMenuState createState() => _CateringMenuState();
}

class _CateringMenuState extends State<CateringMenu>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController _animationController;
  var menuList = MenuListData.menuCatering;
  ScrollController scrollController = new ScrollController();

  final searchBarHieght = 158.0;
  final filterBarHieght = 52.0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _animationController =
        AnimationController(duration: Duration(milliseconds: 0), vsync: this);
    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        _animationController.animateTo(0.0);
      } else if (scrollController.offset > 0.0 &&
          scrollController.offset < searchBarHieght) {
        // we need around searchBarHieght scrolling values in 0.0 to 1.0
        _animationController
            .animateTo((scrollController.offset / searchBarHieght));
      } else {
        _animationController.animateTo(1.0);
      }
    });
    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.primaryColor),
      body: Stack(
        children: <Widget>[
          RemoveFocuse(
            onClick: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: AppTheme.scaffoldBackgroundColor,
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: menuList.length,
                          padding: EdgeInsets.only(top: 20),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var count =
                                menuList.length > 10 ? 10 : menuList.length;
                            var animation = Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                            animationController.forward();
                            return MenuListView(
                              callback: () {
                                NavigationServices(context)
                                    .gotoRoomBookingScreen(
                                        menuList[index].labelMenu);
                              },
                              menuData: menuList[index],
                              animation: animation,
                              animationController: animationController,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
