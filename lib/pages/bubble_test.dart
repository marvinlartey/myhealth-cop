// import 'package:bubbles_selection/bubbles_selection.dart';
import 'package:flutter/material.dart';
// import 'package:bubbles_selection/src/bubbles_selection_game.dart';
// import 'package:flame/game.dart';
import 'package:bubbles_selection/src/boundaries.dart';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/components.dart' as components;
import 'package:flutter/gestures.dart' as gestures;
import 'package:flame/components.dart';

import 'dart:math' as math;
import 'package:collection/collection.dart';

import 'dart:developer';
import 'package:flame/events.dart';

import 'dart:ui';
import 'package:flame/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BubbleSelectionUi(),
    );
  }
}

class BubbleSelectionUi extends StatefulWidget {
  const BubbleSelectionUi({Key? key}) : super(key: key);

  @override
  State<BubbleSelectionUi> createState() => _BubbleSelectionUiState();
}

class _BubbleSelectionUiState extends State<BubbleSelectionUi> {
  late List<Bbubble> selectedBubbles;

  @override
  void initState() {
    super.initState();
    selectedBubbles = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            "Bubble Selection",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          // const Spacer(),
          BubbleSelection(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            bubbless: [
              Bbubble(
                  text: "Eat Healthy",
                  child: Image(image: AssetImage('assets/images/medi.jpg')),
                  scale: 0.9,
                  backgroundImage: AssetImage("assets/images/medi.jpg"),
                  activeColor: Colors.red.withOpacity(0.5),
                  inactiveColor: Colors.blue.withOpacity(0.5),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.yellow,
                  )),
              Bbubble(
                scale: 0.9,
                text: "Define Your Goal",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 237, 141, 17).withOpacity(0.5),
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Bbubble(
                text: "Lose Weight",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 16, 233, 186).withOpacity(
                  0.5,
                ),
                scale: 0.9,
              ),
              Bbubble(
                scale: 0.9,
                backgroundImage: AssetImage("assert/images/medi.jpg"),
                text: "Gain Weight",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 89, 37, 245).withOpacity(0.5),
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Bbubble(
                scale: 0.9,
                text: "Be More Active",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 176, 34, 224).withOpacity(0.5),
              ),
              Bbubble(
                scale: 0.9,
                text: "Keep Fit",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 89, 37, 245).withOpacity(0.5),
              ),
              Bbubble(
                scale: 0.9,
                text: "ReduceStress",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 176, 34, 224).withOpacity(0.5),
              ),
              /* Bubble(
                text: "Music🎶",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 89, 37, 245).withOpacity(0.5),
                textStyle: const TextStyle(
                  fontSize: 28,
                ),
              ),
              Bubble(
                text: "Travel🚗",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 176, 34, 224).withOpacity(0.5),
              ),
              Bubble(
                text: "Sports🏀",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 89, 37, 245).withOpacity(0.5),
                textStyle: const TextStyle(
                  fontSize: 24,
                ),
              ),
              Bubble(
                text: "News📰",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 176, 34, 224).withOpacity(0.5),
              ), */
            ],
            selectedBubbless: selectedBubbles,
            size: const Size(
              900,
              600,
            ),
            onSelect: (bubble) {
              setState(() {
                selectedBubbles.add(bubble);
              });
            },
            onRemoved: (bubble) {
              setState(() {
                selectedBubbles.remove(bubble);
              });
            },
          ),
          const Spacer(),
          Wrap(
            children: selectedBubbles
                .map<Widget>(
                  (bubble) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text(
                        bubble.text,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

/* class Bbubble {
  String text;
  double scale;
  Color activeColor;
  Color inactiveColor;
  TextStyle textStyle;

  Bbubble({
    required this.text,
    this.scale = 1,
    this.activeColor = const Color.fromARGB(128, 244, 67, 54),
    this.inactiveColor = const Color.fromARGB(128, 33, 149, 243),
    this.textStyle = const TextStyle(
      fontSize: 18,
    ),
  }) : assert(
          scale >= 0 && scale <= 1,
        );
} */

class Bbubble extends StatelessWidget {
  /// Creates a circle that represents a user.
  Bbubble({
    Key? key,
    required this.text,
    this.scale = 1,
    this.activeColor = const Color.fromARGB(128, 244, 67, 54),
    this.inactiveColor = const Color.fromARGB(128, 33, 149, 243),
    this.textStyle = const TextStyle(
      fontSize: 18,
    ),
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.foregroundColor,
    this.radius,
    this.minRadius,
    this.maxRadius,
  })  : assert(radius == null || (minRadius == null && maxRadius == null)),
        assert(backgroundImage != null || onBackgroundImageError == null),
        assert(foregroundImage != null || onForegroundImageError == null),
        super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget. If the [Bbubble] is to have an image, use
  /// [backgroundImage] instead.
  final Widget? child;

  /// The color with which to fill the circle. Changing the background
  /// color will cause the avatar to animate to the new color.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color? backgroundColor;

  /// The default text color for text in the circle.
  ///
  /// Defaults to the primary text theme color if no [backgroundColor] is
  /// specified.
  ///
  /// Defaults to [ThemeData.primaryColorLight] for dark background colors, and
  /// [ThemeData.primaryColorDark] for light background colors.
  final Color? foregroundColor;

  /// The background image of the circle. Changing the background
  /// image will cause the avatar to animate to the new image.
  ///
  /// Typically used as a fallback image for [foregroundImage].
  ///
  /// If the [Bbubble] is to have the user's initials, use [child] instead.
  final ImageProvider? backgroundImage;

  /// The foreground image of the circle.
  ///
  /// Typically used as profile image. For fallback use [backgroundImage].
  final ImageProvider? foregroundImage;

  /// An optional error callback for errors emitted when loading
  /// [backgroundImage].
  final ImageErrorListener? onBackgroundImageError;

  /// An optional error callback for errors emitted when loading
  /// [foregroundImage].
  final ImageErrorListener? onForegroundImageError;

  /// The size of the avatar, expressed as the radius (half the diameter).
  ///
  /// If [radius] is specified, then neither [minRadius] nor [maxRadius] may be
  /// specified. Specifying [radius] is equivalent to specifying a [minRadius]
  /// and [maxRadius], both with the value of [radius].
  ///
  /// If neither [minRadius] nor [maxRadius] are specified, defaults to 20
  /// logical pixels. This is the appropriate size for use with
  /// [ListTile.leading].
  ///
  /// Changes to the [radius] are animated (including changing from an explicit
  /// [radius] to a [minRadius]/[maxRadius] pair or vice versa).
  final double? radius;

  /// The minimum size of the avatar, expressed as the radius (half the
  /// diameter).
  ///
  /// If [minRadius] is specified, then [radius] must not also be specified.
  ///
  /// Defaults to zero.
  ///
  /// Constraint changes are animated, but size changes due to the environment
  /// itself changing are not. For example, changing the [minRadius] from 10 to
  /// 20 when the [Bbubble] is in an unconstrained environment will cause
  /// the avatar to animate from a 20 pixel diameter to a 40 pixel diameter.
  /// However, if the [minRadius] is 40 and the [Bbubble] has a parent
  /// [SizedBox] whose size changes instantaneously from 20 pixels to 40 pixels,
  /// the size will snap to 40 pixels instantly.
  final double? minRadius;

  /// The maximum size of the avatar, expressed as the radius (half the
  /// diameter).
  ///
  /// If [maxRadius] is specified, then [radius] must not also be specified.
  ///
  /// Defaults to [double.infinity].
  ///
  /// Constraint changes are animated, but size changes due to the environment
  /// itself changing are not. For example, changing the [maxRadius] from 10 to
  /// 20 when the [Bbubble] is in an unconstrained environment will cause
  /// the avatar to animate from a 20 pixel diameter to a 40 pixel diameter.
  /// However, if the [maxRadius] is 40 and the [Bbubble] has a parent
  /// [SizedBox] whose size changes instantaneously from 20 pixels to 40 pixels,
  /// the size will snap to 40 pixels instantly.
  final double? maxRadius;

  // The default radius if nothing is specified.
  static const double _defaultRadius = 20.0;

  // The default min if only the max is specified.
  static const double _defaultMinRadius = 0.0;

  // The default max if only the min is specified.
  static const double _defaultMaxRadius = double.infinity;

  String text;
  double scale;
  Color activeColor;
  Color inactiveColor;
  TextStyle textStyle;

  double get _minDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      return _defaultRadius * 2.0;
    }
    return 2.0 * (radius ?? minRadius ?? _defaultMinRadius);
  }

  double get _maxDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      return _defaultRadius * 2.0;
    }
    return 2.0 * (radius ?? maxRadius ?? _defaultMaxRadius);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    TextStyle textStyle =
        theme.primaryTextTheme.subtitle1!.copyWith(color: foregroundColor);
    Color? effectiveBackgroundColor = backgroundColor;
    if (effectiveBackgroundColor == null) {
      switch (ThemeData.estimateBrightnessForColor(textStyle.color!)) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    } else if (foregroundColor == null) {
      switch (ThemeData.estimateBrightnessForColor(backgroundColor!)) {
        case Brightness.dark:
          textStyle = textStyle.copyWith(color: theme.primaryColorLight);
          break;
        case Brightness.light:
          textStyle = textStyle.copyWith(color: theme.primaryColorDark);
          break;
      }
    }
    final double minDiameter = _minDiameter;
    final double maxDiameter = _maxDiameter;
    return AnimatedContainer(
      constraints: BoxConstraints(
        minHeight: minDiameter,
        minWidth: minDiameter,
        maxWidth: maxDiameter,
        maxHeight: maxDiameter,
      ),
      duration: kThemeChangeDuration,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        image: backgroundImage != null
            ? DecorationImage(
                image: backgroundImage!,
                onError: onBackgroundImageError,
                fit: BoxFit.cover,
              )
            : null,
        shape: BoxShape.circle,
      ),
      foregroundDecoration: foregroundImage != null
          ? BoxDecoration(
              image: DecorationImage(
                image: foregroundImage!,
                onError: onForegroundImageError,
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            )
          : null,
      child: child == null
          ? null
          : Center(
              child: MediaQuery(
                // Need to ignore the ambient textScaleFactor here so that the
                // text doesn't escape the avatar when the textScaleFactor is large.
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: IconTheme(
                  data: theme.iconTheme.copyWith(color: textStyle.color),
                  child: DefaultTextStyle(
                    style: textStyle,
                    child: child!,
                  ),
                ),
              ),
            ),
    );
  }
}

