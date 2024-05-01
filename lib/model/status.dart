enum Status {
  playing(value: "Playing"),
  planning(value: "Planning"),
  passed(value: "Passed"),
  abandoned(value: "Abandoned");

  const Status({required this.value});

  final String value;
}
