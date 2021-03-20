## [2.0.0]

- Null safety support. Thanks @cerberodev.

## [1.0.8]

- `onRefresh` callback was added , it works similar like the `RefreshIndicator` widget.
- `displacement` property was added, default value is `40`. if `onRefresh` is null then this property is ignored.

## [1.0.7]

Bugs fixed

## [1.0.6]

Add `overlay` widget to header.
This widget will be placed on top the header container.

Can be used to add clickable items to the header bottom which doesn't prevent it from scrolling.

## [1.0.5]

* Get rid of nested ListViews, allow list items to consume gestures [Thanks PiN73].

## [1.0.4]

* New option to avoid blur the content when scroll. blurContent = false.

## [1.0.1 - 1.0.3]

* Fixed an issue related to the highlightHeader (now it can detects gesture events).

## [1.0.0]

* First release.