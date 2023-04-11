import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/resident_experience/bloc/resident_experience_bloc.dart';
import 'package:hipal/components/resident_experience/model/resident_experience_response.dart';
import 'package:hipal/components/resident_experience/ui/widgets/list_view_item_pqr.dart';
import 'package:hipal/widgets/appbar_back_search.dart';

class PqrResponseAdmin extends StatelessWidget {
  final bool comeFromNotifications;

  const PqrResponseAdmin({Key? key, this.comeFromNotifications = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(comeFromNotifications){
          Navigator.pushReplacementNamed(context, "resident-experience");
        }
        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarBackSearch(
          color_buttons: 0xFFFFFFFF,
          color_title: 0xFFFFFFFF,
          name_title: 'Respuesta Administrador',
          color_background: 0xFF7548E2,
          with_search: false,
          view: 'resident-experience',
          onPressFn:
              comeFromNotifications ? null : () => Navigator.pop(context),
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF7548E2), Color(0xFF8639D8),Colors.white],
              stops: [0.0, 0.5, 1]
            ),
          ),
          child: BlocBuilder<ResidentExperienceBloc, ResidentExperienceState>(
            builder: (context, state) {
              if (state.responsePQR == null)
                return Center(child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(Colors.white)
                ));

              final pqr = state.responsePQR!;
              return Column(
                children: [
                  SizedBox(height: 20),
                  _AdminCard(pqr: pqr),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ListViewItemPqr(pqr: pqr, options: false),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: _Body(pqr: pqr),
                  )
                ],
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final ResidentExperience pqr;
  const _Body({
    Key? key,
    required this.pqr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _onSubmit(int score) {
      BlocProvider.of<ResidentExperienceBloc>(context).add(RatePQR(
        context,
        id: pqr.id,
        score: score,
      ));
    }

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: pqr.response == null
            ? Center(
                child: Text(
                  "El administrador aún no responde",
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF8378FC),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    _DateResponse(date: pqr.response!.date),
                    Expanded(
                        child: _BodyResponse(response: pqr.response!.response)),
                    _QualificationButtoms(
                      currentScore: pqr.score,
                      onChanged: _onSubmit,
                      processingScore: context
                          .watch<ResidentExperienceBloc>()
                          .state
                          .processingScore,
                    ),
                  ],
                ),
              ));
  }
}

class _AdminCard extends StatelessWidget {
  const _AdminCard({
    Key? key,
    required this.pqr,
  }) : super(key: key);

  final ResidentExperience pqr;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 55,
            width: 55,
            padding: EdgeInsets.all(3),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: pqr.response?.user.photo != null
                        ? NetworkImage(pqr.response!.user.photo!.url)
                            as ImageProvider
                        : AssetImage('assets/images/image-default.png'),
                  )),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (pqr.response != null)
                  Flexible(
                    child: Text(
                      '${pqr.response!.user.firstname} ${pqr.response!.user.lastname ?? ''}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 17,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                Flexible(
                  child: Text(
                    pqr.response != null ? 'Administrador' : 'Sin respuesta',
                    style: TextStyle(
                      color: Color(0xffDBCCF6),
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DateResponse extends StatelessWidget {
  final DateTime date;
  const _DateResponse({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> months = [
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
    _letterDate(DateTime date) {
      String dateReturn = "";
      dateReturn += date.day.toString() + " ";
      dateReturn += months[date.month - 1] + " : " + date.year.toString();
      return dateReturn;
    }

    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            height: 13,
            width: 13,
            child: Icon(const IconData(0xe92a, fontFamily: 'icomoon'),
                size: 13, color: Color(0xFF8378FC))),
        Text(
          _letterDate(date),
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Color(0xFF343887),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _QualificationButtoms extends StatelessWidget {
  final Function(int)? onChanged;
  final int currentScore;
  final int processingScore;
  const _QualificationButtoms(
      {Key? key,
      this.onChanged,
      required this.currentScore,
      required this.processingScore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttoms = List.generate(5, (index) {
      final bool selected = currentScore == index + 1;

      return GestureDetector(
        onTap: () {
          if (!selected) {
            onChanged != null ? onChanged!.call(index + 1) : () {};
          }
        },
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(
                  selected ? 0xFF714CF6 : 0xFFF2F1FE,
                )),
            height: selected ? 40 : 35,
            width: selected ? 40 : 35,
            child: Stack(
              children: [
                Center(
                  child: Text('${index + 1}',
                      style: TextStyle(
                          color: Color(selected ? 0xFFFFFFFF : 0xFF8378FC),
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                ),
                if (processingScore == index + 1)
                  Center(
                      child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(Color(0xFF714CF6)),
                    strokeWidth: 2,
                  ))
              ],
            ),
          ),
        ),
      );
    });

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 21),
          width: MediaQuery.of(context).size.width,
          child: Text(
            "Evalúa tu conformidad de respuesta a tu solicitud",
            maxLines: null,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF8378FC),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [...buttoms],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _BodyResponse extends StatelessWidget {
  final String response;
  const _BodyResponse({
    Key? key,
    required this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              response,
              maxLines: null,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Color(0xFF343887),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
