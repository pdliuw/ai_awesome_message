part of ai_awesome_message;

/// AwesomeMessageRoute
///
class AwesomeMessageRoute<T> extends OverlayRoute<T> {
  late Animation<double> _filterBlurAnimation;
  late Animation<Color?> _filterColorAnimation;

  AwesomeMessageRoute({
    this.theme,
    required this.awesomeMessage,
    RouteSettings? settings,
  }) : super(settings: settings) {
    this._builder = Builder(builder: (BuildContext innerContext) {
      return GestureDetector(
        child: awesomeMessage,
        onTap: awesomeMessage.onTap != null
            ? () {
                awesomeMessage.onTap!(awesomeMessage);
              }
            : null,
      );
    });

    _configureAlignment(this.awesomeMessage.awesomeMessagePosition);
    _onStatusChanged = awesomeMessage.onStatusChanged;
  }

  _configureAlignment(AwesomeMessagePosition awesomeMessagePosition) {
    switch (awesomeMessage.awesomeMessagePosition) {
      case AwesomeMessagePosition.TOP:
        {
          _initialAlignment = Alignment(-1.0, -2.0);
          _endAlignment = Alignment(-1.0, -1.0);
          break;
        }
      case AwesomeMessagePosition.BOTTOM:
        {
          _initialAlignment = Alignment(-1.0, 2.0);
          _endAlignment = Alignment(-1.0, 1.0);
          break;
        }
    }
  }

  late AwesomeMessage awesomeMessage;
  Builder? _builder;

  final ThemeData? theme;

  Future<T> get completed => _transitionCompleter.future;
  final Completer<T> _transitionCompleter = Completer<T>();

  AwesomeMessageStatusCallback? _onStatusChanged;
  Alignment? _initialAlignment;
  Alignment? _endAlignment;
  bool _wasDismissedBySwipe = false;

  Timer? _timer;

  bool get opaque => false;

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    List<OverlayEntry> overlays = [];

