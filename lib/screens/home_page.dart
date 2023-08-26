import 'package:flutter/material.dart';
import 'package:get_it_done_ver0/models/items_data.dart';
import 'package:get_it_done_ver0/screens/setting_page.dart';
import 'package:provider/provider.dart';
import '../widgets/item_card.dart';
import 'item_adder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Ana Scaffold oluşturuluyor
    return Scaffold(
      ///FAB'ın konumu belirleniyor
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      ///AppBar oluşturuluyor
      appBar: buildAppBar(context),

      ///Ana gövde oluşturuluyor
      body: buildColumn(context),

      ///FAB oluşturuluyor
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  ///Column widget'ı oluşturuluyor
  Column buildColumn(BuildContext context) {
    return Column(
      children: [
        ///İlk genişletilebilir widget (Item sayısı)
        buildExpandedOne(context),

        ///İkinci genişletilebilir widget (Item listesi)
        buildExpandedTwo(context),
      ],
    );
  }

  ///İkinci genişletilebilir widget (Item listesi)
  Expanded buildExpandedTwo(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          /// Container'ın görünümünü oluşturuyoruz
          decoration: BoxDecoration(

              /// Arkaplan rengi beyaz olarak ayarlanıyor
              color: Colors.white,

              /// Kenar yuvarlatması için border-radius belirleniyor
              borderRadius: BorderRadius.all(Radius.circular(25))),

          ///ListView oluşturuluyor
          child: Padding(
            padding: const EdgeInsets.all(12.5),
            child: Consumer<ItemData>(
              builder: (context, itemData, child) => Align(
                /// itemData = Provider.of<ItemData>(context)
                alignment: Alignment.topCenter,

                ///Liste elemanları oluşturuluyor
                child: ListView.builder(
                  /// ListView'ın kendisine sığdırılmasını sağlar
                  shrinkWrap: true,
                  /// Sıralamanın tersine çevrilmesini sağlar
                  reverse: true,
                  /// Gösterilecek eleman sayısı, itemData'dan geliyor
                  itemCount: itemData.items.length,
                  /// Her bir elemanın oluşturulduğu builder fonksiyonu
                  itemBuilder: (context, index) => ItemCard(
                    /// ItemCard bileşenine verileri geçiriyoruz
                    title: itemData.items[index].title,
                    isDone: itemData.items[index].isDone,
                    toggleStatus: (_) {
                      /// Durumun değiştirilmesi için toggleStatus fonksiyonunu çağırıyoruz
                      itemData.toggleStatus(index);
                    },
                    deleteItem: () {
                      /// Elemanın silinmesi için deleteItem fonksiyonunu çağırıyoruz
                      itemData.deleteItem(index);
                    },
                  ),
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }

  ///İlk genişletilebilir widget (Item sayısı)
  Expanded buildExpandedOne(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          ///İtem sayısı metni
          child: Text(
            /// Item sayısını görüntülemek için metin oluşturuyoruz
            '${Provider.of<ItemData>(context).items.length} Items',
            /// Tema verilerine göre metin stilini ayarlıyoruz
            style: Theme.of(context).textTheme.displaySmall,
          ),

        ),
      ),
    );
  }

  ///FAB (FloatingActionButton) oluşturuluyor
  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return buildFloatingButton(context);
  }

  ///FAB (FloatingActionButton) oluşturuluyor
  FloatingActionButton buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ///Alt sayfa açılıyor
        showModalBottomSheet(
          /// Bottom Sheet'in şeklini belirliyoruz
          shape: RoundedRectangleBorder(
            /// Bottom Sheet köşelerinin yuvarlatılması için border-radius belirliyoruz
            borderRadius: BorderRadiusDirectional.circular(25),
          ),
          /// Context'i geçiriyoruz
          context: context,
          /// Bottom Sheet içeriğini oluşturmak için builder fonksiyonu kullanıyoruz
          builder: (context) => SingleChildScrollView(
            /// ItemAdder bileşenini içeren SingleChildScrollView oluşturuyoruz
            child: ItemAdder(),
          ),
        );

      },
      child: Icon(Icons.add),
    );
  }

  ///AppBar oluşturuluyor
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      ///Sağ üst köşede settings ikonu
      actions: [buildIconButton(context)],

      ///Başlık metni
      title: Text(
        'Get It Done',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      centerTitle: true,
    );
  }

  ///Settings ikonu için IconButton oluşturuluyor
  IconButton buildIconButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.settings,
        size: 25,
      ),
      onPressed: () {
        ///Ayarlar sayfasına geçiş yapılıyor
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingPage(),
          ),
        );
      },
    );
  }
}
