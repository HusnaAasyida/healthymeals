import 'package:flutter/material.dart';
import 'package:login/models/type.dart';
import 'package:login/shared/loading.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

class TypeWidget extends StatelessWidget {
  final TypeModel type;
  const TypeWidget({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Stack(
        children: <Widget>[
          Container(
            width: 140,
            height: 160,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                //child: Image.network(type.name)
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    // Center(
                    //   child: FadeInImage.memoryNetwork(
                    //       placeholder: kTransparentImage,
                    //       image: type.image),
                    // )
                  ],
                )),
          ),
          Container(
            width: 140,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.025),
                  ],
                )),
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: type.name,
                    color: green,
                    size: 26,
                    weight: FontWeight.w300,
                  ))),
        ],
      ),
    );
  }
}
