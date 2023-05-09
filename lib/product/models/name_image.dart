import 'package:equatable/equatable.dart';

class NameImage with EquatableMixin {
  String? muscle;
  String? name;
  String? imageUrl;

  NameImage({
    this.muscle,
    this.name,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [muscle, name, imageUrl];

  NameImage copyWith({
    String? muscle,
    String? name,
    String? imageUrl,
  }) {
    return NameImage(
      muscle: muscle ?? this.muscle,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'muscle': muscle,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory NameImage.fromJson(Map<String, dynamic> json) {
    return NameImage(
      muscle: json['muscle'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }
}
