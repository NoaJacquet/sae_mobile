class Pret {
  final int idAnnonce;
  final int idUtilisateur;
  final String dateDebutPret;
  final String dateFinPret;
  final String etatPret;

  Pret({
    required this.idAnnonce,
    required this.idUtilisateur,
    required this.dateDebutPret,
    required this.dateFinPret,
    required this.etatPret,
  });

  // Méthode pour convertir un objet Pret en Map (pour l'insertion dans la base de données)
  Map<String, dynamic> toMap() {
    return {
      'idAnnonce': idAnnonce,
      'idUtilisateur': idUtilisateur,
      'dateDebutPret': dateDebutPret,
      'dateFinPret': dateFinPret,
      'etatPret': etatPret,
    };
  }

  // Constructeur à partir d'un Map (récupéré depuis la base de données)
  factory Pret.fromMap(Map<String, dynamic> map) {
    return Pret(
      idAnnonce: map['idAnnonce'],
      idUtilisateur: map['idUtilisateur'],
      dateDebutPret: map['dateDebutPret'],
      dateFinPret: map['dateFinPret'],
      etatPret: map['etatPret'],
    );
  }
}