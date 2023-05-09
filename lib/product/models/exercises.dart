import 'package:equatable/equatable.dart';

class Exercises with EquatableMixin {
  String? name;
  String? type;
  String? muscle;
  String? equipment;
  String? difficulty;
  String? instructions;

  Exercises({
    this.name,
    this.type,
    this.muscle,
    this.equipment,
    this.difficulty,
    this.instructions,
  });

  @override
  List<Object?> get props =>
      [name, type, muscle, equipment, difficulty, instructions];

  Exercises copyWith({
    String? name,
    String? type,
    String? muscle,
    String? equipment,
    String? difficulty,
    String? instructions,
  }) {
    return Exercises(
      name: name ?? this.name,
      type: type ?? this.type,
      muscle: muscle ?? this.muscle,
      equipment: equipment ?? this.equipment,
      difficulty: difficulty ?? this.difficulty,
      instructions: instructions ?? this.instructions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'muscle': muscle,
      'equipment': equipment,
      'difficulty': difficulty,
      'instructions': instructions,
    };
  }

  factory Exercises.fromJson(Map<String, dynamic> json) {
    return Exercises(
      name: json['name'] as String?,
      type: json['type'] as String?,
      muscle: json['muscle'] as String?,
      equipment: json['equipment'] as String?,
      difficulty: json['difficulty'] as String?,
      instructions: json['instructions'] as String?,
    );
  }
}
