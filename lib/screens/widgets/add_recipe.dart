import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipes_app/home.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:flutter/services.dart';

import 'image_picker.dart';

class AddRecipe extends StatefulWidget {
  static const String id = 'add_screen';
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final _ingredientControllers = <TextEditingController>[];
  final _titleController = TextEditingController();
  final _servingsController = TextEditingController();
  final _notesController = TextEditingController();
  File? _selectedImage;
  String title = '';
  String servings = '';
  String notes = '';
  List<String> ingredients = [];
  Recipe? recipe;

  // Future _pickImageFromGallery() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _selectedImage = File(image!.path);
  //     if (_selectedImage == null) {
  //       _selectedImage = AssetImage('assets/food_background.jpeg') as File?;
  //     }
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ingredientControllers.add(TextEditingController());
  }

  void _removeIngredient(int index) {
    setState(() {
      _ingredientControllers.removeAt(index);
    });
  }

  Future<void> _pickImage() async {
    final selectedImage =
        await ImagePickerHelper.showImagePickerDialog(context);

    if (selectedImage != null) {
      setState(() {
        _selectedImage = selectedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Recipe"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    title = _titleController.text;
                    notes = _notesController.text;
                    servings = _servingsController.text;
                    ingredients.clear();
                    for (var ingredientController in _ingredientControllers) {
                      ingredients.add(ingredientController.text.trim());
                    }
                    recipe = Recipe(
                        title: title,
                        notes: notes,
                        servings: servings,
                        ingredients: ingredients,
                        imageFile: _selectedImage);
                    _titleController.clear();
                    _notesController.clear();
                    _servingsController.clear();
                    _ingredientControllers.clear();
                    recipe?.saveRecipe();
                    print(recipe);
                  });
                  Navigator.pop(context);
                },
                icon: Icon(Icons.save),
                label: Text("Save"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: Size(10, 30),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.restaurant_menu),
                        hintText: "Recipe Title",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a recipe title!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: TextFormField(
                    controller: _servingsController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people),
                        hintText: "Number of servings",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please provide number of servings!";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _ingredientControllers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 18),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _ingredientControllers[index],
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.kitchen),
                                      hintText: "Ingredient",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please add an ingredient!";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (_ingredientControllers.length > 1) {
                                      _removeIngredient(index);
                                    }
                                  },
                                  icon: Icon(Icons.remove_circle,
                                      color: Colors.red))
                            ],
                          ));
                    }),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _ingredientControllers.add(TextEditingController());
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.black87,
                    ),
                    label: Text("Add ingredient",
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 20,
                      color: Colors.black87,
                    ),
                    label: Text(
                      "Add image",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                if (_selectedImage != null)
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.file(_selectedImage!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover),
                        IconButton(
                          icon: Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _selectedImage = null;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: TextFormField(
                    controller: _notesController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Recipe Notes',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: Icon(Icons.notes),
                    ),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
