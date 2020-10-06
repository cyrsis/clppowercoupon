import 'package:meta/meta.dart';

@immutable
abstract class IntlEvent {}
class ChangeToCHTEvent extends IntlEvent {}
class ChangeToENGEvent extends IntlEvent {}
