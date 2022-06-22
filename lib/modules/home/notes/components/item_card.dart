part of "notes_components.dart";

class ItemCard extends StatelessWidget {
  final String? kegiatan;
  final String? date;
  final String? startTime;
  final String? endTime;
  final int? color;
  ActivityModel navigate;
  //// Pointer to Update Function
  final Function()? onUpdate;
  //// Pointer to Delete Function
  final Function()? onDelete;

  ItemCard(this.navigate,
      {Key? key,
      this.onUpdate,
      this.onDelete,
      this.color,
      this.kegiatan,
      this.date,
      this.startTime,
      this.endTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: color == 0
            ? AppTheme.primaryColor
            : color == 1
                ? Colors.amber
                : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date!,
                style: TextStyles(context)
                    .getDescriptionStyle()
                    .copyWith(color: Colors.white),
              ),
              Text(
                "Jam kerja: $startTime - $endTime",
                style: TextStyles(context)
                    .getDescriptionStyle()
                    .copyWith(color: Colors.white),
              ),
              Text(
                "Kegiatan: ",
                style: TextStyles(context)
                    .getTitleStyle()
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size.width * 0.822,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Text(
                  kegiatan!,
                  style: TextStyles(context)
                      .getRegularStyle()
                      .copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size.width * 0.822,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _iconButton(Icons.edit,
                        color == 1 ? AppTheme.primaryColor : Colors.amber,
                        onTap: () {
                      Get.to(AddActivityPage(
                        activity: navigate,
                        onUpdate: onUpdate,
                        addController: false,
                        updateController: true,
                      ));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    _iconButton(CupertinoIcons.trash, Colors.red, onTap: () {
                      return _showBottomSheet(context, size);
                    })
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _showBottomSheet(BuildContext context, Size size) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference activities = firestore.collection('activity');
    return Get.bottomSheet(
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ensureDelete(context, "Hapus", Colors.red, onTap: onDelete),
              _ensureDelete(context, "Batal", Colors.blue.shade600, onTap: () {
                Get.back();
              })
            ],
          ),
        ),
        isDismissible: false);
    // isDismissible: true,
    // shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(14), topRight: Radius.circular(14))),
    // context: context,
    // builder: (context) {
    // return Container(
    //   padding: const EdgeInsets.symmetric(vertical: 20),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       _ensureDelete(context, "Hapus", Colors.red, onTap: onDelete),
    //       _ensureDelete(context, "Batal", Colors.blue.shade600)
    //     ],
    //   ),
    // );
  }

  _ensureDelete(BuildContext context, String text, Color color,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 140,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: TextStyles(context)
              .getRegularStyle()
              .copyWith(color: Colors.white),
        )),
      ),
    );
  }

  _iconButton(IconData icon, Color color, {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: color),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
