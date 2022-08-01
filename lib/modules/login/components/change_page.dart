part of 'login_components.dart';

class ChangePage extends StatelessWidget {
  final String label;
  final String changePage;
  final Function()? onTap;
  const ChangePage(
      {Key? key, required this.label, required this.changePage, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  changePage,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
