class ProjectList {
  String name;
  String date;
  String amount;

  ProjectList(
      {required this.name, required this.date, required this.amount});
}

List getProjectList() {
  return [
    ProjectList(
      name: "End of Year Party 2022",
      date: "Nov 30, 2022",
      amount: 'N50,000'
    ),
    ProjectList(
        name: "External Road Construction",
        date: "Jan 30, 2022",
        amount: 'N500,000'
    ),
    ProjectList(
        name: "External Road Construction",
        date: "Jan 30, 2022",
        amount: 'N500,000'
    ),
  ];
}