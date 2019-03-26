// The base class for the different types of items the List can contain
abstract class RouteLog {}

// A ListItem that contains data to display a heading
class HeadingItem implements RouteLog {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class ClimbingRoute implements RouteLog {
  final String grade;

  ClimbingRoute(this.grade);
}
