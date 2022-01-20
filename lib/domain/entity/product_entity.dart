class ProductEntity {
  final String identificador;
  final String titulo;
  final String tipo;
  final String? descricao;
  final String arquivo;
  final double altura;
  final double largura;
  final double preco;
  final int nota;
  final String criado;

  ProductEntity({
    required this.identificador,
    required this.titulo,
    required this.tipo,
    required this.descricao,
    required this.arquivo,
    required this.altura,
    required this.largura,
    required this.preco,
    required this.nota,
    required this.criado,
  });
}
