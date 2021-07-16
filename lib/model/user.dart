class User {
   String browser;
   int id;
   String username;
   String password;
   String firstName;
   String LastName;
   String email;
   String picture;
   String folder;
   int registrationDate;
   int lastLogin;
   String affiliation;
   String country;
   String provState;
   String city;
   int nbConnect;
   String ipAdress;
   String profile;
   String logStatus;
   int idCategory;
   String office;

  User({
    required this.browser,
    required this.firstName,
    required this.LastName,
    required this.email,
    required this.picture,
    required this.folder,
    required this.registrationDate,
    required this.lastLogin,
    required this.affiliation,
    required this.country,
    required this.provState,
    required this.city,
    required this.nbConnect,
    required this.ipAdress,
    required this.profile,
    required this.logStatus,
    required this.idCategory,
    required this.office,
    required this.id,
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      browser: json['browser'] as String,
      id: json['id'] as int,
      username: json['username'] as String,
      password: json['Password'] as String,
      firstName: json['first_name'] as String,
      LastName: json['Last_name'] as String,
      email: json['email'] as String,
      picture: json['picture'] as String,
      folder: json['folder'] as String,
      registrationDate: json['registration_date'] as int,
      lastLogin: json['last_login'] as int,
      affiliation: json['affiliation'] as String,
      country: json['country'] as String,
      provState: json['prov_state'] as String,
      city: json['city'] as String,
      nbConnect: json['nb_connect'] as int,
      ipAdress: json['ip_address'] as String,
      profile: json['profile'] as String,
      logStatus: json['log_status'] as String,
      idCategory: json['id_category'] as int,
      office: json['office'] as String,
    );
  }
}
