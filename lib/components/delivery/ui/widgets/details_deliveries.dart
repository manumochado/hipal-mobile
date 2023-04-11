import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/delivery/bloc/comment_bloc/comment_bloc.dart';
import 'package:hipal/components/delivery/bloc/comment_bloc/formcomment_bloc.dart';
import 'package:hipal/components/delivery/model/comment.dart';
import 'package:hipal/components/delivery/ui/widgets/list_coment.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class DetailsDeliveries extends StatefulWidget {
  final idParams;
  final phone;
  final name;
  final urlImage;
  final qualifiers;
  final score;
  DetailsDeliveries(this.idParams, this.name, this.urlImage, this.phone,
      this.qualifiers, this.score,
      {Key? key})
      : super(key: key);

  @override
  State<DetailsDeliveries> createState() => _DetailsDeliveriesState(
      idParams, name, urlImage, phone, qualifiers, score);
}

class _DetailsDeliveriesState extends State<DetailsDeliveries> {
  final idParams;
  final phone;
  final name;
  final urlImage;
  final qualifiers;
  final score;
  final _dateController = TextEditingController();
  double star = 3;
  String idUser = '';

  _DetailsDeliveriesState(this.idParams, this.name, this.urlImage, this.phone,
      this.qualifiers, this.score);
  @override
  Widget build(BuildContext context) {
    List<Comment> items = [];
    BlocProvider.of<CommentBloc>(context)
        .add(LoadARefreshComment(context, idParams.toString()));
    return BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
      items = (state.comment != null ? state.comment : [])!;
      idUser = BlocProvider.of<UserBloc>(context)
          .state
          .userInfo!
          .user!
          .id
          .toString();

      return Scaffold(
        appBar: AppBarBackSearch(
          color_buttons: 0xFFFFFFFF,
          color_title: 0xFFFFFFFF,
          name_title: 'Domicilios',
          color_background: 0xFF6456EB,
          with_search: false,
          view: 'delivery',
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                _nameDeliberi(),
                _widgetBody(),
                _widgetComment(),
              ],
            )
          ],
        ),
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      );
    });
  }

  Widget _nameDeliberi() {
    return Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        gradient: const LinearGradient(
          begin: Alignment.center,
          end: Alignment(0, 1.5),
          colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
        ),
      ),
      child: Center(
        child: ListTile(
          title: Text(
            name.toString(),
            style: const TextStyle(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          subtitle: Row(
            children: [
              const Text(
                'Calificación:    ',
                style: TextStyle(
                    color: Color(0xffDFDDFD),
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              const Icon(
                Icons.star,
                size: 16,
                color: Color(0xffF4B942),
              ),
              Text((() {
                if ('${qualifiers.toString()}' == 'null') {
                  return '  0 (de 5)';
                } else {
                  double varScroe = score;
                  String inString = varScroe.toStringAsFixed(1); // '2.35'
                  double inDouble = double.parse(inString);
                  return '  $inDouble (de ${qualifiers.toString()})';
                }
              })()),
            ],
          ),
          leading: Container(
            width: 120,
            //height: 400,
            decoration: BoxDecoration(
              color: const Color(0xff6456EB),
              image: DecorationImage(
                image:
                    NetworkImage(urlImage != null ? urlImage.toString() : ''),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(19),
            ),
          ),
        ),
      ),
    );
  }

  Widget _widgetBody() {
    double points = 2.5;
    return Container(
      margin: EdgeInsets.only(top: 140),
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 23),
              child: MaterialButton(
                minWidth: 150.0,
                height: 43.0,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                onPressed: () {
                  FlutterPhoneDirectCaller.callNumber(phone.toString());
                },
                color: Color(0xff8C81FE),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/iconTelephone.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      child: const Text(
                        'Llamar',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 23, bottom: 20),
              child: const Text(
                'Pulsa para calificar:',
                style: TextStyle(
                  color: Color(0xff9FA7B8),
                  fontSize: 14,
                ),
              ),
            ),
            RatingBar.builder(
              initialRating: points,
              unratedColor: Color(0xffE5E5E5),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color(0xffF4B942),
              ),
              onRatingUpdate: (rating) {
                star = rating as double;
                print(rating);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _cantidadcommentFile() {
    return BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
      List<Comment> items = [];
      items = (state.comment != null ? state.comment : [])!;
      return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
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
                //metodo de desplazar card
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ListComment(idParams: idParams, idUser: idUser)));
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

  Widget _listCommentFile() {
    return BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
      List<Comment> items = [];
      items = (state.comment != null ? state.comment : [])!;
      List<String> days = [
        'Lunes',
        'Martes',
        'Miercoles',
        'Jueves',
        'Viernes',
        'Sabado',
        'Domingo'
      ];
      List<String> arrMonth = [
        'Enero',
        'Febrero',
        'Marzo',
        'Abril',
        'Mayo',
        'Junio',
        'Julio',
        'Agosto',
        'Septiembre',
        'Octubre',
        'Noviembre',
        'Diciembre'
      ];
      String date = DateFormat('yyyy-MM-dd').format(items[0].createdAt!);
      DateTime dateMod = DateFormat('yyyy-MM-dd').parse(date);
      return items.length > 0
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: Color(0xffF7F7FB)),
              child: ListTile(
                leading: SizedBox(
                  child: ClipRRect(
                    child: (items[0].user?.photo?.url == null ||
                            items[0].user?.photo!.url == '')
                        ? Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: const Color(0xff6456EB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(19.0)),
                            ),
                          )
                        : Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: const Color(0xff6456EB),
                              image: DecorationImage(
                                image: NetworkImage(
                                    items[0].user?.photo?.url != null
                                        ? items[0].user!.photo!.url.toString()
                                        : ''),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(19.0)),
                            ),
                          ),
                  ),
                ),
                title: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    '${items[0].user?.firstname} ${items[0].user?.lastname} ',
                    style: TextStyle(
                        color: Color(0xff343887),
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        '${items[0].message}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Color(0xFF343887),
                            fontSize: 13,
                            height: 1.7),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            '${days[dateMod.weekday - 1]}, ${dateMod.day} ${arrMonth[dateMod.month - 1]}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color(0xFF343887), fontSize: 13),
                          ),
                        ),
                        items[0].user!.id == idUser
                            ? TextButton(
                                onPressed: () {
                                  _deleteComment(
                                      context, items[0].id.toString());
                                },
                                child: const Text(
                                  'Eliminar',
                                  style: TextStyle(
                                    color: Color(0xff8378FC),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    )
                  ],
                ),
              ),
            )
          : Container();
    });
  }

  Widget _commentField() {
    return BlocBuilder<FormcommentBloc, FormcommentState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
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
                                    ? state.userInfo!.user!.photo!.url
                                        .toString()
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
            onPressed: () async {
              String comentario = _dateController.text;

              final params = {
                "message": comentario != null ? comentario.toString() : '',
                "qualification": star.toString(),
                "directoryAddress": idParams != null ? idParams.toString() : '',
              };

              final formPetService = BlocProvider.of<FormcommentBloc>(context);
              final dynamic response;
              response =
                  await formPetService.commentRepo.saveComment(context, params);
              _dateController.text = '';
              BlocProvider.of<CommentBloc>(context)
                  .add(LoadARefreshComment(context, idParams.toString()));
            },
            icon: const Image(
              image: AssetImage('assets/images/iconEnviar.png'),
            ),
          ),
        ),
      );
    });
  }

  Widget _widgetComment() {
    return BlocBuilder<FormcommentBloc, FormcommentState>(
        builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(top: 320, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            const Text(
              'Escríbe un comentario',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xff9FA7B8),
                fontSize: 14,
              ),
            ),
            _commentField(),
            _cantidadcommentFile(),
            _listCommentFile()
          ],
        ),
      );
    });
  }

  void _deleteComment(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar el comentario?'),
            actions: [
              TextButton(
                  onPressed: () {
                    BlocProvider.of<CommentBloc>(context)
                        .add(DeleteCommentDelivery(context, id));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Si')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
}
