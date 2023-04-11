import 'package:flutter/material.dart';

class AppBarTabsAssemblyGral extends StatelessWidget {
  final String? title;
  final List<dynamic>? tabsTitle;
  final List<Widget>? tabsContent;

  final Color? colorBack;
  final String pageBack;
  final bool leadingBack;

  final ValueChanged<int>? onTap;
  final int? index;
  final TabController? tabController;

  const AppBarTabsAssemblyGral({
    Key? key,
    this.title,
    this.tabsTitle,
    this.tabsContent,
    this.onTap,
    this.index,
    this.colorBack,
    this.pageBack = '',
    this.leadingBack = true,
    this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsContent!.length,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(249, 250, 254, 1),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            final TabController tabController =
                DefaultTabController.of(context)!;

            tabController.addListener(() {
              dynamic currentTab = tabsTitle![tabController.index];
              if (currentTab['title'] is Text) {
                if (currentTab['title']!.data == 'Edificio') {
                  tabController.index = 0;
                } else {
                  onTap?.call(tabController.index);
                }
              } else {
                onTap?.call(tabController.index);
              }
            });

            if (index != null) tabController.index = index!;

            return <Widget>[
              new SliverAppBar(
                title: Text(title.toString()),
                leading: leadingBack
                    ? BackButton(
                        color:
                            colorBack != null ? colorBack : Color(0xffffffff),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, pageBack); // Navigator.pop(context);
                        },
                      )
                    : null,
                centerTitle: true,
                floating: true,
                pinned: true,
                snap: true,
                elevation: 5.0,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                  
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0, 0.5),
                      colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                    ),
                  ),
                ),
                bottom: TabBar(
                  controller: tabController,
                  onTap: (value) {
                    onTap?.call(value);
                  },
                  tabs: [
                    for (dynamic item in tabsTitle!)
                      GestureDetector(
                        onTap: () {
                          if (item['title'] is Text) {
                            String title = item['title']!.data;
                            if (title == 'Edificio') {
                              tabController.index = 0;
                            }
                          }
                        },
                        child: Tab(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (item['icon'] != null) ...[
                                  Container(
                                    width: 22.0,
                                    height: 22.0,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xff8C81FE),
                                            Color(0xFF776BF8)
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                            color: Color(0xff7E72FF)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0X3A3A3A),
                                              offset: Offset(0, 10),
                                              blurRadius: 10),
                                        ]),
                                    child: Center(
                                        child: Icon(
                                      item['icon'],
                                      color: Color(0xffffffff),
                                      size: 19.0,
                                    )),
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(width: 10.0),
                                ],
                                item['title']
                              ]),
                        ),
                      )
                  ],
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: tabsContent!
            
          ),
        ),
      ),
    );
  }
}
