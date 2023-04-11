import 'dart:async';

import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/publications/model/provider.dart';

class ScreenProvider extends StatefulWidget {
  Provider? provider;
  ScreenProvider({Key? key, this.provider}) : super(key: key);

  @override
  _ScreenProviderState createState() => _ScreenProviderState();
}

class _ScreenProviderState extends State<ScreenProvider> {
  bool loadFinished = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, "dashboard");
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              'Proveedor',
              style: TextStyle(
                color: Color(0xff343887),
                fontSize: 14,
              ),
            ),
            elevation: 1,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff343887),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
            // backgroundColor: Colors.blueAccent,
            ),
        body: _body(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      ),
    );
  }

  Widget _body() {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _imgProvider(),
          _content(),
        ],
      ),
    );
  }

  Widget _getImgFromURl(String url) {
    final size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.fill,
      width: size.width * 0.20,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _imgProvider() {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: _getImgFromURl(widget.provider?.img ??
                  "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.provider?.company?.name ?? '',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff343887),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _content() {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.60,
          color: Color(0xffF9FAFE),
        ),
        _formView()
      ],
    );
  }

  Widget _formView() {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.60,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column(children: fieldsInForm()),
        ),
      ),
    );
  }

  List<Widget> _companyInfo() {
    return [
      _companyLabelInfo(),
      SizedBox(
        height: 15,
      ),
      _row1(),
      SizedBox(
        height: 15,
      ),
      _row2(),
      SizedBox(
        height: 15,
      ),
      _row3(),
      SizedBox(
        height: 15,
      ),
      _row4(),
    ];
  }

  List<Widget> _responsableInfo() {
    return [
      _responsableLabelInfo(),
      SizedBox(
        height: 15,
      ),
      _row5(),
      SizedBox(
        height: 15,
      ),
      _row6(),
    ];
  }

  List<Widget> _contractInfo() {
    return [
      _contractLabelInfo(),
      SizedBox(
        height: 15,
      ),
      _row7(),
      SizedBox(
        height: 15,
      ),
      _row8(),
    ];
  }

  List<Widget> fieldsInForm() {
    List<Widget> segments = [
      ..._companyInfo(),
      SizedBox(
        height: 35,
      ),
      ..._responsableInfo(),
      SizedBox(
        height: 35,
      ),
      ..._contractInfo(),
    ];

    return segments;
  }

  Widget _responsableLabelInfo() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff343887),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "Responsable",
          style: TextStyle(
            color: Color(0xff343887),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _contractLabelInfo() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff343887),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "Datos de contratación",
          style: TextStyle(
            color: Color(0xff343887),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _companyLabelInfo() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff343887),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.computer,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "Datos de empresa",
          style: TextStyle(
            color: Color(0xff343887),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _row1() {
    return TextField(
      readOnly: true,
      enabled: false,
      controller: TextEditingController(text: widget.provider?.company?.name),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: "Nombre comercial",
      ),
    );
  }

  Widget _row2() {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: TextEditingController(
                text: widget.provider?.company?.bussinnes),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Razón social",
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: TextEditingController(
                text: widget.provider?.company?.city?.name),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Ciudad",
            ),
          ),
        ),
      ],
    );
  }

  Widget _row3() {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller:
                TextEditingController(text: widget.provider?.company?.address),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Dirección",
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: TextEditingController(
                text: widget.provider?.company?.phone.toString()),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Teléfono",
            ),
          ),
        ),
      ],
    );
  }

  Widget _row4() {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller:
                TextEditingController(text: widget.provider?.company?.email),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Email",
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller:
                TextEditingController(text: widget.provider?.company?.pageWeb),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Sitio web",
            ),
          ),
        ),
      ],
    );
  }

  Widget _row5() {
    return TextField(
      readOnly: true,
      enabled: false,
      controller: TextEditingController(
          text:
              "${widget.provider?.responsable?.firstName} ${widget.provider?.responsable?.secondName} ${widget.provider?.responsable?.surname} ${widget.provider?.responsable?.secondSurname}"),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: "Nombre completo",
      ),
    );
  }

  Widget _row6() {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: TextEditingController(
                text: widget.provider?.responsable?.email),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Email",
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: TextEditingController(
                text: widget.provider?.responsable?.phone.toString()),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Celular / Whatsapp",
            ),
          ),
        ),
      ],
    );
  }

  Widget _row7() {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: TextEditingController(
                text: widget.provider?.infoContract?.hiringStartDate
                    ?.split("T")[0]),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Fecha de inicio",
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: TextEditingController(
                text: widget.provider?.infoContract?.hiringEndDate
                    ?.split("T")[0]),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Fecha de finalización",
            ),
          ),
        ),
      ],
    );
  }

  Widget _row8() {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: TextEditingController(
                text: widget.provider?.infoContract?.category?.name),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Categoria de servicio",
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.35,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: TextEditingController(
                text: widget.provider?.infoContract?.subCategory?.message),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: "Subcategoria de servicio",
            ),
          ),
        ),
      ],
    );
  }
}
