class User {
   String? name;
   String? lastName;
   String? email;
   String? rg;
   String? cellPhone;
   String? landlinePhone;
   String? cpf;
   String? password;
   String? street;
   String? city;
   String? uf;
   String? zipCode;

  User({
     this.name,
     this.lastName,
     this.email,
     this.rg,
     this.cellPhone,
     this.landlinePhone,
     this.cpf,
     this.password,
     this.street,
     this.city,
     this.uf,
     this.zipCode,
  });
  

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      rg: json['rg'],
      cellPhone: json['cellPhone'],
      landlinePhone: json['landlinePhone'],
      cpf: json['cpf'],
      password: json['password'],
      street: json['street'],
      city: json['city'],
      uf: json['uf'],
      zipCode: json['zipCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'email': email,
      'rg': rg,
      'cellPhone': cellPhone,
      'landlinePhone': landlinePhone,
      'cpf': cpf,
      'password': password,
      'street': street,
      'city': city,
      'uf': uf,
      'zipCode': zipCode,
    };
  }
}