    if (awesomeMessage.overlayBlur! > 0.0) {
      overlays.add(
        OverlayEntry(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: awesomeMessage.isDismissible!
                    ? () => awesomeMessage.dismiss()
                    : null,
                child: AnimatedBuilder(
                  animation: _filterBlurAnimation,
                  builder: (context, child) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: _filterBlurAnimation.value,
                          sigmaY: _filterBlurAnimation.value),
                      child: Container(
                        constraints: BoxConstraints.expand(),
                        color: _filterColorAnimation.value,
                      ),
                    );
                  },
                ),
              );
            },
            maintainState: false,
            opaque: opaque),
      );
    }

    overlays.add(
      OverlayEntry(
          builder: (BuildContext context) {
            final Widget annotatedChild = Semantics(
              child: AlignTransition(
                alignment: _animation!,
                child: awesomeMessage.isDismissible!
                    ? _getDismissibleAwesomeMessage(_builder!)
                    : _getAwesomeMessage(),
              ),
              focused: false,
              container: true,
              explicitChildNodes: true,
            );
            return theme != null
                ? Theme(data: theme!, child: annotatedChild)
                : annotatedChild;
          },
          maintainState: false,
          opaque: opaque),
    );

    return overlays;
  }

  /// This string is a workaround until Dismissible supports a returning item
  String dismissibleKeyGen = "";

  Widget _getDismissibleAwesomeMessage(Widget child) {
    return Dismissible(
      direction: _getDismissDirection(),
      resizeDuration: null,
      confirmDismiss: (_) {
        if (currentStatus == AwesomeMessageStatus.IS_APPEARING ||
            currentStatus == AwesomeMessageStatus.IS_HIDING) {
          return Future.value(false);
        }
        return Future.value(true);
      },
      key: Key(dismissibleKeyGen),
      onDismissed: (_) {
        dismissibleKeyGen += "1";
        _cancelTimer();
        _wasDismissedBySwipe = true;

        if (isCurrent) {
          navigator?.pop();
        } else {
          navigator?.removeRoute(this);
        }
      },
      child: _getAwesomeMessage(),
    );
  }

  Widget _getAwesomeMessage() {
    return Container(
      margin: awesomeMessage.margin,
      child: _builder,
    );
  }

  DismissDirection _getDismissDirection() {
    if (awesomeMessage.dismissDirection ==
        AwesomeMessageDismissDirection.HORIZONTAL) {
      return DismissDirection.horizontal;
    } else {
      if (awesomeMessage.awesomeMessagePosition == AwesomeMessagePosition.TOP) {
        return DismissDirection.up;
      } else {
        return DismissDirection.down;
      }
    }
  }

  @override
  bool get finishedWhenPopped =>
      _controller?.status == AnimationStatus.dismissed;

  /// The animation that drives the route's transition and the previous route's
  /// forward transition.
  Animation<Alignment>? get animation => _animation;
  Animation<Alignment>? _animation;

  /// The animation controller that the route uses to drive the transitions.
  ///
  /// The animation itself is exposed by the [animation] property.
  @protected
  AnimationController? get controller => _controller;
  AnimationController? _controller;

  /// Called to create the animation controller that will drive the transitions to
  /// this route from the previous one, and back to the previous route from this
  /// one.
  AnimationController createAnimationController() {
    assert(!_transitionCompleter.isCompleted,
        'Cannot reuse a $runtimeType after disposing it.');
    assert(awesomeMessage.animationDuration != null &&
        awesomeMessage.animationDuration! >= Duration.zero);
    return AnimationController(
      duration: awesomeMessage.animationDuration,
      debugLabel: debugLabel,
      vsync: navigator!,
    );
  }

  /// Called to create the animation that exposes the current progress of
  /// the transition controlled by the animation controller created by
  /// [createAnimationController()].
  Animation<Alignment> createAnimation() {
    assert(!_transitionCompleter.isCompleted,
        'Cannot reuse a $runtimeType after disposing it.');
    assert(_controller != null);
    return AlignmentTween(begin: _initialAlignment, end: _endAlignment).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: awesomeMessage.forwardAnimationCurve!,
        reverseCurve: awesomeMessage.reverseAnimationCurve,
      ),
    );
  }

  Animation<double> createBlurFilterAnimation() {
    return Tween(begin: 0.0, end: awesomeMessage.overlayBlur).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Interval(
          0.0,
          0.35,
          curve: Curves.easeInOutCirc,
        ),
      ),
    );
  }

  Animation<Color?> createColorFilterAnimation() {
    return ColorTween(
            begin: Colors.transparent, end: awesomeMessage.overlayColor)
        .animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Interval(
          0.0,
          0.35,
          curve: Curves.easeInOutCirc,
        ),
      ),
    );
  }

  T? _result;
  AwesomeMessageStatus? currentStatus;

  //copy of `routes.dart`
  void _handleStatusChanged(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
        currentStatus = AwesomeMessageStatus.SHOWING;
        _onStatusChanged!(currentStatus!);
        if (overlayEntries.isNotEmpty) overlayEntries.first.opaque = opaque;

        break;
      case AnimationStatus.forward:
        currentStatus = AwesomeMessageStatus.IS_APPEARING;
        _onStatusChanged!(currentStatus!);
        break;
      case AnimationStatus.reverse:
        currentStatus = AwesomeMessageStatus.IS_HIDING;
        _onStatusChanged!(currentStatus!);
        if (overlayEntries.isNotEmpty) overlayEntries.first.opaque = false;
        break;
      case AnimationStatus.dismissed:
        assert(!overlayEntries.first.opaque);
        // We might still be the current route if a subclass is controlling the
        // the transition and hits the dismissed status. For example, the iOS
        // back gesture drives this animation to the dismissed status before
        // popping the navigator.
        currentStatus = AwesomeMessageStatus.DISMISSED;
        _onStatusChanged!(currentStatus!);

        if (!isCurrent) {
          navigator?.finalizeRoute(this);
//          assert(overlayEntries.isEmpty);
        }
        break;
    }
    changedInternalState();
  }

  @override
  void install() {
    assert(!_transitionCompleter.isCompleted,
        'Cannot install a $runtimeType after disposing it.');
    _controller = createAnimationController();
    assert(_controller != null,
        '$runtimeType.createAnimationController() returned null.');
    _filterBlurAnimation = createBlurFilterAnimation();
    _filterColorAnimation = createColorFilterAnimation();
    _animation = createAnimation();
    assert(_animation != null, '$runtimeType.createAnimation() returned null.');
    super.install();
  }

  @override
  // ignore: must_call_super
  TickerFuture didPush() {
    assert(_controller != null,
        '$runtimeType.didPush called before calling install() or after calling dispose().');
    assert(!_transitionCompleter.isCompleted,
        'Cannot reuse a $runtimeType after disposing it.');
    _animation!.addStatusListener(_handleStatusChanged);
    _configureTimer();
    return _controller!.forward();
  }

  @override
  void didReplace(Route<dynamic>? oldRoute) {
    assert(_controller != null,
        '$runtimeType.didReplace called before calling install() or after calling dispose().');
    assert(!_transitionCompleter.isCompleted,
        'Cannot reuse a $runtimeType after disposing it.');
    if (oldRoute is AwesomeMessageRoute)
      _controller!.value = oldRoute._controller!.value;
    _animation!.addStatusListener(_handleStatusChanged);
    super.didReplace(oldRoute);
  }

  @override
  bool didPop(T? result) {
    assert(_controller != null,
        '$runtimeType.didPop called before calling install() or after calling dispose().');
    assert(!_transitionCompleter.isCompleted,
        'Cannot reuse a $runtimeType after disposing it.');

    _result = result;
    _cancelTimer();

    if (_wasDismissedBySwipe) {
      Timer(Duration(milliseconds: 200), () {
        _controller?.reset();
      });

      _wasDismissedBySwipe = false;
    } else {
      _controller?.reverse();
    }

    return super.didPop(result);
  }

  void _configureTimer() {
    if (awesomeMessage.duration != null) {
      if (_timer != null && _timer!.isActive) {
        _timer?.cancel();
      }
      _timer = Timer(awesomeMessage.duration!, () {
        if (this.isCurrent) {
          navigator?.pop();
        } else if (this.isActive) {
          navigator?.removeRoute(this);
        }
      });
    } else {
      if (_timer != null) {
        _timer!.cancel();
      }
    }
  }

  void _cancelTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  /// Whether this route can perform a transition to the given route.
  ///
  /// Subclasses can override this method to restrict the set of routes they
  /// need to coordinate transitions with.
  bool canTransitionTo(AwesomeMessageRoute<dynamic> nextRoute) => true;

  /// Whether this route can perform a transition from the given route.
  ///
  /// Subclasses can override this method to restrict the set of routes they
  /// need to coordinate transitions with.
  bool canTransitionFrom(AwesomeMessageRoute<dynamic> previousRoute) => true;

  @override
  void dispose() {
    assert(!_transitionCompleter.isCompleted,
        'Cannot dispose a $runtimeType twice.');
    _controller?.dispose();
    _transitionCompleter.complete(_result);
    super.dispose();
  }

  /// A short description of this route useful for debugging.
  String get debugLabel => '$runtimeType';

  @override
  String toString() => '$runtimeType(animation: $_controller)';
}
