import '../entities/vaccine.dart';

class VaccineFaker {
  List<Vaccine> vaccines = [];

  init() {
    Vaccine vaccine = Vaccine(
        id: 1,
        name: "Vacina contra Tuberculose (BCG)",
        description: "BCG, obtida a partir de bactéria viva atenuada.",
        startYear: 0,
        finalYear: 12);
    vaccines.add(vaccine);
    Vaccine vaccine2 = Vaccine(
        id: 1,
        name: "Vacina oral contra Poliomielite ou Paralisia Infantil (VOP)",
        description: "VOP, produzida a partir de polivírus vivo atenuado.",
        startYear: 0,
        finalYear: 12);
    vaccines.add(vaccine2);
    Vaccine vaccine3 = Vaccine(
        id: 1,
        name:
            "Vacina contra Difteria, Tétano, Coqueluche e Meningite causada por Haemopilhus (Vacina Tetravalente)",
        description:
            "Combinação da vacina contra difteria, tétano e coqueluche (DTP), feita com bactérias mortas e produtos de bactérias (toxinas), com a vacina contra Haemophilus Influenzae tipo b (Hib), produzida com substâncias da parede da bactéria.",
        startYear: 0,
        finalYear: 12);
    vaccines.add(vaccine3);
    Vaccine vaccine4 = Vaccine(
        id: 1,
        name: "Vacina contra Sarampo, Rubéola e Caxumba (Tríplice Viral – SRC)",
        description:
            "Combinação de vírus atenuados contra o sarampo e a rubéola.",
        startYear: 0,
        finalYear: 12);
    vaccines.add(vaccine4);
    Vaccine vaccine5 = Vaccine(
        id: 1,
        name: "Vacina contra Hepatite B",
        description:
            "Obtida por técnicas de engenharia genética, a partir de componentes do vírus da Hepatite B.",
        startYear: 0,
        finalYear: 12);
    vaccines.add(vaccine5);
    Vaccine vaccine6 = Vaccine(
        id: 1,
        name: "Vacina contra Febre Amarela",
        description: "Constituída de vírus vivos atenuados.",
        startYear: 0,
        finalYear: 12);
  }
}
