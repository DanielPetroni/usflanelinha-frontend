class Vacanancy {
  int? id;
  int? numero;
  String? tipo;
  bool? active;
  int? rua;

  Vacanancy({this.id, this.numero, this.tipo, this.active, this.rua});

  Vacanancy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numero = json['numero'];
    tipo = json['tipo'] == 'CAR'
        ? 'CARRO'
        : json['tipo'] == 'MOTORBIKE'
            ? 'MOTO'
            : "ÔNIBUS";
    active = json['status'] == 1 ? true : false;
    rua = json['rua'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['numero'] = numero;
    data['tipo'] = tipo;
    data['status'] = active;
    data['rua'] = rua;
    return data;
  }
}
