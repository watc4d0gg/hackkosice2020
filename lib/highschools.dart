const postova = HighSchool(
  name: "Gymnázium, Poštová 9, Košice",
  classTypes: ["všeobecná", "anglická", "matematická"],
  studyLength: 4,
  contact: [
    "Poštová 9, Košice",
    "055/6226604",
    "revesz@gympos.sk",
    "Mgr. Otto Révész"
  ],
  info:
      "Naše gymnázium v historickej budove v centre Košíc už takmer päťdesiat rokov plní svoje poslanie: kvalitne pripraviť žiakov na vysokoškolské štúdium. Sme hrdí na to, že nás vyhľadávajú ďalšie generácie našich absolventov, ktorým, rovnako ako pred rokmi ich rodičom, učarovala škola tradičná a progresívna zároveň. ",
  infoTitle: "Škola s tradíciou",
  practiceTests: [
    "https://www.gympos.sk/files/vyskusajte-sa/test_PS_2014.htm",
    "https://www.gympos.sk/files/vyskusajte-sa/test_PS_SJL.htm"
  ],
  succesrate: 56.3,
  date: "19.Máj - 18.Júl",
  vidUrl:
      "https://drive.google.com/file/d/1Z4SL1Q-U_4pVHy6ehoTKkIXvzEz0Wbpo/view?usp=sharing",
  students: 513,
);

const courses = <String, List<String>>{
  "Lekárska fakulta": ["Biológia", "Chémia", "Fyzika"],
  "Biológia": ["Biológia"],
  "Chémia": ["Chémia"],
  "Fyzika": ["Fyzika"],
  "Geografia": ["Geografia"],
  "Informatika": ["Informatika"],
  "Matematika": ["Matematika"],
  "Všeobecná ekológia": ["Biológia", "Chémia", "Geografia"],
  "Fakulta verejnej správy": [
    "Občianska náuka",
    "Slovenský jazyk a literatúra"
  ],
  "Filozofia": ["Občianska náuka", "Dejepis"],
  "Právnická fakulta": ["Občianska náuka", "Dejepis"],
  "Sekuritné vedy": ["Informatika"],
};

class HighSchool {
  final String name;
  final List<String> classTypes;
  final int studyLength;
  final List<String> contact;
  final String info;
  final String infoTitle;
  final List<String> practiceTests;
  final double succesrate;
  final String date;
  final String vidUrl;
  final int students;

  const HighSchool(
      {this.name,
      this.students,
      this.infoTitle,
      this.classTypes,
      this.studyLength,
      this.contact,
      this.info,
      this.practiceTests,
      this.succesrate,
      this.date,
      this.vidUrl});
}