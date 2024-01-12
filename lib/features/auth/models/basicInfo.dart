import 'dart:convert';

class BasicInfo {
  String gender;
  String variant;
  String blood;
  BasicInfo({
    required this.gender,
    required this.variant,
    required this.blood,
  });

  BasicInfo copyWith({
    String? gender,
    String? variant,
    String? blood,
  }) {
    return BasicInfo(
      gender: gender ?? this.gender,
      variant: variant ?? this.variant,
      blood: blood ?? this.blood,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'gender': gender});
    result.addAll({'variant': variant});
    result.addAll({'blood': blood});
  
    return result;
  }

  factory BasicInfo.fromMap(Map<String, dynamic> map) {
    return BasicInfo(
      gender: map['gender'] ?? '',
      variant: map['variant'] ?? '',
      blood: map['blood'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BasicInfo.fromJson(String source) => BasicInfo.fromMap(json.decode(source));

  @override
  String toString() => 'BasicInfo(gender: $gender, variant: $variant, blood: $blood)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BasicInfo &&
      other.gender == gender &&
      other.variant == variant &&
      other.blood == blood;
  }

  @override
  int get hashCode => gender.hashCode ^ variant.hashCode ^ blood.hashCode;
}
