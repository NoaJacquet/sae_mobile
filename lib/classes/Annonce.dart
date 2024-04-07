class Annonce {
  final String titreAnnonce;
  final String descriptionAnnonce;
  final String categorieAnnonce;
  final String datePublicationAnnonce;

  Annonce({
    required this.titreAnnonce,
    required this.descriptionAnnonce,
    required this.categorieAnnonce,
    required this.datePublicationAnnonce,
  });

  // Méthode pour convertir un objet Annonce en Map (pour l'insertion dans la base de données)
  Map<String, dynamic> toMap() {
    return {
      'titreAnnonce': titreAnnonce,
      'descriptionAnnonce': descriptionAnnonce,
      'categorieAnnonce': categorieAnnonce,
      'datePublicationAnnonce': datePublicationAnnonce,
    };
  }

  // Constructeur à partir d'un Map (récupéré depuis la base de données)
  factory Annonce.fromMap(Map<String, dynamic> map) {
    return Annonce(
      titreAnnonce: map['titreAnnonce'],
      descriptionAnnonce: map['descriptionAnnonce'],
      categorieAnnonce: map['categorieAnnonce'],
      datePublicationAnnonce: map['datePublicationAnnonce'],
    );
  }
}