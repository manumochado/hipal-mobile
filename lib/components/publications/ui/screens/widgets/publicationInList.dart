import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/publications/bloc/provider_bloc.dart';
import 'package:hipal/components/publications/bloc/publication_bloc.dart';
import 'package:hipal/components/publications/model/publication_in_list_by_residential.dart';
import 'package:hipal/components/publications/ui/screens/screen_provider.dart';
import 'package:hipal/components/publications/ui/screens/screen_publication.dart';
import 'package:hipal/widgets/card_container_custom.dart';

class PublicationInList extends StatefulWidget {
  final PublicationInListByResidential publicationInListByResidential;
  const PublicationInList(
      {Key? key, required this.publicationInListByResidential})
      : super(key: key);

  @override
  State<PublicationInList> createState() => _PublicationInListState();
}

class _PublicationInListState extends State<PublicationInList> {
  @override
  Widget build(BuildContext context) {
    return CardContainerCustom(
      edgeInsets: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 30,
        bottom: 20,
      ),
      child: bodyContent(),
    );
  }

  Widget bodyContent() {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyHeader(),
        SizedBox(height: 10),
        bodyMedia(),
        SizedBox(height: 15),
        Text(
          widget.publicationInListByResidential.name,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 90.0,
          ),
          child: SingleChildScrollView(
            child: Text(
              widget.publicationInListByResidential.text,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        MaterialButton(
            minWidth: size.width,
            height: 35,
            color: Color(0xFF776BF8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Color(0xff7E72FF),
              ),
            ),
            elevation: 0,
            child: Text(
              'Ver publicación',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              BlocProvider.of<PublicationsBloc>(context).add(
                  LoadPublicationsByProvider(
                      context,
                      widget.publicationInListByResidential.provider?.id,
                      widget.publicationInListByResidential.id));

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScreenPublication(
                        publication: widget.publicationInListByResidential,
                      )));
            }),
      ],
    );
  }

  Widget _imgInMorePublication(String url) {
    return CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: url,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
    );
  }

  Widget bodyMedia() {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: widget.publicationInListByResidential.file != null
            ? _imgInMorePublication(widget.publicationInListByResidential.file!)
            : Container(
                height: size.height * 0.30,
                width: size.width,
                color: Color(0xff6456EB),
              ),
      ),
    );
  }

  Widget bodyHeader() {
    var imgProvider = Image.asset("assets/images/users.png");

    if (widget.publicationInListByResidential.provider?.img != null) {
      imgProvider =
          Image.network(widget.publicationInListByResidential.provider!.img!);
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ScreenProvider(
                  provider: widget.publicationInListByResidential.provider)),
        );
      },
      child: ListTile(
        leading: Transform.translate(
          offset: Offset(-16, 0),
          child: SizedBox(
            width: 45,
            child: CircleAvatar(
              backgroundImage: imgProvider.image,
              radius: 30,
            ),
          ),
        ),
        title: Transform.translate(
          offset: Offset(-16, 0),
          child: Text(
            widget.publicationInListByResidential.provider?.company?.name ?? '',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.purple, fontSize: 12),
          ),
        ),
        subtitle: Transform.translate(
          offset: Offset(-16, 0),
          child: Text(
            widget.publicationInListByResidential.provider?.company
                    ?.bussinnes ??
                '',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 9,
            ),
          ),
        ),
        trailing: Transform.translate(
          offset: Offset(16, 0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fecha de publicación',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                  ),
                ),
                Text(
                  widget.publicationInListByResidential.createdAtLocal,
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
