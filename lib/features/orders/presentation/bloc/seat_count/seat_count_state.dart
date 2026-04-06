class SeatCountState {
  final int selectedCount;

  const SeatCountState({
    required this.selectedCount,
  });

  factory SeatCountState.initial() {
    return const SeatCountState(selectedCount: 1);
  }

  SeatCountState copyWith({
    int? selectedCount,
  }) {
    return SeatCountState(
      selectedCount: selectedCount ?? this.selectedCount,
    );
  }
}
