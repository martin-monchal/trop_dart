import 'package:flutter/material.dart';

// Slides the page upwards and fades it in, starting from 1/4 screen
// below the top.
class FadeVerticalPageTransition extends StatelessWidget {
  FadeVerticalPageTransition({
    @required
        Animation<double>
            routeAnimation, // The route's linear 0.0 - 1.0 animation.
    @required this.child,
    Key key,
  })  : _positionAnimation =
            routeAnimation.drive(_bottomUpTween.chain(_fastOutSlowInTween)),
        _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 0.25),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
      CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  final Animation<Offset> _positionAnimation;
  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _positionAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: child,
      ),
    );
  }
}

class FadeHorizontalPageTransition extends StatelessWidget {
  FadeHorizontalPageTransition({
    @required
        Animation<double>
            routeAnimation, // The route's linear 0.0 - 1.0 animation.
    @required this.child,
    Key key,
  })  : _positionAnimation =
            routeAnimation.drive(_bottomUpTween.chain(_fastOutSlowInTween)),
        _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.25, 0.0),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
      CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  final Animation<Offset> _positionAnimation;
  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _positionAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: child,
      ),
    );
  }
}

class ZoomPageTransition extends StatelessWidget {
  /// Creates a [ZoomPageTransition].
  ///
  /// The [animation] and [secondaryAnimation] argument are required and must
  /// not be null.
  const ZoomPageTransition({
    @required this.animation,
    @required this.secondaryAnimation,
    Key key,
    this.child,
  })  : assert(animation != null),
        assert(secondaryAnimation != null),
        super(key: key);

  // A curve sequence that is similar to the 'fastOutExtraSlowIn' curve used in
  // the native transition.
  static final List<TweenSequenceItem<double>>
      fastOutExtraSlowInTweenSequenceItems = <TweenSequenceItem<double>>[
    TweenSequenceItem<double>(
      tween: Tween<double>(begin: 0.0, end: 0.4)
          .chain(CurveTween(curve: const Cubic(0.05, 0.0, 0.133333, 0.06))),
      weight: 0.166666,
    ),
    TweenSequenceItem<double>(
      tween: Tween<double>(begin: 0.4, end: 1.0)
          .chain(CurveTween(curve: const Cubic(0.208333, 0.82, 0.25, 1.0))),
      weight: 1.0 - 0.166666,
    ),
  ];
  static final TweenSequence<double> _scaleCurveSequence =
      TweenSequence<double>(fastOutExtraSlowInTweenSequenceItems);

  /// The animation that drives the [child]'s entrance and exit.
  ///
  /// See also:
  ///
  ///  * [TransitionRoute.animation], which is the value given to this property
  ///    when the [_ZoomPageTransition] is used as a page transition.
  final Animation<double> animation;

  /// The animation that transitions [child] when new content is pushed on top
  /// of it.
  ///
  /// See also:
  ///
  ///  * [TransitionRoute.secondaryAnimation], which is the value given to this
  //     property when the [_ZoomPageTransition] is used as a page transition.
  final Animation<double> secondaryAnimation;

