import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  double indicatorHeight, indicatorRadius;
  Color indicatorColor;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry insets;
  TabBarIndicatorSize tabBarIndicatorSize;

  CustomTabIndicator({this.indicatorHeight: 20,
    this.indicatorRadius: 100,
    this.indicatorColor: Colors.grey,
    this.padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
    this.insets: const EdgeInsets.symmetric(horizontal: 8.0),
    this.tabBarIndicatorSize: TabBarIndicatorSize.label})
      : assert(indicatorHeight != null),
        assert(indicatorRadius != null),
        assert(indicatorColor != null),
        assert(padding != null),
        assert(insets != null);

  @override
  Decoration lerpTo(Decoration b, double t) {
    if (b is CustomTabIndicator) {
      return new CustomTabIndicator(
          padding: EdgeInsetsGeometry.lerp(padding, b.padding, t),
          insets: EdgeInsetsGeometry.lerp(insets, b.insets, t));
    }
    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return new CustomPainter(this, onChanged);
  }
}

class CustomPainter extends BoxPainter {
  CustomTabIndicator decoration;
  double get indicatorHeight=>decoration.indicatorHeight;
  double get indicatorRadius=>decoration.indicatorRadius;
  Color get indicatorColor=>decoration.indicatorColor;
  EdgeInsetsGeometry get padding=>decoration.padding;
  EdgeInsetsGeometry get insets=>decoration.insets;
  TabBarIndicatorSize get tabBarIndicatorSize=>decoration.tabBarIndicatorSize;

  CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);


  Rect _indicatorRectFor(Rect rect, TextDirection textDirection){
    assert(rect != null);
    assert(textDirection != null);
    Rect indicator = padding.resolve(textDirection).inflateRect(rect);
    if(tabBarIndicatorSize==TabBarIndicatorSize.tab){
      indicator = padding.resolve(textDirection).deflateRect(rect);
    }
    return new Rect.fromLTWH(0,indicator.top, indicator.width, indicator.height);
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(decoration != null);
    assert(configuration.size != null);


    final Rect rect = Offset(
        offset.dx, (configuration.size.height / 2) - indicatorHeight / 2) &
    Size(configuration.size.width, indicatorHeight);
    final TextDirection textDirection = configuration.textDirection;
    final Rect indicator = _indicatorRectFor(rect, textDirection);
    final Paint paint = new Paint();
    paint.color = indicatorColor;
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.stroke;
    canvas.drawLine(indicator.topRight,indicator.bottomRight,paint);
  }
}
