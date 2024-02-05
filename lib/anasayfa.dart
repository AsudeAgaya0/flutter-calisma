import 'package:flutter/material.dart';
import 'package:flutter_tasarim_calismasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}
//left - start - leading : aynı anlamdalar
//right - end - trailing : aynı anlamdalar
class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) { //sayfayla ilgili tasarımlar build içinde olacak
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    print("Ekran Yüksekliği: ${ekranYuksekligi}");
    print("Ekran Genişliği: ${ekranGenisligi}");

    var d = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza", style: TextStyle(color: yaziRenk1, fontFamily: "Pacifico", fontSize: ekranGenisligi/19),),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [ //Container ın boyutu belirlenmediği sürece en büyüğe sahip olanın büyüklüğünü alır
      //     Container(width: 100, height: 100, color: Colors.red,),
      //     Container(width: 50, height: 50, color: Colors.blue,),
      //     Container(width: 80, height: 80, color: Colors.green,),
      //   ],
      // )
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ekranYuksekligi/43),
            child: Text(d!.pizzaBaslik, style: TextStyle(fontSize: 36, color: anaRenk, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Image.asset("resimler/pizza_resim.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [//yukarıda bir kere null olamaz deyince bunlara ! koymaya gerek kalmadı
                Chip(icerik: d.peynirYazi),
                Chip(icerik: d.sucukYazi),
                Chip(icerik: d.zeytinYazi),
                Chip(icerik: d.biberYazi),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Text(d.teslimatSure, style: TextStyle(fontSize: 22, color: yaziRenk2, fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(d.teslimatBaslik, style: TextStyle(fontSize: 22, color: anaRenk, fontWeight: FontWeight.bold),),
                ),
                Text(d.pizzaAciklama,
                  style: TextStyle(fontSize: 22, color: yaziRenk2,),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text(d.fiyat, style: TextStyle(fontSize: 44, color: anaRenk, fontWeight: FontWeight.bold),),
                const Spacer(), //arada bulunan tüm boşluğu kullandı, birbirlerinden ayırdı
                SizedBox(//görsel nesnenin boyutlarını düzenlemek için
                  width: 200,
                  height: 50,
                  child: TextButton(onPressed: (){},
                    style: TextButton.styleFrom(
                        backgroundColor: anaRenk,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    child: Text(d.buttonYazi, style: TextStyle(color: yaziRenk1, fontSize: 18),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//özelleştirilmiş widget
class Chip extends StatelessWidget {
  String icerik;
  Chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},
      style: TextButton.styleFrom(backgroundColor: anaRenk),
      child: Text(icerik, style: TextStyle(color: yaziRenk1),),
    );
  }
}

