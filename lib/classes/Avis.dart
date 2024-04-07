class Avis {
  final int idUtilisateurDonateur;
  final int idUtilisateurReceveur;
  final String commentaire;
  final int note;

  Avis({
    required this.idUtilisateurDonateur,
    required this.idUtilisateurReceveur,
    required this.commentaire,
    required this.note,
  });

  // Méthode pour convertir un objet Avis en Map (pour l'insertion dans la base de données)
  Map<String, dynamic> toMap() {
    return {
      'idUtilisateurDonateur': idUtilisateurDonateur,
      'idUtilisateurReceveur': idUtilisateurReceveur,
      'commentaire': commentaire,
      'note': note,
    };
  }

  // Constructeur à partir d'un Map (récupéré depuis la base de données)
  factory Avis.fromMap(Map<String, dynamic> map) {
    return Avis(
      idUtilisateurDonateur: map['idUtilisateurDonateur'],
      idUtilisateurReceveur: map['idUtilisateurReceveur'],
      commentaire: map['commentaire'],
      note: map['note'],
    );
  }
}