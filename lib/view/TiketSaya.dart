import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:e_tiket_kapal_ta/component/buttunMoreVert.dart';

class MyTiketView extends StatefulWidget {
  const MyTiketView({super.key});

  @override
  State<MyTiketView> createState() => _MyTiketViewState();
}

class _MyTiketViewState extends State<MyTiketView>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiket Saya',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                alignment: AlignmentDirectional.bottomCenter,
                customButton: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                customItemsHeights: [
                  ...List<double>.filled(MenuItemsButton.firstItems.length, 48),
                  8,
                  ...List<double>.filled(
                      MenuItemsButton.secondItems.length, 48),
                ],
                items: <DropdownMenuItem>[
                  ...MenuItemsButton.firstItems.map(
                    (item) => DropdownMenuItem<MenuItemButtun>(
                      value: item,
                      child: MenuItemsButton.buildItem(item),
                    ),
                  ),
                  const DropdownMenuItem<Divider>(
                      enabled: false, child: Divider()),
                  ...MenuItemsButton.secondItems.map(
                    (item) => DropdownMenuItem<MenuItemButtun>(
                      value: item,
                      child: MenuItemsButton.buildItem(item),
                    ),
                  ),
                ],
                onChanged: (value) {
                  MenuItemsButton.onChanged(context, value as MenuItemButtun);
                },
                itemHeight: 45,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 110,
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabCtrl,
              unselectedLabelColor: Colors.blueGrey,
              indicatorColor: Colors.amber,
              tabs: const <Widget>[
                Tab(
                  text: 'Tiket Saya',
                  // child: RuteKapal(),
                ),
                Tab(
                  text: 'Riwayat',
                  // child: RuteKapal(),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TabBarView(
                  controller: _tabCtrl,
                  children: const [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
