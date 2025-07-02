import 'package:advance_flutter_lab/lab2/favourite_unfav/fav_unfav_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';

class FavUnfavView extends StatefulWidget {
  const FavUnfavView({super.key});

  @override
  State<FavUnfavView> createState() => _FavUnfavViewState();
}

class _FavUnfavViewState extends State<FavUnfavView> {
  FavUnfavController _favUnfavController = FavUnfavController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(APPBAR_TITLE_OF_FAV_UNFAV_VIEW),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          dynamic student = _favUnfavController.getStudent()[index];
          return Card(
            child: ListTile(
              title: Text(student[USERNAME].toString()),
              subtitle: Row(
                children: [
                  Text(student[AGE].toString()),
                  SizedBox(
                    width: 10,
                  ),
                  Text(student[GRADUATIONYEAR].toString())
                ],
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _favUnfavController.toggleFavorite(student);
                    });
                  },
                  icon: _favUnfavController.isFavoriteListContainsProduct(student)
                      ? Icon(Icons.favorite , color: Colors.red,)
                      : Icon(Icons.favorite_outline, color: Colors.red)
              ),
            ),
          );
        },
        itemCount: _favUnfavController.getStudent().length,
      ),
    );
  }
}
