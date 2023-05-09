import 'package:equatable/equatable.dart';
import 'package:fitness_app/feature/repository/fitness_repository.dart';
import 'package:fitness_app/product/models/exercises.dart';
import 'package:fitness_app/product/models/muscle_image.dart';
import 'package:fitness_app/product/models/name_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

  final FitnessRepository _repository = FitnessRepository();
  void fetchisLoad() async {
    state = state.copyWith(isLoading: true);
    // await getExercisesData();
    await getMuscleImageData();

    state = state.copyWith(isLoading: false);
  }

  Future<void> getExercisesData() async {
    // final fetchData = await ExcercisesService().fetchData();
    try {
      final getExercisesData = await _repository.getExercisesData();
      state = state.copyWith(exercises: getExercisesData);
    } catch (e) {
      throw Exception('Notifier getExercisesData hatasi $e');
    }
  }

  Future<void> getMuscleImageData() async {
    try {
      final repoMuscleImageData = await _repository.getMuscleImageData();
      state = state.copyWith(muscleImage: repoMuscleImageData);
    } catch (e) {
      throw Exception('Notifier getMuscleImageData hatasi $e');
    }
  }

  Future<List<NameImage>?> getNameImage(String selectedMusle) async {
    try {
      final repoMuscleImageNameUrl =
          await _repository.getNameImage(selectedMusle);
      state = state.copyWith(nameImage: repoMuscleImageNameUrl);

      return repoMuscleImageNameUrl;
    } catch (e) {
      throw Exception('Notifier getNameImage hatasi $e');
    }
  }
}

class HomeState extends Equatable {
  const HomeState(
      {this.exercises, this.isLoading, this.muscleImage, this.nameImage});
  final bool? isLoading;
  final List<Exercises>? exercises;
  final List<MuscleImage>? muscleImage;
  final List<NameImage>? nameImage;

  HomeState copyWith({
    bool? isLoading,
    List<Exercises>? exercises,
    List<MuscleImage>? muscleImage,
    List<NameImage>? nameImage,
  }) {
    return HomeState(
        exercises: exercises ?? this.exercises,
        muscleImage: muscleImage ?? this.muscleImage,
        nameImage: nameImage ?? this.nameImage,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [exercises, muscleImage, isLoading, nameImage];
}
