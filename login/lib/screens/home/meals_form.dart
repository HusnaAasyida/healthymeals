import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/api/meals_api.dart';
import 'package:login/models/meals.dart';
import 'package:flutter/material.dart';
import 'package:login/notifier/meals_notifier.dart';
import 'package:provider/provider.dart';

class MealsForm extends StatefulWidget {
  final bool isUpdating;

  MealsForm({@required this.isUpdating});

  @override
  _MealsFormState createState() => _MealsFormState();
}

class _MealsFormState extends State<MealsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Meals _currentMeals;
  String _imageUrl;
  File _imageFile;
  List _ingredients = [];
  List _directions = [];
  TextEditingController ingredientController = new TextEditingController();
  TextEditingController directionsController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    MealsNotifier mealsNotifier =
        Provider.of<MealsNotifier>(context, listen: false);

    if (mealsNotifier.currentMeals != null) {
      _currentMeals = mealsNotifier.currentMeals;
    } else {
      _currentMeals = Meals();
    }
    _ingredients.addAll(_currentMeals.ingredients);
    _imageUrl = _currentMeals.image;
  }

  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return Text("image placeholder");
    } else if (_imageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    } else if (_imageUrl != null) {
      print('showing image from url');

      return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Image.network(
              _imageUrl,
              fit: BoxFit.cover,
              height: 250,
            ),
            FlatButton(
              padding: EdgeInsets.all(16),
              color: Colors.black54,
              child: Text(
                'Change Image',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
              onPressed: () => _getLocalImage(),
            ),
          ]);
    }
  }

  _getLocalImage() async {
    File imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      initialValue: _currentMeals.name,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }

        if (value.length < 3 || value.length > 150) {
          return 'Name must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeals.name = value;
      },
    );
  }

  Widget _buildCategoryField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Category'),
      initialValue: _currentMeals.category,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Category is required';
        }

        if (value.length < 3 || value.length > 150) {
          return 'Category must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeals.category = value;
      },
    );
  }

  Widget _buildTypeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Type'),
      initialValue: _currentMeals.type,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Type is required';
        }

        if (value.length < 3 || value.length > 150) {
          return 'Type must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeals.type = value;
      },
    );
  }

  Widget _buildCaloriesField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Calories'),
      initialValue: _currentMeals.calories.toString(),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Calories is required';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeals.calories = double.parse(value);
      },
    );
  }

  Widget _buildCarbsField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Carbs'),
      initialValue: _currentMeals.carbs.toString(),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Carbs is required';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeals.carbs = int.parse(value);
      },
    );
  }

  Widget _buildProteinField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Protein'),
      initialValue: _currentMeals.protein.toString(),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Protein is required';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeals.protein = int.parse(value);
      },
    );
  }

  Widget _buildFatField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Fat'),
      initialValue: _currentMeals.fat.toString(),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Fat is required';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeals.fat = int.parse(value);
      },
    );
  }

  Widget _buildServingField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Serving'),
      initialValue: _currentMeals.serving.toString(),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Type is required';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeals.serving = int.parse(value);
      },
    );
  }

  Widget _buildMinutesField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Minutes'),
      initialValue: _currentMeals.minutes,
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Minutes is required';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeals.minutes = value;
      },
    );
  }

  // Widget _buildDirectionsField() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Directions'),
  //     initialValue: _currentMeals.directions,
  //     keyboardType: TextInputType.text,
  //     style: TextStyle(fontSize: 20),
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Directions is required';
  //       }

  //       if (value.length < 3 || value.length > 150) {
  //         return 'Directions must be more than 3 and less than 20';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _currentMeals.directions = value;
  //     },
  //   );
  // }

  _buildIngredientField() {
    return SizedBox(
      width: 200,
      child: TextField(
        controller: ingredientController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: 'Ingredient'),
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  _buildDirectionsField() {
    return SizedBox(
      width: 200,
      child: TextField(
        controller: directionsController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: 'Directions'),
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  _onMealsUploaded(Meals meals) {
    MealsNotifier mealsNotifier =
        Provider.of<MealsNotifier>(context, listen: false);
    mealsNotifier.addMeals(meals);
    Navigator.pop(context);
  }

  _addIngredient(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _ingredients.add(text);
      });
      ingredientController.clear();
    }
  }

  _addDirectionst(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _directions.add(text);
      });
      directionsController.clear();
    }
  }

  _saveFood() {
    print('saveFood Called');
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    print('form saved');

    uploadMealsAndImage(
        _currentMeals, widget.isUpdating, _imageFile, _onMealsUploaded);

    print("name: ${_currentMeals.name}");
    print("category: ${_currentMeals.category}");
    print("type: ${_currentMeals.type}");
    print("type: ${_currentMeals.calories}");
    print("type: ${_currentMeals.carbs}");
    print("type: ${_currentMeals.protein}");
    print("type: ${_currentMeals.fat}");
    print("serving: ${_currentMeals.serving}");
    print("type: ${_currentMeals.minutes}");
    print("ingredients: ${_currentMeals.ingredients.toString()}");
    print("directions: ${_currentMeals.directions.toString()}");
    print("_imageFile ${_imageFile.toString()}");
    print("_imageUrl $_imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Form'),
        backgroundColor: Colors.red[300],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                _showImage(),
                SizedBox(height: 16),
                Text(
                  widget.isUpdating ? "Edit Food" : "Create Food",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 16),
                _imageFile == null && _imageUrl == null
                    ? ButtonTheme(
                        buttonColor: Colors.red[300],
                        child: RaisedButton(
                          onPressed: () => _getLocalImage(),
                          child: Text(
                            'Add Image',
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                    : SizedBox(height: 0),
                _buildNameField(),
                _buildCategoryField(),
                _buildTypeField(),
                _buildCaloriesField(),
                _buildCarbsField(),
                _buildProteinField(),
                _buildFatField(),
                _buildServingField(),
                _buildMinutesField(),
                _buildDirectionsField(),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildIngredientField(),
                    ButtonTheme(
                      child: RaisedButton(
                        child:
                            Text('Add', style: TextStyle(color: Colors.white)),
                        onPressed: () =>
                            _addIngredient(ingredientController.text),
                      ),
                    )
                  ],
                ),
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  // crossAxisCount: 3,
                  // crossAxisSpacing: 4,
                  // mainAxisSpacing: 4,
                  children: _ingredients
                      .map(
                        (ingredient) => Card(
                          color: Colors.red[100],
                          child: Center(
                            child: Text(
                              ingredient,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildDirectionsField(),
                    ButtonTheme(
                      child: RaisedButton(
                        child:
                            Text('Add', style: TextStyle(color: Colors.white)),
                        onPressed: () =>
                            _addDirectionst(directionsController.text),
                      ),
                    )
                  ],
                ),
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  // crossAxisCount: 3,
                  // crossAxisSpacing: 4,
                  // mainAxisSpacing: 4,
                  children: _directions
                      .map(
                        (directions) => Card(
                          color: Colors.red[100],
                          child: Center(
                            child: Text(
                              directions,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _saveFood(),
        child: Icon(Icons.save),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[300],
      ),
    );
  }
}
