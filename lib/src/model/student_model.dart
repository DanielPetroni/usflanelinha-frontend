class Student {
  int? ra;
  String? nome;
  String? email;
  String? telefone;

  Student({this.ra, this.nome, this.email, this.telefone});

  Student.fromJson(Map<String, dynamic> json) {
    ra = json['ra'];
    nome = json['nome'];
    email = json['email'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ra'] = this.ra;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    return data;
  }
}
