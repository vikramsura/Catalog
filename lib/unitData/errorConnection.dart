import 'package:digicat/all.dart';
import 'package:lottie/lottie.dart';

errorConnection(context, lottieTitle) {
  Widget okButton = GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text("OK",
            style: const TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ),
  );
  Dialog alert = Dialog(
    backgroundColor: Colors.transparent,
    // contentPadding: EdgeInsets.zero,
    insetPadding: EdgeInsets.zero,
    child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Lottie.asset(
                lottieTitle,
                repeat: true,
                fit: BoxFit.fill,
              ),
            ),
            // Center(child: Text("No Internet")),
            okButton
          ],
        )),
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
