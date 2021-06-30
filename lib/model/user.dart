class User {
   String browser;
   int Id;
   String username;
   String Password;
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
   String ip_address;
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
    required this.ip_address,
    required this.profile,
    required this.logStatus,
    required this.idCategory,
    required this.office,
    required this.Id,
    required this.username,
    required this.Password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      browser: json['browser'] as String,
      Id: json['Id'] as int,
      username: json['username'] as String,
      Password: json['Password'] as String,
      firstName: json['firstName'] as String,
      LastName: json['LastName'] as String,
      email: json['email'] as String,
      picture: json['picture'] as String,
      folder: json['folder'] as String,
      registrationDate: json['registrationDate'] as int,
      lastLogin: json['lastLogin'] as int,
      affiliation: json['affiliation'] as String,
      country: json['country'] as String,
      provState: json['provState'] as String,
      city: json['city'] as String,
      nbConnect: json['nbConnect'] as int,
      ip_address: json['ip_address'] as String,
      profile: json['profile'] as String,
      logStatus: json['logStatus'] as String,
      idCategory: json['idCategory'] as int,
      office: json['office'] as String,
    );
  }
}
