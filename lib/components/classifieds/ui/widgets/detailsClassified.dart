import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hipal/components/classifieds/bloc/classified/classifieds_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classifiedComment/classified_comment_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classifiedLike/classifieds_like_bloc.dart';
import 'package:hipal/components/classifieds/model/classifiedComment.dart';
import 'package:hipal/components/classifieds/model/classifieds_response.dart';
import 'package:hipal/components/classifieds/ui/widgets/list_coment_classified.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:hipal/widgets/carousel_images.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hipal/serializers/image.dart' as ImageSerializer;

class DetailsClassified extends StatefulWidget {
  final String owner;
  DetailsClassified({required this.owner});

  createState() => _DetailsClassifiedState();
}

class _DetailsClassifiedState extends State<DetailsClassified> {
  String idUser = '';
  late ClassifiedsBloc classifiedBloc;
  bool likeVar = false;
  String number = '';
  final _dateController = TextEditingController();
  final _commentController = TextEditingController();
  late Classified classified;

  void initState() {
    idUser =
        BlocProvider.of<UserBloc>(context).state.userInfo!.user!.id.toString();
    classifiedBloc = BlocProvider.of<ClassifiedsBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void launchWhatsapp({@required number, @required message}) async {
      String rout = "https://api.whatsapp.com/send?phone=$number&text=$message";
      await canLaunchUrl(Uri.parse(rout))
          ? launchUrl(Uri.parse(rout))
          : Container();
    }

    return BlocBuilder<ClassifiedsBloc, ClassifiedsState>(
        builder: (context, state) {
      bool isLiked = false;

      if (state.classifiedDetail != null && !state.isLoadingFromNotification) {
        classified = state.classifiedDetail!;
        isLiked = classified.likes!.usersLikes
                .where((element) => element.id == idUser)
                .isNotEmpty
            ? true
            : false;
      }

      return WillPopScope(
          onWillPop: () async {
            if (!state.isLoadingFromNotification) {
              Navigator.pop(context);
            }
            return Future.value(!state.isLoadingFromNotification);
          },
          child: state.isLoadingFromNotification
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: Color(0xffF9FAFE),
                  appBar: AppBarBackSearch(
                      color_buttons: 0xFF6456EB,
                      color_title: 0xFFFFFFFF,
                      name_title: 'Detalle del clasificado',
                      color_background: 0xFFFFFFFF,
                      with_search: false,
                      view: 'clasificados',
                      onPressFn: () {
                        Navigator.pop(context);
                      }),
                  body: ListView(
                    children: [
                      Container(
                          color: Color(0xFFF9FAFE),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 20.0,
                                bottom: 15.0),
                            child: Column(
                              children: [
                                CarouselImages(
                                  items: classified.images!
                                      .map((e) =>
                                          ImageSerializer.Image.fromJson(
                                              e.toMap()))
                                      .toList()
                                      .cast(),
                                  itemsFiles: [],
                                  localImage: false,
                                )
                              ],
                            ),
                          )),
                      Container(
                        //margin: EdgeInsets.only(top: 230),
                        padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffF9FAFE),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              classified.title ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Color(0xff8378FC)),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'COP \$${NumberFormat.currency(locale: 'eu', symbol: '').format(classified.price)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 21,
                                  color: Color(0xff343887)),
                            ),
                            SizedBox(height: 25),
                            Text(
                              classified.description ?? '',
                              maxLines: null,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Color(0xff6C7192)),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListCommentClassified(
                                                    idParams: '',
                                                    idUser: idUser,
                                                    idClassified: classified.id,
                                                    owner: widget.owner,
                                                  )))
                                    },
                                    child: Container(
                                      child: Row(children: <Widget>[
                                        SvgPicture.asset(
                                          'assets/icons/chat.svg',
                                          width: 20,
                                          height: 20,
                                          color:
                                              Color.fromRGBO(142, 137, 255, 1),
                                        ),
                                        SizedBox(width: 5),
                                        SizedBox(width: 10),
                                        Text(
                                          '${classified.commentsCount} Comentarios',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                              color: Color(0xff6C7192)),
                                        ),
                                      ]),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context.read<ClassifiedsBloc>().add(
                                          ToggleLikeClassified(context,
                                              id: classified.id,
                                              isUserClassified:
                                                  !(widget.owner == 'admin')));
                                    },
                                    child: Container(
                                      child: Row(children: <Widget>[
                                        Text('${classified.likes?.likesCount}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15,
                                                color: Color(0xff6C7192))),
                                        SizedBox(width: 10),
                                        ClipOval(
                                          child: Container(
                                            width: 55,
                                            height: 55,
                                            color: Colors.white,
                                            child: Center(
                                                child: Icon(
                                              Icons.favorite,
                                              color: isLiked
                                                  ? Color.fromRGBO(
                                                      251, 121, 121, 1)
                                                  : Color.fromRGBO(
                                                      243, 241, 252, 1),
                                              size: 25,
                                            )),
                                          ),
                                        )
                                      ]),
                                    ),
                                  )
                                ]),
                            Text(
                              widget.owner == 'admin'
                                  ? 'Preguntele al vendedor'
                                  : 'Realizar comentario',
                              style: TextStyle(
                                  color: Color(0xff343887),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 25),
                            Column(
                              children: [
                                Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Color(0xffE5E5E5), width: 2),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 60,
                                          child: TextField(
                                            controller: _commentController,
                                            maxLines: 20,
                                            onChanged: (value) {
                                              BlocProvider.of<
                                                          ClassifiedCommentBloc>(
                                                      context)
                                                  .add(ChangeTxtCommentField(
                                                      value));
                                            },
                                            decoration: InputDecoration(
                                              hintText: widget.owner == 'admin'
                                                  ? 'Escribe tu pregunta'
                                                  : 'Escribe tu comentario',
                                              hintStyle: TextStyle(
                                                color: Color(0xff6C7192),
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                  left: 20, top: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          String valueComment = BlocProvider.of<
                                                      ClassifiedCommentBloc>(
                                                  context)
                                              .state
                                              .txtCommentField;
                                          if (valueComment != '') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content:
                                                  Text("Comentario enviado"),
                                            ));
                                            BlocProvider.of<
                                                        ClassifiedCommentBloc>(
                                                    context)
                                                .add(SaveCommentClassified(
                                                    context,
                                                    classified.id,
                                                    valueComment,
                                                    idUser,
                                                    widget.owner));
                                            BlocProvider.of<ClassifiedsBloc>(
                                                    context)
                                                .add(NewComment(
                                                    context,
                                                    classified.id,
                                                    widget.owner));
                                            BlocProvider.of<
                                                        ClassifiedCommentBloc>(
                                                    context)
                                                .add(ChangeTxtCommentField(''));
                                            _commentController.clear();
                                          }
                                        },
                                        child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            width: 25,
                                            height: 25,
                                            child: Image.asset(
                                              'assets/images/iconEnviar.png',
                                              width: 25,
                                              height: 25,
                                              color: Color.fromRGBO(
                                                  142, 137, 255, 1),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Text(
                              'Información del vendedor',
                              style: TextStyle(
                                  color: Color(0xff343887),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: classified
                                              .usser?.photo?.url !=
                                          null
                                      ? NetworkImage(
                                          classified.usser!.photo!.url)
                                      : AssetImage('assets/images/users.png')
                                          as ImageProvider,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      classified.nameSeller.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Color(0xff5C5D87)),
                                    ),
                                    Text(
                                      classified.residential != null
                                          ? classified.residential!.name
                                          : "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Color(0xffB1B4C7)),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 35),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.center,
                                            end: Alignment(0, 1.0),
                                            colors: [
                                              Color(0xFF8C81FE),
                                              Color(0xFF776BF8)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      child: IconButton(
                                          icon: Image.asset(
                                            'assets/images/iconTelephone.png',
                                            color: Color(0xffFFFFFF),
                                          ),
                                          onPressed: () async {
                                            number = classified.whatsappSeller!;
                                            await FlutterPhoneDirectCaller
                                                .callNumber(number);
                                          }),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.center,
                                            end: Alignment(0, 1.0),
                                            colors: [
                                              Color(0xffE3E3E3),
                                              Color(0xffD8D8E3)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      child: IconButton(
                                        icon: Image.asset(
                                            'assets/images/iconWhassapp.png'),
                                        onPressed: () {
                                          launchWhatsapp(
                                              number:
                                                  "${classified.whatsappSeller.toString()}",
                                              message: " ");
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 35),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
    });
  }

  Widget _showVideoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Text(
          'Video del producto',
          style: TextStyle(
              color: Color(0xff343887),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        InkWell(
          child: Text(
            classified.link ?? '',
            maxLines: null,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Color(0xff8378FC)),
          ),
          onTap: () {
            launchUrl(Uri.parse(classified.link ?? ''));
          },
        ),
      ],
    );
  }

  Widget _likeFile() {
    return BlocBuilder<ClassifiedsLikeBloc, ClassifiedsLikeState>(
        builder: (context, state) {
      try {
        if (BlocProvider.of<ClassifiedsLikeBloc>(context)
                    .state
                    .classifiedsLike !=
                null &&
            BlocProvider.of<ClassifiedsLikeBloc>(context)
                    .state
                    .classifiedsLike!
                    .id !=
                null) {
          setState(() {
            likeVar = true;
          });
        } else {
          setState(() {
            likeVar = false;
          });
        }
      } catch (e) {}
      return Row(children: [
        Text(
          state.totalLikes.toString(),
          style: TextStyle(
              color: Color(0xff343887),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () {
              likeVar
                  ? BlocProvider.of<ClassifiedsLikeBloc>(context).add(
                      DeleteClassifiedLike(
                          context,
                          state.classifiedsLike != null
                              ? state.classifiedsLike!.id.toString()
                              : ""))
                  : BlocProvider.of<ClassifiedsLikeBloc>(context)
                      .add(AddLikeToClassified(context, classified.id));
              setState(() {
                if (likeVar) {
                  likeVar = false;
                } else {
                  likeVar = true;
                }
              });
            },
            icon: Icon(Icons.favorite),
            color: likeVar ? Colors.red : Colors.grey)
      ]);
    });
  }

  Widget _cantidadcommentFile() {
    return BlocBuilder<ClassifiedCommentBloc, ClassifiedCommentState>(
        builder: (context, state) {
      List<ClassifiedComment> itemsComment = [];
      itemsComment =
          (state.commentClassifieds != null ? state.commentClassifieds : [])!;
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              state.pagination != null
                  ? '${state.pagination!.total.toString()} comentarios'
                  : "0 comentarios",
              style: TextStyle(
                color: Color(0xff9FA7B8),
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListCommentClassified(
                            idParams: '',
                            idUser: idUser,
                            idClassified: classified.id,
                            owner: widget.owner,
                          )),
                );
              },
              child: const Text(
                'Ver todos',
                style: TextStyle(
                  color: Color(0xff8378FC),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _commentField() {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: Color(0xffECECEC), width: 2)),
      child: ListTile(
        leading: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          return SizedBox(
            child: ClipRRect(
              child: (state.userInfo?.user!.photo?.url == null ||
                      state.userInfo?.user!.photo!.url == '')
                  ? Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff6456EB),
                        borderRadius: BorderRadius.all(Radius.circular(19.0)),
                      ),
                    )
                  : Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff6456EB),
                        image: DecorationImage(
                          image: NetworkImage(
                              state.userInfo?.user!.photo?.url != null
                                  ? state.userInfo!.user!.photo!.url.toString()
                                  : ''),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(19.0)),
                      ),
                    ),
            ),
          );
        }),
        title: TextField(
          keyboardType: TextInputType.text,
          controller: _dateController,
          textCapitalization: TextCapitalization.sentences,
          maxLines: null,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Color(0xff9FA7B8)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            //_onSubmit();
          },
          icon: const Image(
            image: AssetImage('assets/images/iconEnviar.png'),
          ),
        ),
      ),
    );
    //});
  }
}
