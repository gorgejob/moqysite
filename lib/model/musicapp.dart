import 'package:hive/hive.dart';
part 'musicapp.g.dart';
@HiveType(typeId: 0)
class Musicapp extends HiveObject {
  @HiveField(0)
  final String url;
  @HiveField(1)
  final String name;
  @HiveField(2)
  late  bool isFavorite;

  Musicapp({required this.url, required this.name,required this.isFavorite});

  Map<String, dynamic> toJson() => {
    'url': url,
    'name': name,
    'isFavorite': isFavorite,
  };
  // تحويل Map إلى كائن
  factory Musicapp.fromJson(Map<String, dynamic> json) => Musicapp(
    url: json['url'],
    name: json['name'],
    isFavorite: json['isFavorite'] ?? false,
  );

  static List<Musicapp> music = [
    Musicapp(url: "assets/1.mp3", name: "اجانص", isFavorite: false),
    Musicapp(url: "assets/2.mp3", name: "يا زميلي ", isFavorite: false),
    Musicapp(
      url: "assets/3.m4a",
      name: "اتخدعتو فى هدوئى وسكوتى",
      isFavorite: false,
    ),
    Musicapp(url: "assets/4.m4a", name: "اسمي مشرف جيهتي", isFavorite: false),
    Musicapp(url: "assets/5.m4a", name: "اعقل يا غشيم", isFavorite: false),
    Musicapp(
      url: "assets/6.mp3",
      name: "الحب الحب سينيوريتا",
      isFavorite: false,
    ),
    Musicapp(url: "assets/7.m4a", name: "الحبسة موضه", isFavorite: false),
    Musicapp(
      url: "assets/8.m4a",
      name: "العقل شاط والقلب مات",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/9.m4a",
      name: "العودة من بعد الغياب",
      isFavorite: false,
    ),
    Musicapp(url: "assets/10.mp3", name: "اللي جاي بتاعي", isFavorite: false),
    Musicapp(url: "assets/11.mp3", name: "انا البطل", isFavorite: false),
    Musicapp(url: "assets/12.m4a", name: "انا الطرش", isFavorite: false),
    Musicapp(url: "assets/13.m4a", name: "انا بخطف الانظار", isFavorite: false),
    Musicapp(url: "assets/14.mp3", name: "كاتم الانفاس", isFavorite: false),
    Musicapp(url: "assets/15.m4a", name: "كاتم ع النفس", isFavorite: false),
    Musicapp(
      url: "assets/16.m4a",
      name: "ملناش كبير كبيرنا فوق",
      isFavorite: false,
    ),
    Musicapp(url: "assets/17.m4a", name: "دكن دكن", isFavorite: false),
    Musicapp(url: "assets/18.mp3", name: "بعبع دايرتي", isFavorite: false),
    Musicapp(
      url: "assets/19.m4a",
      name: "انا لبسي الشيك غرك فيا",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/20.m4a",
      name: "انا لبسي اوفر سايز",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/21.m4a",
      name: "انا مش ديلر ي حكومه",
      isFavorite: false,
    ),
    Musicapp(url: "assets/22.m4a", name: "انا متلف كوكبي ", isFavorite: false),
    Musicapp(url: "assets/23.m4a", name: "انتا هتيجي معايا", isFavorite: false),
    Musicapp(url: "assets/24.m4a", name: "رجع القائد", isFavorite: false),
    Musicapp(
      url: "assets/25.m4a",
      name: "سوري مبردش انا بستوري",
      isFavorite: false,
    ),
    Musicapp(url: "assets/26.m4a", name: "عشري يبعني انا", isFavorite: false),
    Musicapp(
      url: "assets/27.mp3",
      name: "محكمه ودخلنا علي المفرمه",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/28.mp3",
      name: "غيبنا وغاب الابداع",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/29.m4a",
      name: "انا شاب شكلو بقا اكبر من سنو",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/30.mp3",
      name: "اول قفا يا بروسلي",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/31.mp3",
      name: "حالق موليت",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/32.mp3",
      name: "هو الصح فين",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/33.mp3",
      name: "خابط نفسي بسلاح حامي",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/34.mp3",
      name: "مليون وداع ياللي مشيتي",
      isFavorite: false,
    ),
    Musicapp(
      url: "assets/35.mp3",
      name: "انا لسه شب و الحياة قصادي طويلة",
      isFavorite: false,
    ),
  ];
}
