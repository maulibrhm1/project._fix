class User {
  final String imagePath;
  final String name;
  final String email;
  final String divisi;
  final String labelSuccess;

  const User({
    required this.labelSuccess,
    required this.imagePath,
    required this.name,
    required this.email,
    required this.divisi,
  });
}

class UserPreferences {
  static const myUser = User(
      imagePath: 'assets/images/PP.png',
      name: "Maulana Ibrahim",
      email: "mau28lana@gmail.com",
      divisi: "Programmer",
      labelSuccess: 'Selamat kamu diterima !');
}
