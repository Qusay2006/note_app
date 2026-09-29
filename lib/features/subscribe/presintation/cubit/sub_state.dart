class SubscribeState {
  final bool isSubscribed ;
  final String error;

  SubscribeState({required this.isSubscribed, required this.error});
  factory SubscribeState.initial() => SubscribeState(isSubscribed: false,error: '');

  SubscribeState copyWith({bool? isSubscribed, String? error}) {
    return SubscribeState(
      isSubscribed: isSubscribed ?? this.isSubscribed,
      error: error??this.error,
    );
  }
}