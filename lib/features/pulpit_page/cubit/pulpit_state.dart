part of 'pulpit_cubit.dart';

@immutable
class PulpitState {
  const PulpitState(
      {required this.inkColor,
      required this.isLoading,
      required this.errorMessage,
      required this.borderWidth,
      required this.borderColor,
      required this.documents});

  final Color inkColor;
  final bool isLoading;
  final String errorMessage;
  final double borderWidth;
  final Color borderColor;
  final List<ItemModel> documents;
}
