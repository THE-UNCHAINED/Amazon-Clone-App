class UserDetailModal {
  final String name;
  final String address;
  UserDetailModal({required this.name, required this.address});

  Map<String, dynamic> getJson() => {'name': name, 'address': address};
}
