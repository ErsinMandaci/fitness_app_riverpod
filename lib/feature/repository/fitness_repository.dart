import 'package:fitness_app/product/models/name_image.dart';
import 'package:fitness_app/product/services/image_service.dart';

import '../../product/models/exercises.dart';
import '../../product/models/muscle_image.dart';
import '../../product/services/exercises_service.dart';

class FitnessRepository {
  Future<List<Exercises>?> getExercisesData() async {
    final fetchData = await ExcercisesService().fetchData();
    return fetchData;
  }

  Future<List<MuscleImage>?> getMuscleImageData() async {
    final getMuscleImage = await ImageService().muscleImageFetchData();
    final exercisesData = await getExercisesData();
    final updateMuscleImage = getMuscleImage?.map((imageData) {
      final matchExerciseImage = exercisesData?.firstWhere(
          (exercise) =>
              exercise.muscle?.toLowerCase() == imageData.muscle?.toLowerCase(),
          orElse: () => Exercises());
      return MuscleImage(
        muscle: matchExerciseImage?.muscle?.replaceAll('_', ''),
        imageUrl: imageData.imageUrl,
      );
    }).toList();

    return updateMuscleImage;
  }

  Future<List<NameImage>?> getNameImage(String selectedMuscle) async {
    final getNameImage = await ImageService().nameImageFetchData();
    final exercisesData = await getMuscleImageData();
    var filteredList = exercisesData
        ?.where((item) =>
            item.muscle?.toLowerCase() == selectedMuscle.toLowerCase())
        .toList();

    final updateNameImage = getNameImage?.map((imageData) {
      final matchExerciseImage = filteredList?.firstWhere(
          (exercise) =>
              exercise.muscle?.toLowerCase() == selectedMuscle.toLowerCase(),
          orElse: () => MuscleImage());

      return NameImage(
        imageUrl: imageData.imageUrl,
        muscle: matchExerciseImage?.muscle ?? '',
        name: imageData.name,
      );
    }).toList();

    return updateNameImage;
  }

  // Future<List<NameImage>?> getNameImage(String selectedMusle) async {
  //   final getNameImage = await ImageService().nameImageFetchData();
  //   final exercisesData = await getExercisesData();

  //   final updateNameImage = getNameImage?.map((imageData) {
  //     final matchExerciseImage = exercisesData?.firstWhere(
  //         (exercise) =>
  //             exercise.muscle?.toLowerCase() == selectedMusle.toLowerCase(),
  //         orElse: () => Exercises());

  //     // debugPrint(matchExerciseImage?.muscle ?? ''.replaceAll('_', ''));
  //     return NameImage(
  //       imageUrl: imageData.imageUrl,
  //       muscle: matchExerciseImage?.muscle ?? ''.replaceAll('_', ''),
  //       name: imageData.name,
  //     );
  //   }).toList();

  //   return updateNameImage;
  // }
}
