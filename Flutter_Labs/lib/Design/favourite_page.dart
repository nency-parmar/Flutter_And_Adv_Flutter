import 'package:flutter/material.dart';
import 'package:matrimony_application/Database/user_db_helper.dart';
import 'package:matrimony_application/Design/user_details.dart';
import 'package:matrimony_application/Design/utils/user.dart';

class UserFavoritesPage extends StatefulWidget {
  @override
  _UserFavoritesPageState createState() => _UserFavoritesPageState();
}

class _UserFavoritesPageState extends State<UserFavoritesPage> {
  final dbHelper = UserDBHelper.instance; // ✅ Singleton Instance
  List<AppUser> userList = [];
  TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    List<AppUser> favoriteUsers = await dbHelper.getFavoriteUsers(); // ✅ Fetch only favorite users
    setState(() {
      userList = favoriteUsers;
    });
  }

  void toggleFavorite(int id, bool isFavorite) async {
    await dbHelper.toggleFavorite(id, isFavorite);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? "User Added to Favourite!!"
              : "User Removed from Favourite!!",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: isFavorite ? Colors.green : Colors.red, // Green for added, Red for removed
        duration: const Duration(seconds: 2),
      ),
    );
    _loadUsers(); // ✅ Refresh UI after toggling favorite
  }

  List<AppUser> get filteredFavoriteUsers {
    if (searchQuery.isEmpty) {
      return userList;
    }
    return userList.where((user) {
      return user.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          user.email.toLowerCase().contains(searchQuery.toLowerCase()) ||
          user.city.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  // void toggleFavorite(int id, bool isFavorite) async {
  //   await dbHelper.toggleFavorite(id, isFavorite);
  //   _loadUsers(); // Refresh the UI
  // }

  // void toggleFavorite(int id, bool isFavorite) async {
  //   await dbHelper.toggleFavorite(id, isFavorite);
  //   setState(() {
  //     // Find the toggled user and update its isFavorite property
  //     for (var user in userList) {
  //       if (user.id == id) {
  //         user.isFavorite = isFavorite;
  //         break;
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite Users',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFB76E79), Color(0xFFF5DEB3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 5,
        shadowColor: Colors.black45,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFFF0F5),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search Favorite Users",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (query) {
                    setState(() {
                      searchQuery = query;
                    });
                  },
                ),
              ),
              Expanded(
                child: filteredFavoriteUsers.isEmpty
                    ? const Center(
                  child: Text(
                    "No favorite users found!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
                    : ListView.builder(
                  itemCount: filteredFavoriteUsers.length,
                  itemBuilder: (context, index) {
                    var user = filteredFavoriteUsers[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      color: Colors.black26,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFF4E2A14),
                              radius: 50,
                              child: Text(
                                user.name[0],
                                style: const TextStyle(fontSize: 50, color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  user.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.location_city, color: Colors.white),
                                        const SizedBox(width: 5),
                                        Text(user.city,
                                            style: const TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_today, color: Colors.white),
                                        const SizedBox(width: 5),
                                        Text('${user.age}',
                                            style: const TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(Icons.email, color: Colors.white),
                                        const SizedBox(width: 5),
                                        Flexible(
                                          child: Text(
                                            user.email,
                                            style: const TextStyle(color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserDetails(user: user.toMap()), // Convert AppUser to Map
                                    ),
                                  );
                                },
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    user.isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: user.isFavorite ? Colors.red : Colors.white,
                                  ),
                                  onPressed: () {
                                    if (user.id == null) return;

                                    if (user.isFavorite) {
                                      // Show confirmation dialog before removing
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text("Remove from Favorites"),
                                          content: const Text("Are you sure you want to remove this user from your favorites?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context); // Close dialog
                                              },
                                              child: const Text("Cancel"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                toggleFavorite(user.id!, false); // Remove from favorites
                                                Navigator.pop(context); // Close dialog
                                              },
                                              child: const Text("Yes"),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      // Directly add to favorites
                                      toggleFavorite(user.id!, true);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}