class BubbleSelection extends StatefulWidget {
  BubbleSelection({
    Key? key,
    required this.onSelect,
    required this.onRemoved,
    required this.size,
    required this.bubbless,
    required this.selectedBubbless,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0x00000000),
  })  : assert(
          bubbless.isNotEmpty && checkForDuplicatess(bubbless),
          "There should be atleast one item and every item should have unique value :"
          '\n'
          'Either zero or 2 or more same values were detected',
        ),
        assert(
          checkForDuplicatess(selectedBubbless),
          "There should be atleast one item and every item should have unique value :"
          '\n'
          'Either zero or 2 or more same values were detected',
        ),
        assert(size.isFinite, "Size should be finite"),
        super(key: key);

  final Function(Bbubble bubble) onSelect;
  final Function(Bbubble bubble) onRemoved;
  final Size size;
  final List<Bbubble> bubbless;
  final List<Bbubble> selectedBubbless;
  final Color backgroundColor;
  final Color borderColor;

  @override
  State<BubbleSelection> createState() => _BubbleSelectionState();
}

class _BubbleSelectionState extends State<BubbleSelection> {
  late BubbleSelectionGame game;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game = BubbleSelectionGame(
      onSelect: widget.onSelect,
      onRemoved: widget.onRemoved,
      bubbless: widget.bubbless,
      selectedBubbless: widget.selectedBubbless,
      borderColor: widget.borderColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final background = Container(
      color: widget.backgroundColor,
    );
    return SizedBox(
      height: widget.size.height,
      width: widget.size.width,
      child: GameWidget(
        errorBuilder: (context, error) {
          return Center(child: Text("Error occured: \n $error"));
        },
        loadingBuilder: (context) {
          return background;
        },
        backgroundBuilder: (context) {
          return background;
        },
        game: game,
      ),
    );
  }
}

