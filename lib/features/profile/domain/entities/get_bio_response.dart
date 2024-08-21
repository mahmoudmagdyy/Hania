import 'package:equatable/equatable.dart';

class GetBioResponse extends Equatable{
  final bool success;
  final String message;
  final BioData data;

  const GetBioResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
    data,
  ];
}


class BioData extends Equatable {
  final int id;
  final FirstName? firstName;
  final LastName? lastName;
  final Bio? bio;

  const BioData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.bio,
  });

  BioData copyWith({
    int? id,
    FirstName? firstName,
    LastName? lastName,
    Bio? bio,
  }) {
    return BioData(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      bio: bio ?? this.bio,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    firstName,
    lastName,
    bio,
  ];

}

class Bio extends Equatable {
  final String ar;
  final String en;

  const Bio({
    required this.ar,
    required this.en,
  });

  Bio copyWith({
    String? ar,
    String? en,
  }) {
    return Bio(
      ar: ar ?? this.ar,
      en: en ?? this.en,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    ar,
    en,
  ];

}

class LastName extends Equatable {
  final String ar;
  final String en;

  const LastName({
    required this.ar,
    required this.en,
  });

  LastName copyWith({
    String? ar,
    String? en,
  }) {
    return LastName(
      ar: ar ?? this.ar,
      en: en ?? this.en,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    ar,
    en,
  ];

}

class FirstName extends Equatable {
  final String ar;
  final String en;

  const FirstName({
    required this.ar,
    required this.en,
  });

  FirstName copyWith({
    String? ar,
    String? en,
  }) {
    return FirstName(
      ar: ar ?? this.ar,
      en: en ?? this.en,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    ar,
    en,
  ];

}


