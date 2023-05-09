import 'package:equatable/equatable.dart';

class MuscleImage with EquatableMixin {
  String? muscle;
  String? imageUrl;

  MuscleImage({
    this.muscle,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [muscle, imageUrl];

  MuscleImage copyWith({
    String? muscle,
    String? imageUrl,
  }) {
    return MuscleImage(
      muscle: muscle ?? this.muscle,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'muscle': muscle,
      'imageUrl': imageUrl,
    };
  }

  factory MuscleImage.fromJson(Map<String, dynamic> json) {
    return MuscleImage(
      muscle: json['muscle'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }
}