  /// The widget below this widget in the tree.
  ///
  /// This widget will transition in and out as driven by [animation] and
  /// [secondaryAnimation].
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DualTransitionBuilder(
      animation: animation,
      forwardBuilder: (
        BuildContext context,
        Animation<double> animation,
        Widget child,
      ) {
        return _ZoomEnterTransition(
          animation: animation,
          child: child,
        );
      },
      reverseBuilder: (
        BuildContext context,
        Animation<double> animation,
        Widget child,
      ) {
        return _ZoomExitTransition(
          animation: animation,
          reverse: true,
          child: child,
        );
      },
      child: DualTransitionBuilder(
        animation: ReverseAnimation(secondaryAnimation),
        forwardBuilder: (
          BuildContext context,
          Animation<double> animation,
          Widget child,
        ) {
          return _ZoomEnterTransition(
            animation: animation,
            reverse: true,
            child: child,
          );
        },
        reverseBuilder: (
          BuildContext context,
          Animation<double> animation,
          Widget child,
        ) {
          return _ZoomExitTransition(
            animation: animation,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class _ZoomEnterTransition extends StatelessWidget {
  const _ZoomEnterTransition({
    @required this.animation,
    Key key,
    this.reverse = false,
    this.child,
  })  : assert(animation != null),
        assert(reverse != null),
        super(key: key);

  final Animation<double> animation;
  final Widget child;
  final bool reverse;

  static final Animatable<double> _fadeInTransition = Tween<double>(
    begin: 0.0,
    end: 1.00,
  ).chain(CurveTween(curve: const Interval(0.125, 0.250)));

  static final Animatable<double> _scaleDownTransition = Tween<double>(
    begin: 1.10,
    end: 1.00,
  ).chain(ZoomPageTransition._scaleCurveSequence);

  static final Animatable<double> _scaleUpTransition = Tween<double>(
    begin: 0.85,
    end: 1.00,
  ).chain(ZoomPageTransition._scaleCurveSequence);

  static final Animatable<double> _scrimOpacityTween = Tween<double>(
    begin: 0.0,
    end: 0.60,
  ).chain(CurveTween(curve: const Interval(0.2075, 0.4175)));

  @override
  Widget build(BuildContext context) {
    double opacity = 0;
    // The transition's scrim opacity only increases on the forward transition. In the reverse
    // transition, the opacity should always be 0.0.
    //
    // Therefore, we need to only apply the scrim opacity animation when the transition
    // is running forwards.
    //
    // The reason that we check that the animation's status is not `completed` instead
    // of checking that it is `forward` is that this allows the interrupted reversal of the
    // forward transition to smoothly fade the scrim away. This prevents a disjointed
    // removal of the scrim.
    if (!reverse && animation.status != AnimationStatus.completed) {
      opacity = _scrimOpacityTween.evaluate(animation);
    }

    final Animation<double> fadeTransition = reverse
        ? kAlwaysCompleteAnimation
        : _fadeInTransition.animate(animation);

    final Animation<double> scaleTransition =
        (reverse ? _scaleDownTransition : _scaleUpTransition)
            .animate(animation);

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Container(
          color: Colors.black.withOpacity(opacity),
          child: child,
        );
      },
      child: FadeTransition(
        opacity: fadeTransition,
        child: ScaleTransition(
          scale: scaleTransition,
          child: child,
        ),
      ),
    );
  }
}

class _ZoomExitTransition extends StatelessWidget {
  const _ZoomExitTransition({
    @required this.animation,
    Key key,
    this.reverse = false,
    this.child,
  })  : assert(animation != null),
        assert(reverse != null),
        super(key: key);

  final Animation<double> animation;
  final bool reverse;
  final Widget child;

  static final Animatable<double> _fadeOutTransition = Tween<double>(
    begin: 1.0,
    end: 0.0,
  ).chain(CurveTween(curve: const Interval(0.0825, 0.2075)));

  static final Animatable<double> _scaleUpTransition = Tween<double>(
    begin: 1.00,
    end: 1.05,
  ).chain(ZoomPageTransition._scaleCurveSequence);

  static final Animatable<double> _scaleDownTransition = Tween<double>(
    begin: 1.00,
    end: 0.90,
  ).chain(ZoomPageTransition._scaleCurveSequence);

  @override
  Widget build(BuildContext context) {
    final Animation<double> fadeTransition = reverse
        ? _fadeOutTransition.animate(animation)
        : kAlwaysCompleteAnimation;
    final Animation<double> scaleTransition =
        (reverse ? _scaleDownTransition : _scaleUpTransition)
            .animate(animation);

    return FadeTransition(
      opacity: fadeTransition,
      child: ScaleTransition(
        scale: scaleTransition,
        child: child,
      ),
    );
  }
}
