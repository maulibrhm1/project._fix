part of 'laundry_components.dart';

class HistoryListView extends StatelessWidget {
  final bool isShowDate;
  final VoidCallback callback;
  final HistoryListData historyData;
  final AnimationController animationController;
  final Animation<double> animation;

  const HistoryListView(
      {Key? key,
      required this.historyData,
      required this.animationController,
      required this.animation,
      required this.callback,
      this.isShowDate: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
        child: Column(
          children: <Widget>[
            CommonCard(
              color: AppTheme.primaryColor,
              radius: 16,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 8, bottom: 8, right: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      historyData.kodePesanan!,
                                      textAlign: TextAlign.left,
                                      style: TextStyles(context)
                                          .getBoldStyle()
                                          .copyWith(
                                              fontSize: 18,
                                              color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 6),
                                      child: Column(children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                historyData.tanggalLaundry!,
                                                style: TextStyles(context)
                                                    .getRegularStyle()
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
