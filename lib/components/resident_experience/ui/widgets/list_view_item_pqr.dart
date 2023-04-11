import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/resident_experience/bloc/resident_experience_bloc.dart';
import 'package:hipal/components/resident_experience/model/resident_experience_response.dart';
import 'package:hipal/components/resident_experience/ui/screens/response_admin.dart';
import 'package:hipal/services/notification_service.dart';

class ListViewItemPqr extends StatelessWidget {
  final ResidentExperience pqr;
  final bool options;
  const ListViewItemPqr({Key? key, required this.pqr, this.options = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Card
          Expanded(
            child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Date(date: pqr.date),

                    SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          thickness: 1,
                          width: 30,
                        )),

                    //Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Asunto
                          Text(
                            pqr.business,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xff343887),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 3),
                          // Detalle
                          Text(
                            pqr.description,
                            maxLines: 2,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xFF343887),
                              fontSize: 12,
                            ),
                          ),

                          Divider(
                            thickness: 1,
                            height: 30,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //Tipo
                              _IconLabel(
                                title: 'Tipo',
                                subtitle: pqr.type.name,
                                icon: Icon(
                                    const IconData(0xe933,
                                        fontFamily: 'icomoon'),
                                    size: 13,
                                    color: Color(0xFF8378FC)),
                              ),
                              SizedBox(
                                  height: 30,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 25,
                                  )),
                              //Estado
                              _IconLabel(
                                title: 'Estado',
                                subtitle: pqr.stated,
                                icon: Icon(
                                    const IconData(0xe934,
                                        fontFamily: 'icomoon'),
                                    size: 13,
                                    color: Color(0xFF8378FC)),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
          options ? _MenuWidget(pqr: pqr) : const SizedBox()
        ],
      ),
    );
  }
}

class _MenuWidget extends StatelessWidget {
  const _MenuWidget({
    Key? key,
    required this.pqr,
  }) : super(key: key);

  final ResidentExperience pqr;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResidentExperienceBloc, ResidentExperienceState>(
      builder: (context, state) {
        return state.deletingId == pqr.id
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 2,
                  ),
                ))
            : IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Color(0xFF8075FB),
                ),
                onPressed: () => NotificationService.showModalBottom(context,
                    child: _Acciones(pqr: pqr)));
      },
    );
  }
}

class _Acciones extends StatelessWidget {
  const _Acciones({
    Key? key,
    required this.pqr,
  }) : super(key: key);

  final ResidentExperience pqr;

  @override
  Widget build(BuildContext context) {
    void onEdit() {
      if (pqr.stated == "Cerrado") {
        NotificationService.showToast(context,
            message:
                'No es posible editar el PQR, este se encuentra en estado Cerrado.');
        Navigator.pop(context);
        return;
      }
      BlocProvider.of<ResidentExperienceBloc>(context)
          .add(SetEditingPQR(context, pqr));
      Navigator.of(context).pop();
    }

    Future<void> onDelete() async {
      await NotificationService.showOkCancelDialog(
        context,
        title: 'Eliminar',
        content: '¿Desea eliminar el PQR?',
        onCancel: () => Navigator.pop(context),
        onConfirm: () {
          BlocProvider.of<ResidentExperienceBloc>(context).add(DeletePQR(
            context,
            pqr.id,
          ));
          Navigator.of(context).pop();
        },
      );

      Navigator.of(context).pop();
    }

    void onAdminResponse() async{
      BlocProvider.of<ResidentExperienceBloc>(context).add(SetResponsePQR(context, pqr));
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PqrResponseAdmin()),
      );
      Navigator.of(context, rootNavigator: true).pop();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Inicador
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 8, bottom: 5),
              height: 3,
              width: 30,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 40),

          RowOption(
            pqr: pqr,
            title: "Editar",
            icon: const IconData(0xe90e, fontFamily: 'icomoon'),
            onPressed: onEdit,
          ),
          const SizedBox(height: 20),
          RowOption(
            pqr: pqr,
            title: "Respuesta del administrador",
            icon: const IconData(0xe91d, fontFamily: 'icomoon'),
            onPressed: onAdminResponse,
          ),
          const SizedBox(height: 20),
          RowOption(
            pqr: pqr,
            title: "Eliminar",
            icon: const IconData(0xe917, fontFamily: 'icomoon'),
            onPressed: onDelete,
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class RowOption extends StatelessWidget {
  final ResidentExperience pqr;
  final String title;
  final IconData icon;
  final Function()? onPressed;

  const RowOption({
    Key? key,
    required this.pqr,
    required this.title,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(right: 11.0),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Color(0xFFF7F7FB),
                    borderRadius: BorderRadius.circular(13.0)),
                child: Icon(icon, size: 22, color: Color(0xFF8378FC))),
            Text(
              title,
              style: TextStyle(
                  color: Color(0xFF5C5D87),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        SizedBox(
          height: 30, width: 30,
          child: ElevatedButton(
            child: Icon(const IconData(0xe91f, fontFamily: 'icomoon'),
                size: 12, color: Color(0xFFF9FAFE)),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              primary: const Color(0xFF724DF6),
            ),
          ),
        ),
      ],
    );
  }
}

class _IconLabel extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  const _IconLabel(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            height: 13,
            width: 13,
            child: icon),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF6C7192),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF6C7192),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//Muestra el dia y mes
class _Date extends StatelessWidget {
  const _Date({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    List<String> months = [
      "ENE",
      "FEB",
      "MAR",
      "ABR",
      "MAY",
      "JUN",
      "JUL",
      "AGO",
      "SEP",
      "OCT",
      "NOV",
      "DIC"
    ];

    return SizedBox(
        width: 26,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.day.toString(),
                style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF343887)),
              ),
              Text(
                months[date.month - 1],
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF343887).withOpacity(0.7)),
              )
            ],
          ),
        ));
  }
}
