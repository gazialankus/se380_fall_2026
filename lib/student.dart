class Student {
  final String firstName;
  final String lastName;
  final int age;
  final bool graduated;

  Student({
    required this.firstName,
    required this.lastName,
    required this.age,
    this.graduated = false,
  });
}
