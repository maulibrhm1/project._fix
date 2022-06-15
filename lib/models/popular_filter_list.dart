class PopularFilterListData {
  String titleTxt;
  bool isSelected;

  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  static List<PopularFilterListData> popularFList = [
    PopularFilterListData(
      titleTxt: 'ac',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'bed',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'parking',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'wifi',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'desk',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'electricity',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'all_text',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'apartment',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Home_text',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'villa_data',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'hotel_data',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Resort_data',
      isSelected: false,
    ),
  ];
}
