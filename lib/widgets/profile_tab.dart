import 'package:flutter/material.dart';
import 'package:image_notes/controller/helpers/shared_prefs.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double topContainerHeight = MediaQuery.of(context).size.height * 0.3;
    final double picRadius = MediaQuery.of(context).size.height * 0.2;
    final double picTop = topContainerHeight - (picRadius / 2);
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Stack(
          alignment: orientation == Orientation.portrait
              ? Alignment.center
              : Alignment.centerLeft,
          children: <Widget>[
            // background image and bottom contents
            Column(
              children: <Widget>[
                Container(
                  height: topContainerHeight,
                  color: Theme.of(context).buttonColor,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: orientation == Orientation.portrait
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.center,
                    children: [
                      ActionButton(Icons.star),
                      ActionButton(Icons.settings),
                      ActionButton(Icons.edit),
                    ],
                  ),
                )
              ],
            ),
            // Profile image
            Positioned(
              top: picTop,
              child: Padding(
                padding: EdgeInsets.all(
                    orientation == Orientation.portrait ? 0 : 10),
                child: Column(
                  children: [
                    Container(
                      height: picRadius,
                      width: picRadius,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      child: Image.asset('assets/pics/profile_pic.png'),
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: SharedData().getUsername(),
                      builder: (context, snapShot) => snapShot.hasData
                          ? Text(
                              snapShot.data.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData iconData;
  ActionButton(this.iconData);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 60, height: 60),
        child: ElevatedButton(
          child: Icon(iconData),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
          ),
        ),
      ),
    );
  }
}
