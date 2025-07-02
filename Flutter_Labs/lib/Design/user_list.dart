import 'package:flutter/material.dart';
import 'package:matrimony_application/Design/add_user_form.dart';
import 'package:matrimony_application/Design/user_details.dart';
import 'package:matrimony_application/Design/utils/user.dart';
import 'package:matrimony_application/Database/user_db_helper.dart' as db_helper;

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  db_helper.UserDBHelper dbHelper = db_helper.UserDBHelper.instance; // ✅ Singleton Fix
  List<AppUser> userList = []; // ✅ Changed from `User` to `AppUser`

  TextEditingController _searchController = TextEditingController();
  String searchQuery = "";
  bool isReversed = false;
  bool isSortedAZ = false;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  // Future<void> _loadUsers() async {
  //   List<AppUser> users = await dbHelper.getUsers(); // ✅ Changed `User` to `AppUser`
  //   setState(() {
  //     userList = users; // ✅ Fixed `_users` issue
  //   });
  // }

  Future<void> _loadUsers() async {
    List<AppUser> users = await dbHelper.getUsers();
    setState(() {
      userList = users;
      _applySorting();
    });
  }

  List<Map<String, dynamic>> get filteredUsers {
    if (searchQuery.isEmpty) {
      return userList.map((user) => user.toMap()).toList();
    }
    return userList
        .map((user) => user.toMap())
        .where((user) =>
    user['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
        user['email'].toLowerCase().contains(searchQuery.toLowerCase()) ||
        user['city'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  void addUser() async {
    final newUser = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AddUserForm(isEditing: false)),
    );
    if (newUser != null) {
      _loadUsers();
    }
  }

  void toggleFavorite(int id, bool isFavorite) async {
    await dbHelper.toggleFavorite(id, isFavorite);

    // Show the correct message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? "User Added to Favourite!!"
              : "User Removed from Favourite!!",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: isFavorite ? Colors.green : Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );

    _loadUsers(); // Refresh UI
  }


  void _confirmDelete(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete User"),
          content: Text("Are you sure you want to delete this user?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Delete", style: TextStyle(color: Colors.red)),
              onPressed: () async {
                await dbHelper.deleteUser(id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "User Deleted Successfully!!",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.green, // Customize the color
                    duration: Duration(seconds: 2), // Message will disappear after 2 seconds
                  ),
                );
                _loadUsers();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _applySorting() {
    if (isSortedAZ) {
      userList.sort((a, b) => a.name.compareTo(b.name));
    } else {
      userList.sort((a, b) => b.name.compareTo(a.name));
    }

    if (isReversed) {
      userList = userList.reversed.toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User List',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                if (value == 'Reverse') {
                  isReversed = !isReversed;
                } else if (value == 'A-Z') {
                  isSortedAZ = true;
                } else if (value == 'Z-A') {
                  isSortedAZ = false;
                }
                _applySorting();
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'Reverse', child: Text(isReversed ? 'Normal Order' : 'Reverse Order')),
              PopupMenuItem(value: 'A-Z', child: Text('Sort A-Z')),
              PopupMenuItem(value: 'Z-A', child: Text('Sort Z-A')),
            ],
          ),
        ],
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFB76E79), Color(0xFFF5DEB3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ), // Deep Coffee Brown
        elevation: 5,
        shadowColor: Colors.black45,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFF0F5), // Light Pinkish Background
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search Users",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onChanged: (query) {
                      setState(() {
                        searchQuery = query;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: filteredUsers.isEmpty
                      ? Center(
                    child: Text(
                      "No Users Found",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  )
                      : ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      var userData = filteredUsers[index];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetails(user: userData),
                            ),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.all(8),
                          color: Colors.black26,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFF4E2A14),
                                  radius: 50,
                                  child: Text(
                                    userData['name'][0],
                                    style: TextStyle(fontSize: 50, color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${userData['name']}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(Icons.location_city, color: Colors.white),
                                          SizedBox(width: 5),
                                          Text('${userData['city']}',
                                              style: TextStyle(color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_month_outlined, color: Colors.white),
                                          SizedBox(width: 5),
                                          Text('${userData['age']}',
                                              style: TextStyle(color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(Icons.email, color: Colors.white),
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Text(
                                              '${userData['email']}',
                                              style: TextStyle(color: Colors.white),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit, color: Colors.blue),
                                      onPressed: () {
                                        debugPrint("UserData: $userData");

                                        if (userData == null) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Error: User data is missing!",
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                              backgroundColor: Colors.red,
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                          return;
                                        }

                                        // Convert userData to AppUser
                                        final AppUser user = AppUser(
                                          id: userData['id'] ?? 0,
                                          name: userData['name'] ?? '',
                                          email: userData['email'] ?? '',
                                          num: userData['num'] ?? '',
                                          age: userData['age'] ?? 0,
                                          city: userData['city'] ?? '',
                                          hobbies: userData['hobbies'] ?? '',
                                          gender: userData['gender'] ?? '',
                                          religion: userData['religion'] ?? '',
                                          qualification: userData['qualification'] ?? '',
                                          occupation: userData['occupation'] ?? '',
                                          pass: userData['pass'] ?? '',
                                          isFavorite: (userData['isFavorite'] ?? false) == 1,
                                        );

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddUserForm(
                                              isEditing: true,
                                              user: user,
                                            ),
                                          ),
                                        ).then((_) {
                                          _loadUsers(); // ✅ Refresh after returning
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        userData["isFavorite"] == 1 ? Icons.favorite : Icons.favorite_border,
                                        color: userData["isFavorite"] == 1 ? Colors.red : Colors.white,
                                      ),
                                      onPressed: () async {
                                        bool isAddingToFavorite = userData["isFavorite"] != 1; // Determine action

                                        await dbHelper.toggleFavorite(userData['id'], isAddingToFavorite); // Toggle favorite

                                        setState(() {
                                          _loadUsers(); // ✅ Reload users list
                                        });

                                        // Show SnackBar message after toggling favorite
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              isAddingToFavorite
                                                  ? "User Added to Favourite!!"
                                                  : "User Removed from Favourite!!",
                                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                            backgroundColor: isAddingToFavorite ? Colors.green : Colors.red, // Green for add, Red for remove
                                            duration: const Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete, color: Colors.red),
                                      onPressed: () => _confirmDelete(context, userData['id']),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}