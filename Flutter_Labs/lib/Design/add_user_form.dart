import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:matrimony_application/Design/utils/user.dart';
import 'package:matrimony_application/Database/user_db_helper.dart';

class AddUserForm extends StatefulWidget {
  final bool isEditing;
  final AppUser? user;

  final Map<String, dynamic>? userData;

  AddUserForm(
      {super.key, this.isEditing = false, this.user, this.userData});

  @override
  State<AddUserForm> createState() => _AddUserState();
}
// class User {
//   String name, email, city, hobbies,num;
//   int age;
//
//   User({
//     required this.name,
//     required this.email,
//     required this.age,
//     required this.city,
//     required this.hobbies,
//     required this.num,
//   });
// }

class _AddUserState extends State<AddUserForm> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  // bool _obscureConfirmPassword = true;
  List<String> _selectedHobbies = [];
  String? _gender;
  String? _selectedreligions;
  String? _selectedQualification;
  String? _selectedOccupation;
  String? _selectedCity;

  Widget _buildCheckbox(String hobby) {
    return Expanded(
      child: CheckboxListTile(
        title: Text(
          hobby,
          style: TextStyle(color: Colors.black), // Ensures text is white
        ),
        value: _selectedHobbies.contains(hobby),
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              _selectedHobbies.add(hobby);
            } else {
              _selectedHobbies.remove(hobby);
            }
          });
        },
        activeColor: Colors.grey,
        // Keeps the checkbox active color
        checkColor: Colors.white,
        // Ensures the tick mark inside the checkbox is white
        controlAffinity: ListTileControlAffinity.leading, // Adjusts alignment
      ),
    );
  }


  int _calculateAge(String dob) {
    try {
      // Ensure the date format is correct (dd/MM/yyyy)
      List<String> parts = dob.split('/');
      if (parts.length != 3) return 0; // Invalid format

      int day = int.tryParse(parts[0]) ?? 0;
      int month = int.tryParse(parts[1]) ?? 0;
      int year = int.tryParse(parts[2]) ?? 0;

      // Ensure valid date values
      if (day == 0 || month == 0 || year == 0) return 0;

      DateTime birthDate = DateTime(year, month, day);
      DateTime today = DateTime.now();

      int age = today.year - birthDate.year;

      // Adjust if birthday hasn't occurred yet this year
      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }

      return age;
    } catch (e) {
      return 0; // Return 0 if any parsing error occurs
    }
  }

  Future<void> _loadUsers() async {
    // Example: Fetch users from database if needed
    print("Loading users...");
  }


  void initState() {
    super.initState();

    // Check if editing and prefill data
    _nameController = TextEditingController(text: widget.user?.name ?? '');
    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _mobileController = TextEditingController(text: widget.user?.num ?? '');
    _dobController = TextEditingController(text: widget.user?.age != null ? widget.user!.age.toString() : '');
    _passwordController = TextEditingController(text: widget.user?.pass ?? '');

    _selectedCity = widget.user?.city;
    _gender = widget.user?.gender;
    _selectedreligions = widget.user?.religion;
    _selectedQualification = widget.user?.qualification;
    _selectedOccupation = widget.user?.occupation;
    _selectedHobbies = widget.user?.hobbies?.split(', ') ?? [];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  // Database Method to Add
  Future<void> _addUser() async {
    if (_key.currentState!.validate()) {
      AppUser newUser = AppUser(
        id: widget.user?.id,  // ✅ Keep existing user ID when updating
        name: _nameController.text,
        email: _emailController.text,
        num: _mobileController.text,
        age: _dobController.text.isNotEmpty ? int.tryParse(_dobController.text) ?? 0 : 0,
        city: _selectedCity ?? "",
        hobbies: _selectedHobbies.join(", "),
        gender: _gender ?? "",
        religion: _selectedreligions ?? "",
        qualification: _selectedQualification ?? "",
        occupation: _selectedOccupation ?? "",
        pass: _passwordController.text,
        isFavorite: widget.user?.isFavorite ?? false, // ✅ Keep favorite status
      );

      int result;
      bool isUpdating = widget.isEditing && widget.user != null;

      if (isUpdating) {
        print("Updating User: ${newUser.toMap()}");
        result = await UserDBHelper.instance.updateUser(newUser);
      } else {
        print("Adding New User: ${newUser.toMap()}");
        result = await UserDBHelper.instance.addUser(newUser);
      }

      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isUpdating ? "User Updated Successfully!" : "User Added Successfully!",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: isUpdating ? Colors.lightGreen : Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
        Navigator.pop(context, newUser); // ✅ Return updated user
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Error: Operation Failed!",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  // Database Method to Update
  Future<int> updateUser(AppUser user) async {
    final db = await UserDBHelper.instance.database;

    if (user.id == null) {
      print("Error: User ID is null. Cannot update user.");
      return 0; // Return failure
    }

    print("Updating user with ID: ${user.id}"); // Debugging

    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register User',
          style: TextStyle(
            color: Colors.white, // Ensures contrast
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // backgroundColor: Color.fromRGBO(60, 40, 31, 1), // Rich Chocolate Brown
        backgroundColor: Color(0xFF4E2A14),
        // backgroundColor: Color(0xFFFFE3E3),
        elevation: 5,
        shadowColor: Colors.black45,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Back button
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Color.fromRGBO(247, 204, 169, 1), // Light Warm Sand (Elegant & Soft)
              // color: Color(0xFFFFF8E1),
              color: Color(0xFFFFF0F5),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    // User Name
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Your Name",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(color: Colors.black),
                      textCapitalization: TextCapitalization.words,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter UserName!!!";
                        } else if (value.length < 5) {
                          return "Username Must Be of 5 Characters.";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    // Email
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Enter Your Email Address",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email address";
                        } else if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
                            .hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Mobile Number
                    TextFormField(
                      maxLength: 10,
                      controller: _mobileController,
                      decoration: InputDecoration(
                        labelText: "Mobile Number",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        // Restricts input to numbers only
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your mobile number";
                        } else if (!RegExp(r"^\d{10}$").hasMatch(value)) {
                          return "Please enter a valid 10-digit mobile number";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Date Of Birth
                    TextFormField(
                      controller: _dobController,
                      readOnly: true,
                      // Prevents manual text input
                      decoration: InputDecoration(
                        labelText: "Date of Birth",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.black),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900), // Adjust as per your needs
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate != null) {
                          // Format date as "01/03/2025"
                          String formattedDate = DateFormat("dd/MM/yyyy")
                              .format(selectedDate);
                          _dobController.text = formattedDate;
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select your date of birth";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    // City
                    DropdownButtonFormField<String>(
                      value: _selectedCity,
                      decoration: InputDecoration(
                        labelText: "City",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(color: Colors.black),
                      items: [
                        "Delhi",
                        "Mumbai",
                        "Bangalore",
                        "Morbi",
                        "Rajkot",
                        "Ahmedabad"
                      ]
                          .map((city) =>
                          DropdownMenuItem(
                            value: city,
                            child: Text(
                                city, style: TextStyle(color: Colors.black)),
                          )
                      )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCity = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select your city";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Gender
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight
                              .bold, color: Colors.black),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text("Male",
                                    style: TextStyle(color: Colors.black)),
                                value: "Male",
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value;
                                  });
                                },
                                activeColor: Color(0xFF708090),
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text("Female",
                                    style: TextStyle(color: Colors.black)),
                                value: "Female",
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value;
                                  });
                                },
                                activeColor: Color(0xFF708090),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Hobbies
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hobbies",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight
                              .bold, color: Colors.black),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                _buildCheckbox("Travelling"),
                                _buildCheckbox("Reading Novels"),
                              ],
                            ),
                            Row(
                              children: [
                                _buildCheckbox("Listening Music"),
                                _buildCheckbox("Photography"),
                              ],
                            ),
                            Row(
                              children: [
                                _buildCheckbox("Shopping"),
                                _buildCheckbox("Handicraft"),
                              ],
                            ),
                            Row(
                              children: [
                                _buildCheckbox("Writing"),
                                _buildCheckbox("Designing"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Religion
                    DropdownButtonFormField<String>(
                      value: _selectedreligions,
                      // Ensure this matches one of the items
                      decoration: InputDecoration(
                        labelText: "Religion",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(color: Colors.black),
                      items: [
                        "Hinduism",
                        "Islam (Muslim)",
                        "Christianity",
                        "Sikhism",
                        "Buddhism",
                        "Jainism",
                        "Zoroastrianism (Parsi)"
                      ]
                          .map((religion) =>
                          DropdownMenuItem(
                            value: religion,
                            child: Text(religion,
                                style: TextStyle(color: Colors.black)),
                          ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedreligions = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select your Religion";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    // Highest Qualification
                    DropdownButtonFormField<String>(
                      value: _selectedQualification,
                      // Ensure this matches one of the items
                      decoration: InputDecoration(
                        labelText: "Highest Qualification",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(color: Colors.black),
                      items: [
                        "High School",
                        "Undergraduate",
                        "Postgraduate",
                        "Doctorate",
                        "Others"
                      ]
                          .map((qualification) =>
                          DropdownMenuItem(
                            value: qualification,
                            child: Text(qualification,
                                style: TextStyle(color: Colors.black)),
                          ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedQualification = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select your Highest Qualification";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    // Occupation (Job, Business, Student, etc.)
                    DropdownButtonFormField<String>(
                      value: _selectedOccupation,
                      decoration: InputDecoration(
                        labelText: "Occupation",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(color: Colors.black),
                      items: [
                        "Job",
                        "Business",
                        "Student",
                        "Freelancer",
                        "Self-Employed",
                        "Retired",
                        "Others"
                      ].map((occupation) =>
                          DropdownMenuItem(
                            value: occupation,
                            child: Text(occupation,
                                style: TextStyle(color: Colors.black)),
                          )).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedOccupation = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select your Occupation";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    // Password
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons
                                .visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      style: TextStyle(color: Colors.black),
                      obscureText: _obscurePassword,
                      // Controlled by _obscurePassword
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters long";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Button For Submit
                    Center(
                      child: ElevatedButton(
                        onPressed: _addUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4E2A14),
                        ),
                        child: Text(widget.isEditing ? "Update" : "Submit",
                          style: TextStyle(color: Colors.white),),
                        // child: Text(
                        //   "Submit",
                        //   style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}