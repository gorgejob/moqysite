class SecuritModel {
  final String title;
  final double withOpacity;
  final double fontsize;
  SecuritModel({
    required this.title,
    required this.withOpacity,
    required this.fontsize,
  });
  static List<SecuritModel> listSecurit = [
    SecuritModel(title: "سياسة الخصوصية", withOpacity: 1, fontsize: 1.2),
    SecuritModel(
      title:
          "مرحبًا بك في تطبيق أغاني مهرجانات بدون نت. تحرص moqysite على حماية خصوصيتك وبياناتك الشخصية أثناء استخدام التطبيق. باستخدامك للتطبيق، فإنك توافق على شروط هذه السياسة.",
      withOpacity: 0.6,
      fontsize: 1,
    ),
    SecuritModel(title: "1. جمع البيانات", withOpacity: 1, fontsize: 1.2),
    SecuritModel(
      title:
          "التطبيق يعمل بدون اتصال بالإنترنت ويعتمد على الملفات المخزنة محليًا على جهازك.\n\nلا يتم جمع أي بيانات شخصية تلقائيًا، مثل الاسم أو البريد الإلكتروني أو الموقع الجغرافي، إلا إذا اخترت استخدام ميزات اختيارية تتطلب ذلك (مثل إرسال تقرير خطأ).",
      withOpacity: 0.6,
      fontsize: 1,
    ),
    SecuritModel(title: "2. استخدام البيانات", withOpacity: 1, fontsize: 1.2),
    SecuritModel(
      title:
          "البيانات المخزنة محليًا تُستخدم فقط لتشغيل التطبيق وتحسين تجربة الاستماع، مثل قوائم الأغاني والإعدادات الشخصية.\n\nالتطبيق مخصص فقط لقوائم الأغاني، ولا يشمل أي محتوى آخر.\n\nإذا قمت بإرسال تقارير أعطال أو رسائل دعم، تُستخدم هذه المعلومات فقط لتحسين التطبيق وإصلاح المشاكل.",
      withOpacity: 0.6,
      fontsize: 1,
    ),
    SecuritModel(
      title: "3. المشاركة مع أطراف أخرى",
      withOpacity: 1,
      fontsize: 1.2,
    ),
    SecuritModel(
      title:
          "لا نشارك بياناتك مع أي جهة خارجية لأغراض تجارية أو تسويقية.\n\nقد نكشف عن معلومات تقنية أو تقارير أعطال لمزودي خدمات محددين لتحسين جودة التطبيق أو للامتثال للقوانين إذا اقتضى الأمر.",
      withOpacity: 0.6,
      fontsize: 1,
    ),
    SecuritModel(title: "4. الأمان", withOpacity: 1, fontsize: 1.2),
    SecuritModel(
      title:
          "البيانات المخزنة على جهازك محمية، لكن يرجى ملاحظة أن أي نظام إلكتروني لا يمكن ضمان أمانه بنسبة 100%.\n\nيمكنك حذف التطبيق أو مسح بياناته في أي وقت لإزالة المعلومات المحلية.",
      withOpacity: 0.6,
      fontsize: 1,
    ),
    SecuritModel(title: "5. تحديثات السياسة", withOpacity: 1, fontsize: 1.2),
    SecuritModel(
      title:
          "قد يتم تعديل هذه السياسة من وقت لآخر. سيتم إشعار المستخدم عند وجود تغييرات جوهرية.",
      withOpacity: 0.6,
      fontsize: 1,
    ),
    SecuritModel(
      title:
          "تم إنشاء هذه السياسة بواسطة moqysite\nمدير الشركة: مدير الشركه\nمدير التطبيقات: جورج صبحي ",
      withOpacity: 1,
      fontsize: 1.1,
    ),
  ];
}
