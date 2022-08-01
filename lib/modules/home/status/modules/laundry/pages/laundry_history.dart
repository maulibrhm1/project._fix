part of "laundry.dart";

class LaundryHistory extends StatefulWidget {
  const LaundryHistory({Key? key}) : super(key: key);

  @override
  _LaundryHistoryState createState() => _LaundryHistoryState();
}

class _LaundryHistoryState extends State<LaundryHistory>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController _animationController;
  var historyList = HistoryListData.historyLaundry;
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
                          itemCount: historyList.length,
                          padding: EdgeInsets.only(top: 20),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var count = historyList.length > 10
                                ? 10
                                : historyList.length;
                            var animation = Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                            animationController.forward();
                            return HistoryListView(
                              callback: () {
                                NavigationServices(context)
                                    .gotoRoomBookingScreen(
                                        historyList[index].kodePesanan!);
                              },
                              historyData: historyList[index],
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
