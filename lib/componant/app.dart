import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextOverImage extends StatefulWidget {
  @override
  _TextOverImageState createState() => _TextOverImageState();
}

class _TextOverImageState extends State<TextOverImage> {
  List<Widget> list = [
    DraggableWidget(
        draggableWidget:
            Container(color: Colors.green, height: 100, width: 100)),
    DraggableWidget(
        draggableWidget: Container(color: Colors.red, height: 70, width: 70)),
    DraggableWidget(
        draggableWidget: Container(color: Colors.black, height: 20, width: 20)),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                height: 400,
                width: 400,
                color: Colors.blue,
                child: Stack(
                  children: list,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  final Widget? draggableWidget;
  DraggableWidget({Key? key, this.draggableWidget}) : super(key: key); // changed

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  double scale = 0.0;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());

    return Center(
      child: GestureDetector(
        // onMatrixUpdate: (m, tm, sm, rm) {
        //   notifier.value = m;
        // },
        child: AnimatedBuilder(
          animation: notifier,
          builder: (ctx, child) {
            return Transform(
              transform: notifier.value,
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Transform.scale(
                      scale:
                          1, 
                      origin: Offset(0.0, 0.0),
                      child: widget.draggableWidget,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}