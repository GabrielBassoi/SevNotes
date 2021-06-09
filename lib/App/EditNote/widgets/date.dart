final List<String> month = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "June",
  "July",
  "Aug",
  "Sept",
  "Oct",
  "Nov",
  "Dec",
];

final DateTime time = DateTime.now();

String date() {
  return "${month[(time.month) - 1]} ${time.day}, ${time.year}";
}
