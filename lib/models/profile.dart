class Profile {
  final String id;
  final String name;

  Profile({
    required this.id,
    required this.name,
  });
}

final profiles =
    List.generate(60, (index) => Profile(id: '$index', name: 'Name$index'));
