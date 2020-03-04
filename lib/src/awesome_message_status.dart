part of ai_awesome_message;

/// Indicates if AwesomeMessage will be attached to the edge of the screen or not

/// Indicates the animation status
/// [AwesomeMessageStatus.SHOWING] AwesomeMessage has stopped and the user can see it
/// [AwesomeMessageStatus.DISMISSED] AwesomeMessage has finished its mission and returned any pending values
/// [AwesomeMessageStatus.IS_APPEARING] AwesomeMessage is moving towards [AwesomeMessageStatusStatus.SHOWING]
/// [AwesomeMessageStatus.IS_HIDING] AwesomeMessage is moving towards [] [AwesomeMessageStatusStatus.DISMISSED]
enum AwesomeMessageStatus {
  SHOWING,
  DISMISSED,
  IS_APPEARING,
  IS_HIDING,
}
