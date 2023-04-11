import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/model/classifieds_response.dart';
import '../../../../services/network_to_base.dart';
import '../../bloc/classified/classifieds_bloc.dart';
import '../../bloc/classified/formclassified_bloc.dart';
import 'detailsClassified.dart';
import 'form.dart';

class Modal extends StatelessWidget {
  final Classified classified;
  final Classified classifiedModel;
  final BuildContext contextOrigin;

  const Modal({
    Key? key,
    required this.classified,
    required this.classifiedModel,
    required this.contextOrigin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xffF2F0FA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                context.read<ClassifiedsBloc>().add(LoadDetailClassified(classified: classified));
                Navigator.push(
                  contextOrigin,
                  MaterialPageRoute(
                      builder: (contextOrigin) => DetailsClassified(
                            owner: 'user',
                          )),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              color: Color.fromRGBO(247, 247, 251, 1),
                              child: Image.asset(
                                'assets/images/ver.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Ver clasificado',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(78, 79, 128, 1)),
                          ),
                        ]),
                      ),
                      Container(
                          child: Image.asset(
                        'assets/icons/agregar.png',
                        width: 60,
                        height: 60,
                      )),
                    ]),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(height: 1, color: Colors.grey)),
            InkWell(
              onTap: () {
                BlocProvider.of<FormclassifiedBloc>(contextOrigin)
                        .add(SetEditingClassified(contextOrigin, classified));

                Navigator.push(
                  contextOrigin,
                  MaterialPageRoute(
                    builder: (contextOrigin) => ClassifiedsForm(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              color: Color.fromRGBO(247, 247, 251, 1),
                              child: Image.asset(
                                'assets/images/Editar.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Editar',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(78, 79, 128, 1)),
                          ),
                        ]),
                      ),
                      Container(
                          child: Image.asset(
                        'assets/icons/agregar.png',
                        width: 60,
                        height: 60,
                      )),
                    ]),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(height: 1, color: Colors.grey)),
            InkWell(
              onTap: () => {
                BlocProvider.of<ClassifiedsBloc>(contextOrigin)
                    .add(DeleteUserClassified(contextOrigin, classified.id)),
                Navigator.pop(contextOrigin)
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              color: Color.fromRGBO(247, 247, 251, 1),
                              child: Image.asset(
                                'assets/images/Eliminar.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Eliminar',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(78, 79, 128, 1)),
                          ),
                        ]),
                      ),
                      Container(
                          child: Image.asset(
                        'assets/icons/agregar.png',
                        width: 60,
                        height: 60,
                      )),
                    ]),
              ),
            ),
          ],
        ));
  }
}
