class Building {
  String name;
  double lat;
  double lng;
  Building({required this.name, required this.lat, required this.lng});

  bool operator ==(dynamic other) {
    return other is Building && this.name == other.name;
  }

  @override
  int get hashcode {
    return this.name.hashCode;
  }
}
