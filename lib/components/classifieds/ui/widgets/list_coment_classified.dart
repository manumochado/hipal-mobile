import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classifiedComment/classified_comment_bloc.dart';
import 'package:hipal/components/classifieds/model/comment_model.dart';
import '../../../user/bloc/user_bloc.dart';
import '../../bloc/classified/classifieds_bloc.dart';

class ListCommentClassified extends StatefulWidget {
  final idParams;
  final String idUser;
  final String idClassified;
  final String owner;

  ListCommentClassified(
      {required this.idParams,
      required this.idUser,
      required this.idClassified,
      required this.owner});

  @override
  State<ListCommentClassified> createState() => _ListCommentClassifiedState();
}

class _ListCommentClassifiedState extends State<ListCommentClassified> {
  List<CommentModel> items = [];
  List<CommentModel> itemsPre = [];
  bool loadFinished = false;
  late List<String> imagesDelete;
  String userId = "";
  File? imageFile;
  List<File>? itemsFile = [];
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    imagesDelete = [];
    itemsFile = [];

    userId = BlocProvider.of<UserBloc>(context)
            .state
            .userInfo
            ?.user
            ?.id
            .toString() ??
        "";
  }

  Widget build(BuildContext context) {
    bool imageTrue = BlocProvider.of<UserBloc>(context)
            .state
            .userInfo
            ?.user
            ?.photo
            ?.url
            .toString()
            .isNotEmpty ??
        false;
    String userImage = BlocProvider.of<UserBloc>(context)
            .state
            .userInfo
            ?.user
            ?.photo
            ?.url
            .toString() ??
        "assets/images/users.png";

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      if (!BlocProvider.of<ClassifiedCommentBloc>(context).state.isLoading) {
        BlocProvider.of<ClassifiedCommentBloc>(context)
            .add(changeIsLoading(true));
        BlocProvider.of<ClassifiedCommentBloc>(context)
            .add(LoadARefreshCommentClassified(
          context,
          'classifieds',
          widget.idClassified,
        ));
      }
    });
    try {
      Timer(const Duration(seconds: 5), () {});
    } catch (e) {}
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child: BlocBuilder<ClassifiedCommentBloc, ClassifiedCommentState>(
        builder: (context, state) {
      itemsPre = (state.comments != null ? state.comments : [])!;
      items = itemsPre.reversed.toList();
      return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBar(
              elevation: 2,
              toolbarHeight: 80,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color.fromRGBO(133, 122, 252, 1),
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Container(
                //width: size.width,
                height: 80,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(109, 108, 104, 1),
                              width: 2),
                          shape: BoxShape.circle,
                          image: imageTrue
                              ? DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(userImage),
                                )
                              : DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(userImage),
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                '${BlocProvider.of<UserBloc>(context).state.userInfo!.user!.firstname.toString()} ${BlocProvider.of<UserBloc>(context).state.userInfo!.user!.lastname.toString()}',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 16, 127, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'BasicCommercial LT Roman')),
                            Text(
                              '${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.tower!.name.toString()}, ${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.name.toString()}'
                                          .length >
                                      30
                                  ? '${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.tower!.name.toString()}, ${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.name.toString()}'
                                          .substring(0, 30) +
                                      '...'
                                  : '${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.tower!.name.toString()}, ${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.name.toString()}',
                              style: TextStyle(
                                  color: Color.fromRGBO(124, 126, 163, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'BasicCommercial LT Roman'),
                            ),
                          ]),
                    ]),
              ),
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
              ),
              actions: [
                Image.asset(
                  'assets/images/phone.png',
                  width: 80,
                  height: 80,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Comentarios',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 16, 127, 1))),
                  Container(
                      height: 500,
                      child: items.isNotEmpty
                          ? ListView.builder(
                              itemBuilder: (c, i) => _CommentCard(
                                comment: items[i],
                                userId: userId,
                                classifiedId: widget.idClassified,
                              ),
                              itemCount: items.length,
                              shrinkWrap: true,
                            )
                          : Center(
                              child: CircularProgressIndicator(
                              color: Color.fromRGBO(127, 114, 254, 1),
                            ))),
                  SizedBox(height: 10),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffE5E5E5), width: 2),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          //color: Colors.pink,
                          width: 300,
                          height: 60,
                          child: TextField(
                            controller: _commentController,
                            maxLines: 20,
                            onChanged: (value) {
                              BlocProvider.of<ClassifiedCommentBloc>(context)
                                  .add(ChangeTxtCommentField(value));
                            },
                            decoration: InputDecoration(
                              hintText: 'Escribe tu pregunta',
                              hintStyle: TextStyle(
                                color: Color(0xff6C7192),
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 20, top: 20),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            String valueComment =
                                BlocProvider.of<ClassifiedCommentBloc>(context)
                                    .state
                                    .txtCommentField;
                            if (valueComment != '') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Comentario enviado"),
                              ));
                              BlocProvider.of<ClassifiedCommentBloc>(context)
                                  .add(SaveCommentClassified(
                                      context,
                                      widget.idClassified,
                                      valueComment,
                                      userId,
                                      widget.owner));
                              BlocProvider.of<ClassifiedsBloc>(context).add(
                                  NewComment(context, widget.idClassified,
                                      widget.owner));
                              BlocProvider.of<ClassifiedCommentBloc>(context)
                                  .add(ChangeTxtCommentField(''));

                              _commentController.clear();
                            }
                          },
                          child: Container(
                              width: 25,
                              height: 25,
                              child: Image.asset(
                                'assets/images/iconEnviar.png',
                                width: 25,
                                height: 25,
                                color: Color.fromRGBO(142, 137, 255, 1),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    }));
  }
}

class _CommentCard extends StatelessWidget {
  final CommentModel comment;
  final String userId;
  final String classifiedId;
  _CommentCard(
      {Key? key,
      required this.comment,
      required this.userId,
      required this.classifiedId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return classifiedId == comment.classified
        ? Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Color.fromRGBO(224, 222, 253, 1), width: 2)),
            child: FittedBox(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(comment.user?.firstname ?? '',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(0, 16, 127, 1))),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Container(
                                width: 210,
                                height: 40,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text(comment.comment ?? '',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color.fromRGBO(
                                              124, 126, 163, 1))),
                                ),
                              ),
                            ],
                          ),
                        ]),
                    SizedBox(width: 20),
                    Text(comment.likes?.likesCount.toString() ?? '0',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 16, 127, 1))),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<ClassifiedCommentBloc>(context).add(
                            tougleLike(
                                context,
                                comment.sId ?? '',
                                userId,
                                _userLiked(
                                        comment.likes?.usersLikes ?? [], userId)
                                    ? false
                                    : true));
                      },
                      child: Container(
                        child: ClipOval(
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(253, 253, 255, 1),
                              border: Border.all(
                                  color: Color.fromRGBO(109, 108, 104, 1),
                                  width: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Icon(Icons.favorite,
                                    color: _userLiked(
                                            comment.likes?.usersLikes ?? [],
                                            userId)
                                        ? Color.fromRGBO(251, 121, 121, 1)
                                        : Color.fromRGBO(230, 229, 253, 1),
                                    size: 30)),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          )
        : Container();
  }

  bool _userLiked(List<UsersLikesM> likes, String userId) {
    return likes.any((element) => element.sId == userId);
  }
}
