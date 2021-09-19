class User {
  int idUser;
  String email;
  String noHp;
  String namaUser;
  String kodeAkses;
  String passwordUser;
  
  User(
  this.idUser, 
  this.email,
  this.noHp,
  this.namaUser,
  this.kodeAkses,
  this.passwordUser,

  );

  factory User.fromJson(Map<String, dynamic> json) => User(
        int.parse(json['id_user']),
        json['email'],
        json['no_hp'],
        json['nama_user'],
        json['kode_akses'],        
        json['password_user'],
      );

  Map<String, dynamic> toJson() => {
        'id_user': idUser.toString(),
        'email': email,
        'no_hp': noHp ,
        'nama_user': namaUser,
        'kode_akses': kodeAkses,
        'password_user': passwordUser,
      };
}
