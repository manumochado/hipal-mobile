import 'dart:async';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/publications/bloc/publication_bloc.dart';
import 'package:hipal/components/publications/model/publication_in_list.dart';

import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/publications/model/publication_in_list_by_residential.dart';
import 'package:hipal/components/publications/ui/screens/screen_provider.dart';
import 'package:hipal/widgets/card_container_custom.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ScreenPublication extends StatefulWidget {
  PublicationInListByResidential? publication;
  bool comeFromNotifications;
  ScreenPublication(
      {Key? key, this.publication, this.comeFromNotifications = false})
      : super(key: key);

  _ScreenPublication createState() => _ScreenPublication();
}

class _ScreenPublication extends State<ScreenPublication> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<PublicationInList> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PublicationBloc, PublicationState>(
        builder: (context, state) {
      if (!state.isLoading && widget.comeFromNotifications) {
        widget.publication = PublicationInListByResidential(
          createdAt: state.createdAt,
          provider: state.provider,
          file: state.file,
          id: state.id ?? '',
          isPublic: state.isPublic ?? true,
          name: state.name ?? '',
          text: state.text ?? '',
          type: state.type ?? '',
          updatedAt: state.updatedAt ?? '',
        );
        // load more publications by provider
        BlocProvider.of<PublicationsBloc>(context).add(
          LoadPublicationsByProvider(
            context,
            state.provider?.id,
            state.id ?? '',
          ),
        );
      }
      return Scaffold(
          body: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: const Color(0xff6456EB),
                  ),
                )
              : _bodyPulication(),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")));
    });
  }

  Widget _imgProfileProvider(String? url,
      {required double width, required double height}) {
    if (url != null) {
      return CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: BoxFit.fill,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    }

    return Image.asset(
      "assets/images/users.png",
      width: 50,
      fit: BoxFit.cover,
    );
  }

  Widget headerAreaChild() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (widget.comeFromNotifications) {
                      Navigator.pushNamed(context, "notification");
                    } else {
                      Navigator.pushNamed(context, "publications");
                    }
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                _imgProfileProvider(widget.publication?.provider?.img,
                    width: 60, height: 50),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff8173FC), // background
                    onPrimary: Colors.white,
                    maximumSize: Size(120, 30),
                    minimumSize: Size(120, 30) // foreground
                    ),
                onPressed: (widget.publication?.provider?.company?.pageWeb !=
                            null &&
                        widget.publication?.provider?.company!.pageWeb != '')
                    ? () async {
                        Uri url = Uri.parse(
                            widget.publication?.provider?.company!.pageWeb ??
                                '');

                        if (url.host.isEmpty) {
                          url = Uri.https(
                              widget.publication?.provider?.company!.pageWeb ??
                                  '',
                              '');
                        }
                        // open url
                        await launchUrl(url);
                      }
                    : null,
                child: Text(
                  'Visitar',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _imgHeaderImgPublication(String url) {
    final size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: url,
      height: size.height * 0.30,
      width: size.width,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _bodyPulication() {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        widget.publication?.type == "Foto"
            ? (widget.publication?.file != null
                ? _imgHeaderImgPublication(widget.publication?.file ?? '')
                : Container(
                    height: size.height * 0.30,
                    color: Color(0xff6456EB),
                  ))
            : Container(
                height: size.height * 0.30,
                color: Color(0xff6456EB),
              ),
        SizedBox(
          height: size.height,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.28,
                child: headerAreaChild(),
              ),
              SizedBox(
                height: size.height * 0.33,
                child: CardContainerCustom(
                  edgeInsets: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 30,
                    bottom: 20,
                  ),
                  child: bodyContent(),
                ),
              ),
              Container(
                height: size.height * 0.33,
                color: Color(0xffEFF3FE),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: morePublications(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bodyHeader() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ScreenProvider(
                    provider: widget.publication?.provider,
                  )),
        );
      },
      child: ListTile(
        leading: Transform.translate(
          offset: Offset(-16, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: _imgProfileProvider(widget.publication?.provider?.img,
                width: 60, height: 60),
          ),
        ),
        title: Transform.translate(
          offset: Offset(-16, 0),
          child: Text(
            widget.publication?.provider?.company?.name ?? '',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.purple, fontSize: 15),
          ),
        ),
        subtitle: Transform.translate(
          offset: Offset(-16, 0),
          child: Text(
            widget.publication?.provider?.company?.bussinnes ?? '',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fecha de publicación',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 9,
              ),
            ),
            Text(
              widget.publication?.createdAtLocal ?? '',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyHeader(),
        SizedBox(height: 15),
        Text(
          widget.publication?.name ?? '',
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 90,
          child: SingleChildScrollView(
            child: Text(
              widget.publication?.text ?? '',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget morePublications() {
    return Column(children: [
      ListTile(
        title: Text(
          'Mas Publicaciones:',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Consulta otras publicaciones de ${widget.publication?.provider?.company?.name}',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
      ),
      BlocBuilder<PublicationsBloc, PublicationsState>(
          builder: (context, state) {
        items = (state.publications.length > 0 ? state.publications : []);
        return state.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: const Color(0xff6456EB),
                ),
              )
            : Container(
                height: 120,
                child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    controller: _refreshController,
                    onRefresh: () async {
                      BlocProvider.of<PublicationsBloc>(context).add(
                          LoadRefreshPublications(
                              context,
                              widget.publication?.provider?.id,
                              widget.publication?.id ?? ''));
                      await Future.delayed(Duration(milliseconds: 1000));
                      _refreshController.refreshCompleted();
                    },
                    onLoading: () async {
                      BlocProvider.of<PublicationsBloc>(context).add(
                          LoadMorePublications(
                              context,
                              widget.publication?.provider?.id,
                              widget.publication?.id ?? ''));
                      await Future.delayed(Duration(milliseconds: 1000));
                      _refreshController.loadComplete();
                    },
                    child: items.length > 0
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (c, i) => _publicationAditional(i),
                            itemCount: items.length,
                            // ],
                          )
                        : Padding(
                            padding: EdgeInsets.only(bottom: 40),
                            child: Center(
                              child: Text(
                                "Sin publicaciones..",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
              );
      })
    ]);
  }

  Widget _imgInMorePublication(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _publicationAditional(int i) {
    return InkWell(
      onTap: () {},
      child: Card(
          color: items[i].type == 'Foto' &&
                  items[i].file != '' &&
                  items[i].file != null
              ? Colors.transparent
              : Color(0xFFE7E4FB),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: items[i].type == 'Foto' &&
                        items[i].file != '' &&
                        items[i].file != null
                    ? Colors.transparent
                    : Color(0xFFE7E4FB)),
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Container(
            width: 130,
            height: 40,
            child: items[i].type == 'Foto' &&
                    items[i].file != '' &&
                    items[i].file != null
                ? _imgInMorePublication(
                    items[i].file ?? '',
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Publicación:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        items[i].name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          )),
    );
  }
}
