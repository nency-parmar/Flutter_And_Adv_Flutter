import 'package:advance_flutter_lab/lab3/database_crud/electronics_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Import Material for better UI components

// Assuming this is in your import_export.dart or defined elsewhere
const String APPBAR_TITLE_OF_ELECTRONIC_VIEW = "Electronics Store";

class ElectronicsView extends StatefulWidget {
  const ElectronicsView({super.key});

  @override
  State<ElectronicsView> createState() => _ElectronicsViewState();
}

class _ElectronicsViewState extends State<ElectronicsView> {
  final ElectronicController _electronicController = ElectronicController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  // Helper function to show the modal for both adding and editing
  // This reduces code duplication and keeps the build method clean
  void _showFormModal({Map<String, dynamic>? existingItem}) {
    final bool isEditing = existingItem != null;

    if (isEditing) {
      // Pre-fill the text fields if we are editing
      _nameController.text = existingItem['electronic_name'];
      _priceController.text = existingItem['electronic_price'].toString();
      _urlController.text = existingItem['electronic_url'];
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Essential for keyboard handling
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          // This padding adjusts for the keyboard automatically
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  isEditing ? "Edit Device" : "Add New Device",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Device Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.devices),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _urlController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.link),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    if (_nameController.text.isNotEmpty &&
                        _priceController.text.isNotEmpty &&
                        _urlController.text.isNotEmpty) {
                      if (isEditing) {
                        // Your original edit logic
                        await _electronicController.editElec({
                          "electronic_id": existingItem['electronic_id'],
                          "electronic_name": _nameController.text,
                          "electronic_price": _priceController.text,
                          "electronic_url": _urlController.text,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Data Updated Successfully")));
                      } else {
                        // Your original add logic
                        await _electronicController.addElec({
                          'electronic_name': _nameController.text,
                          'electronic_price': _priceController.text,
                          'electronic_url': _urlController.text,
                        });
                      }
                      _nameController.clear();
                      _priceController.clear();
                      _urlController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(isEditing ? "Update Device" : "Add Device"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      // This ensures the main screen refreshes after closing the modal
      setState(() {});
      // Also clear controllers in case the modal was dismissed without saving
      _nameController.clear();
      _priceController.clear();
      _urlController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APPBAR_TITLE_OF_ELECTRONIC_VIEW),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _showFormModal(), // Call helper to add
            icon: const Icon(Icons.add_circle_outline),
            tooltip: "Add New Device",
          )
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _electronicController.selectAllElectronics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("An error occurred: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List elecs = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75, // Adjust ratio for better look
              ),
              itemCount: elecs.length,
              itemBuilder: (context, index) {
                final item = elecs[index];
                return InkWell(
                  onTap: () => _showFormModal(existingItem: item), // Call helper to edit
                  borderRadius: BorderRadius.circular(15),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip.antiAlias, // Clips the image to card's shape
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            item['electronic_url'],
                            fit: BoxFit.cover,
                            // Graceful loading and error handling for images
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image, size: 48, color: Colors.grey);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['electronic_name'].toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${item['electronic_price']}",
                                    style: TextStyle(fontSize: 15, color: Colors.green.shade700, fontWeight: FontWeight.w600),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    visualDensity: VisualDensity.compact,
                                    icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                                    onPressed: () {
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (context) => CupertinoAlertDialog(
                                          title: const Text("Delete Item"),
                                          content: const Text("Are you sure you want to delete this item? This action cannot be undone."),
                                          actions: [
                                            CupertinoDialogAction(
                                              child: const Text("Cancel"),
                                              onPressed: () => Navigator.pop(context),
                                            ),
                                            CupertinoDialogAction(
                                              isDestructiveAction: true,
                                              onPressed: () {
                                                _electronicController.deleteElec(item['electronic_id']);
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: const Text("Delete"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "No electronics found.\nTap the '+' to add one!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
        },
      ),
    );
  }
}




























// import 'package:advance_flutter_lab/lab3/database_crud/electronics_controller.dart';
// import 'package:advance_flutter_lab/utils/import_export.dart';
// import 'package:flutter/cupertino.dart';
//
// class ElectronicsView extends StatefulWidget {
//   ElectronicsView({super.key});
//
//   @override
//   State<ElectronicsView> createState() => _ElectronicsViewState();
// }
//
// class _ElectronicsViewState extends State<ElectronicsView> {
//   ElectronicController _electronicController = ElectronicController();
//
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//   TextEditingController _urlController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(APPBAR_TITLE_OF_ELECTRONIC_VIEW),
//         centerTitle: true,
//         actions: [
//           IconButton(onPressed: () {
//             showModalBottomSheet(
//               isScrollControlled: true,
//               context: context,
//                 builder: (context){
//                   return Padding(
//                     padding: const EdgeInsets.fromLTRB(8.0,30,8,8),
//                     child: Column(
//                       children: [
//                         Center(child: Text("Add Device" , style: TextStyle(fontSize: 30 ,color: Colors.black , fontWeight: FontWeight.bold),)),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: TextField(
//                             controller: _nameController,
//                           ),
//                         ),
//                         SizedBox(height: 20,),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: TextField(
//                             controller: _priceController,
//                           ),
//                         ),
//                         SizedBox(height: 50,),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: TextField(
//                             controller: _urlController,
//                           ),
//                         ),
//                         SizedBox(height: 50,),
//                         ElevatedButton(onPressed: () async {
//                           // Map<String,dynamic> map = {};
//                           // map['electronic_name'] = _nameController.text.toString();
//                           // map['electronic_price'] = _priceController.text.toString();
//                           // map['electronic_url'] = _urlController.text.toString();
//
//                          await  _electronicController.addElec({'electronic_name':_nameController.text.toString() , 'electronic_price': _priceController.text.toString() , 'electronic_url': _urlController.text.toString()});
//                           _nameController.clear();
//                           _priceController.clear();
//                           _urlController.clear();
//                           Navigator.pop(context);
//                         }, child: Text("Add Device"))
//                       ],
//                     ),
//                   );
//                 }).then((value) {
//                   setState(() {
//
//                   });
//                 },);
//           }, icon: Icon(Icons.add))
//         ],
//       ),
//       body: FutureBuilder(
//           future: _electronicController.selectAllElectronics(),
//           builder: (context, snapshot) {
//             if(snapshot.connectionState == ConnectionState.waiting){
//               return CircularProgressIndicator();
//             }
//             else if(snapshot.hasData && snapshot != null){
//               List elecs = snapshot.data!;
//               return GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         IconButton(onPressed: () {
//                           showModalBottomSheet(
//                               context: context,
//                               builder: (context){
//                                 _nameController.text = elecs[index]['electronic_name'];
//                                 _priceController.text = elecs[index]['electronic_price'];
//                                 _urlController.text = elecs[index]['electronic_url'];
//                                 return Padding(
//                                   padding: const EdgeInsets.fromLTRB(8.0,30,8,8),
//                                   child: Column(
//                                     children: [
//                                       Center(child: Text("Edit Device" , style: TextStyle(fontSize: 30 ,color: Colors.black , fontWeight: FontWeight.bold),)),
//                                       Padding(
//                                         padding: const EdgeInsets.all(16.0),
//                                         child: TextField(
//                                           controller: _nameController,
//                                         ),
//                                       ),
//                                       SizedBox(height: 20,),
//                                       Padding(
//                                         padding: const EdgeInsets.all(16.0),
//                                         child: TextField(
//                                           controller: _priceController,
//                                         ),
//                                       ),
//                                       SizedBox(height: 50,),
//                                       Padding(
//                                         padding: const EdgeInsets.all(16.0),
//                                         child: TextField(
//                                           controller: _urlController,
//                                         ),
//                                       ),
//                                       SizedBox(height: 50,),
//                                       Row(
//                                         mainAxisAlignment : MainAxisAlignment.center,
//                                         children: [
//                                           TextButton(
//                                               onPressed: () async {
//
//                                                 if (_nameController.text.isNotEmpty && _priceController.text.isNotEmpty && _urlController.text.isNotEmpty) {
//                                                   await _electronicController.editElec({"electronic_name": _nameController.text , "electronic_price": _urlController.text , "electronic_url" : _urlController.text});
//                                                   Navigator.pop(context);
//                                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Updated Successfully")));
//                                                 }
//                                               },
//                                               child: Text("EDIT" , style: TextStyle(color: Colors.black),)
//                                           ),
//                                           SizedBox(width: 30,),
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.pop(context); // Close without adding
//                                             },
//                                             child: Text("CANCEL" , style: TextStyle(color: Colors.black),),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }).then((value) {
//                                 setState(() {
//
//                                 });
//                               },);
//                         }, icon: Icon(Icons.add));
//                       },
//                       child: Card(
//                         child: Column(
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Image.network(elecs[index]['electronic_url']),
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   elecs[index]['electronic_name'].toString(),
//                                   style: TextStyle(
//                                       fontSize: 15, fontWeight: FontWeight.bold),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(Icons.price_check),
//                                     Text(
//                                       elecs[index]['electronic_price'].toString(),
//                                       style: TextStyle(fontSize: 15),
//                                     ),
//                                     SizedBox(
//                                       width: 30,
//                                     ),
//                                     IconButton(
//                                         onPressed: () {
//                                           showDialog(
//                                             context: context,
//                                             builder: (context) {
//                                               return CupertinoAlertDialog(
//                                                 title: Text("Delete Electronic Item"),
//                                                 content: Text(
//                                                     "Are you sure you want to delete this Electronic Item?"),
//                                                 actions: [
//                                                   TextButton(
//                                                       onPressed: () {
//                                                         _electronicController.deleteElec(elecs[index]['electronic_id']);
//                                                         Navigator.pop(context);
//                                                         setState(() {});
//                                                       },
//                                                       child: Text("YES")),
//                                                   TextButton(
//                                                       onPressed: () {
//                                                         Navigator.pop(context);
//                                                       },
//                                                       child: Text("NO")),
//                                                 ],
//                                               );
//                                             },
//                                           ).then((value) {
//                                             setState(() {
//
//                                             });
//                                           },);
//                                         },
//                                         icon: Icon(Icons.delete))
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 itemCount: elecs.length,
//               );
//             }
//             else{
//               return Center(child: Text("No Electronic Item Found"),);
//             }
//           },),
//     );
//   }
// }