class BubbleSelectionGame extends Forge2DGame with HasTappables, HasDraggables {
  BubbleSelectionGame({
    required this.onSelect,
    required this.onRemoved,
    required this.bubbless,
    required this.selectedBubbless,
    required this.borderColor,
  }) : super();

  final void Function(Bbubble bubble) onSelect;
  final void Function(Bbubble bubble) onRemoved;
  final List<Bbubble> bubbless;
  final List<Bbubble> selectedBubbless;
  final Color borderColor;
  @override
  @override
  Future<void>? onLoad() {
    world.setGravity(Vector2(0, -0.1));
    // TODO: implement onLoad
    final boundaries = createBoundaries(this, borderColor);

    boundaries.forEach(add);
    final bubbleConcrete = bubbless
        .map((bbubble) => BbubbleBody(
              bbubble: bbubble,
            ))
        .toList();
    addAll(bubbleConcrete);
    return super.onLoad();
  }
}

class BbubbleBody extends BodyComponent<BubbleSelectionGame>
    with Tappable, components.Draggable {
  late double textWidth;
  final Bbubble bbubble;
  late double textHeight;
  late Vector2 position;
  BbubbleBody({
    required this.bbubble,
  });

  @override
  Future<void> onLoad() {
    // TODO: implement onLoad

    position = Vector2(
      math.Random().nextInt(gameRef.size.x.toInt()).toDouble(),
      math.Random().nextInt(gameRef.size.y.toInt()).toDouble(),
    );
    final textPaint = TextPaint(
      style: bbubble.textStyle,
    );

    // final textRenderer = TextRenderer.createDefault();
    // final textElement =
    //     (textRenderer as FormatterTextRenderer).formatter.format(bubble.label);
    // final measurements = textElement.lastLine.metrics;
    // final scale = Vector2.all(
    //   lerpDouble(0, 0.1, bubble.scale)!,
    // );

    textWidth = textPaint.measureTextWidth(bbubble.text);
    textHeight = textPaint.measureTextHeight(bbubble.text);
    // final originalTextWidth = textPaint.measureTextWidth(bubble.text) * 0.1;
    // final originalTextHeight = textPaint.measureTextHeight(bubble.text) * 0.1;
    // originalTextPaint = textPaint.measureTextHeight(bubble.text) * scale.y;

    //math.Random().nextInt(8).toDouble().clamp(4, 6);
    final scaledTextSize = Vector2(
          textWidth,
          textHeight,
        ) *
        0.1;
    addAll([
      TextComponent(
          text: bbubble.text,
          textRenderer: textPaint,
          scale: Vector2.all(0.1),
          // size: textSize,
          position: -scaledTextSize / 2
          // Vector2(
          //   //    (label.length.toDouble() / 2) +
          //   (textSize.x / 2),
          //   //(textWidth / 2) * scale.x + (label.length) / 2,
          //   textSize.y / 2,
          // ),
          )
    ]);
    return super.onLoad();
  }

  @override
  Body createBody() {
    final scale = Vector2.all(
      lerpDouble(0, 0.1, bbubble.scale)!,
    );
    final circleScale = textWidth * scale.x;
    final bodySize = circleScale / 1.5 + 1;
    final fixture = FixtureDef(
      CircleShape()..radius = bodySize.toDouble(),
      restitution: 0.5,
    );
    final isSelected = gameRef.selectedBubbless.contains(bbubble);
    paint.color = isSelected ? bbubble.activeColor : bbubble.inactiveColor;

    final body = BodyDef(
      type: BodyType.dynamic,
      position: position,
    );

    return world.createBody(body)..createFixture(fixture);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    final direction = math.Random().nextBool() ? 1 : -1;
    body.applyLinearImpulse(
      Vector2(
        direction * math.Random().nextDouble() * 0.01,
        direction * math.Random().nextDouble() * 0.005,
      ),
    );
    position = body.position;
    super.update(dt);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    final items =
        gameRef.bubbless.where((item) => item.text == bbubble.text).toList();

    if (items.isEmpty) {
      throw Exception("No such item for given value found.");
    }

    if (items.length > 1) {
      throw Exception(
          "All items should have unique values :\n More than one item for given value found.");
    }

    final isSelected = gameRef.selectedBubbless.contains(items[0]);

    if (!isSelected) {
      paint.color = bbubble.activeColor;
      gameRef.onSelect(items[0]);
    } else {
      paint.color = bbubble.inactiveColor;
      gameRef.onRemoved(items[0]);
    }
    return true;
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    log(info.delta.game.toString());

    // final dragVector = info.delta.game;
    final pointerVelocity = gestures.Velocity(
      pixelsPerSecond: info.delta.game.toOffset(),
    );

    body.applyLinearImpulse(
      Vector2(
        pointerVelocity.pixelsPerSecond.dx,
        pointerVelocity.pixelsPerSecond.dy,
      ), // dragVector * 1.5,
    );
    return super.onDragUpdate(info);
  }

  @override
  bool onDragEnd(DragEndInfo info) {
    // TODO: implement onDragEnd
    body.linearVelocity = info.velocity;
    return super.onDragEnd(info);
  }
}

bool checkForDuplicatess(List<Bbubble> bubbles) {
  List<Bbubble> filteredList = [];
  for (Bbubble bubble in bubbles) {
    final isPresent =
        filteredList.firstWhereOrNull((item) => item.text == bubble.text) !=
            null;

    if (!isPresent) {
      filteredList.add(bubble);
    } else {
      return false;
    }
  }
  return true;
}
