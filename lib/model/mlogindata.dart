class MLoginData {
  MLoginData({
    this.mAkunId,
    this.mAkunNamapengguna,
    this.mAkunEmail,
    this.mAkunLinkPhoto,
    this.mToken,
  });

  MLoginData.fromJson(dynamic json) {
    mAkunId = json['m_akun_id'];
    mAkunNamapengguna = json['m_akun_namapengguna'];
    mAkunEmail = json['m_akun_email'];
    mAkunLinkPhoto = json['m_akun_link_photo'];
    mToken = json['m_token'];
  }

  int? mAkunId;
  String? mAkunNamapengguna;
  String? mAkunEmail;
  String? mAkunLinkPhoto;
  String? mToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['m_akun_id'] = mAkunId;
    map['m_akun_namapengguna'] = mAkunNamapengguna;
    map['m_akun_email'] = mAkunEmail;
    map['m_akun_link_photo'] = mAkunLinkPhoto;
    map['m_token'] = mToken;
    return map;
  }
}
