import 'dart:ui';

import 'package:flutter/material.dart';

enum HighlightHeaderAlignment {
  bottom,
  center,
  top,
}

class StretchyHeader extends StatefulWidget {
  ///Header Widget that will be stretched, it will appear at the top of the page
  final Widget header;

  ///Height of your header widget
  final double headerHeight;

  ///highlight header that will be placed on the header,  this widget always be visible without blurring effect
  final Widget highlightHeader;

  ///alignment for the highlight header
  final HighlightHeaderAlignment highlightHeaderAlignment;

  ///Body Widget it will appear below the header
  final Widget body;

  ///The color of the blur, white by default
  final Color blurColor;

  ///Background Color of all of the content
  final Color backgroundColor;

  const StretchyHeader({
    Key key,
    @required this.header,
    @required this.body,
    @required this.headerHeight,
    this.highlightHeader,
    this.highlightHeaderAlignment = HighlightHeaderAlignment.bottom,
    this.blurColor,
    this.backgroundColor,
  })  : assert(header != null),
        assert(body != null),
        assert(highlightHeaderAlignment != null),
        assert(headerHeight != null && headerHeight >= 0.0),
        super(key: key);

  @override
  _StretchyHeaderState createState() => _StretchyHeaderState();
}

class _StretchyHeaderState extends State<StretchyHeader> {
  ScrollController _scrollController;
  GlobalKey _keyHighlightHeader = GlobalKey();
  double _offset = 0.0;
  double _headerSize = 0.0;
  double _highlightHeaderSize = 0.0;

  void _onLayoutDone(_) {
    final RenderBox renderBox =
        _keyHighlightHeader.currentContext.findRenderObject();
    setState(() {
      _highlightHeaderSize = renderBox.size.height;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _headerSize = widget.headerHeight;
    if (widget.highlightHeader != null) {
      WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double highlightPosition = 0.0;
    if (widget.highlightHeaderAlignment == HighlightHeaderAlignment.top) {
      highlightPosition = (_offset >= 0.0 ? -_offset : 0.0);
    } else if (widget.highlightHeaderAlignment ==
        HighlightHeaderAlignment.center) {
      highlightPosition = _headerSize / 2 -
          (_offset >= 0.0 ? _offset : _offset / 2) -
          _highlightHeaderSize / 2;
    } else if (widget.highlightHeaderAlignment ==
        HighlightHeaderAlignment.bottom) {
      highlightPosition = _headerSize - _offset - _highlightHeaderSize;
    }
    return Container(
      color: widget.backgroundColor,
      child: Stack(
        children: <Widget>[
          SizedBox(
            child: ClipRect(
              clipper: HeaderClipper(_headerSize - _offset),
              child: widget.header,
            ),
            height: _scrollController.hasClients &&
                    _scrollController.position.extentAfter == 0.0
                ? _headerSize
                : _offset <= _headerSize ? _headerSize - _offset : 0.0,
            width: MediaQuery.of(context).size.width,
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: _offset < 0.0 ? _offset.abs() * 0.1 : 0.0,
                  sigmaY: _offset < 0.0 ? _offset.abs() * 0.1 : 0.0),
              child: Container(
                height: _offset <= _headerSize ? _headerSize - _offset : 0.0,
                decoration: BoxDecoration(
                    color: (widget.blurColor ?? Colors.grey.shade200)
                        .withOpacity(_offset < 0.0 ? 0.15 : 0.0)),
              ),
            ),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                setState(() {
                  _offset = notification.metrics.pixels;
                });
              }
            },
            child: ListView(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  SizedBox(
                    height: _headerSize,
                  ),
                  AbsorbPointer(
                    child: widget.body,
                  ),
                ]),
          ),
          widget.highlightHeader != null
              ? Positioned(
                  key: _keyHighlightHeader,
                  top: highlightPosition,
                  child: widget.highlightHeader,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Rect> {
  final double height;

  HeaderClipper(this.height);

  @override
  getClip(Size size) => Rect.fromLTRB(0.0, 0.0, size.width, this.height);

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
