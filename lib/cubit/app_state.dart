// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AppState {
  final List<DataModel> places;
  LoadedState(this.places);
  @override
  List<Object> get props => [places];
}

class DetailState extends AppState {
  final DataModel place;

  DetailState(this.place);

  @override
  List<Object> get props => [place];
}
