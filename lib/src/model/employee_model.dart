class Employee {
  int? rf;
  String? nome;
  String? email;
  String? telefone;

  Employee({this.rf, this.nome, this.email, this.telefone});

  Employee.fromJson(Map<String, dynamic> json) {
    rf = json['rf'];
    nome = json['nome'];
    email = json['email'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rf'] = this.rf;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    return data;
  }
}
