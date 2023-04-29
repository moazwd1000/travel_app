import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app_new/Model/data_model.dart';
import 'package:travel_app_new/services/data_services.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.data}) : super(AppInitial()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();

      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel dataModel) {
    emit(DetailState(dataModel));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
