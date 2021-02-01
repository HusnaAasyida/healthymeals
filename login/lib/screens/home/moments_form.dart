import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/api/moments_api.dart';
import 'package:login/models/moments.dart';
import 'package:flutter/material.dart';
import 'package:login/notifier/moments_notifier.dart';
import 'package:provider/provider.dart';

class MomentsForm extends StatefulWidget {
  final bool isUpdating;

  MomentsForm({@required this.isUpdating});

  @override
  _MomentsFormState createState() => _MomentsFormState();
}

class _MomentsFormState extends State<MomentsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Moments _currentMoments;
  String _imageUrl;
  File _imageFile;

  @override
  void initState() {
    super.initState();
    MomentsNotifier foodNotifier =
        Provider.of<MomentsNotifier>(context, listen: false);

    if (foodNotifier.currentMoments != null) {
      _currentMoments = foodNotifier.currentMoments;
    } else {
      _currentMoments = Moments();
    }
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
      initialValue: _currentMoments.name,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Name must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMoments.name = value;
      },
    );
  }

  Widget _buildCategoryField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Category'),
      initialValue: _currentMoments.category,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Category is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Category must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMoments.category = value;
      },
    );
  }

  Widget _buildTypeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Type'),
      initialValue: _currentMoments.type,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Type is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Type must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMoments.type = value;
      },
    );
  }

  Widget _buildServingField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Serving'),
      initialValue: _currentMoments.serving.toString(),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Type is required';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMoments.serving = int.parse(value);
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      initialValue: _currentMoments.description,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Description must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMoments.description = value;
      },
    );
  }

  _onMomentsUploaded(Moments moments) {
    MomentsNotifier momentsNotifier =
        Provider.of<MomentsNotifier>(context, listen: false);
    momentsNotifier.addMoments(moments);
    Navigator.pop(context);
  }

  _saveFood() {
    print('saveFood Called');
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    print('form saved');

    uploadMomentsAndImage(
        _currentMoments, widget.isUpdating, _imageFile, _onMomentsUploaded);

    print("name: ${_currentMoments.name}");
    print("category: ${_currentMoments.category}");
    print("type: ${_currentMoments.type}");
    print("serving: ${_currentMoments.serving}");
    print("description: ${_currentMoments.description}");
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
                _buildServingField(),
                _buildDescriptionField(),
                SizedBox(height: 16),
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
