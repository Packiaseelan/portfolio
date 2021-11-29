class ExperienceModel {
  final String nameOfOrganization;
  final String position;
  final DateTime joiningDate;
  final DateTime? relievingDate;

  ExperienceModel({
    required this.nameOfOrganization,
    required this.position,
    required this.joiningDate,
    this.relievingDate,
  });
}

var experiences = [
  ExperienceModel(
    nameOfOrganization: 'Publicis Sapient',
    position: 'Senior Associate',
    joiningDate: DateTime(2021, 07, 09),
  ),
  ExperienceModel(
    nameOfOrganization: 'DSRC',
    position: 'Software Developer',
    joiningDate: DateTime(2016, 08, 10),
    relievingDate: DateTime(2021, 07, 06),
  ),
];
