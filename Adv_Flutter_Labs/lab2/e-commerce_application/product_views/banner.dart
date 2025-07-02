import 'package:advance_flutter_lab/utils/import_export.dart';

class BannerClass extends StatelessWidget {
  const BannerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Deals of the Day\nUp to 50% OFF!',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
