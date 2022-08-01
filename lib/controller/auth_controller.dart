import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hotel_booking_ui/common/common.dart';
import 'package:flutter_hotel_booking_ui/modules/bottom_tab/bottom_tab_screen.dart';
import 'package:flutter_hotel_booking_ui/routes/routes.dart';
import 'package:flutter_hotel_booking_ui/services/firestore_services.dart';
import 'package:flutter_hotel_booking_ui/utils/snack_bar.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get stramAuthStatus => auth.authStateChanges();

  void signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed("/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        navigatorKey.currentState!.popUntil((route) => route.isCurrent);
        Utils.showSnackBar(e.message);
        print("No user found for that email.");
      } else if (e.code == "wrong-password") {
        navigatorKey.currentState!.popUntil((route) => route.isCurrent);
        Utils.showSnackBar(e.message);
        print("Wrong password");
      } else {
        Get.to(() => const BottomTabScreen(registered: false));
        print("Login Success");
      }
    }
  }

  void signUp(String email, String password, String fname, String uname,
      String _emailController, String _passwordController) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user!;

      await FirestoreService(uid: user.uid)
          .updateUserData(fname, uname, _emailController, _passwordController);
      Get.offAllNamed("/verifyemail");
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isCurrent);
  }

  void forgetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Utils.showSnackBar("Password Reset Email Sent");
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  void signout() async {
    await auth.signOut();
    Get.offAllNamed(RoutesName.main);
  }
}
