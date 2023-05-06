class BillingData {
  String? apartment;
  String? email;
  String? floor;
  String? firstName;
  String? street;
  String? building;
  String? phoneNumber;
  String? shippingMethod;
  String? postalCode;
  String? city;
  String? country;
  String? lastName;
  String? state;

  BillingData(
      {this.apartment='NA',
      this.email='NA',
      this.floor='NA',
      this.firstName='NA',
      this.street='NA',
      this.building='NA',
      this.phoneNumber,
      this.shippingMethod='NA',
      this.postalCode='NA',
      this.city='NA',
      this.country='NA',
      this.lastName='NA',
      this.state='NA'});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apartment'] = apartment;
    data['email'] = email;
    data['floor'] = floor;
    data['first_name'] = firstName;
    data['street'] = street;
    data['building'] = building;
    data['phone_number'] = phoneNumber;
    data['shipping_method'] = shippingMethod;
    data['postal_code'] = postalCode;
    data['city'] = city;
    data['country'] = country;
    data['last_name'] = lastName;
    data['state'] = state;
    return data;
  }
}