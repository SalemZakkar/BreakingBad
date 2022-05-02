import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/ui/widgets/center_error.dart';
import 'package:breaking_bad/ui/widgets/center_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ActorHolder extends StatefulWidget {
  final Character character;
  const ActorHolder({Key? key , required this.character}) : super(key: key);
  @override
  State<ActorHolder> createState() => _ActorHolderState();
}
class _ActorHolderState extends State<ActorHolder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Container(
      width: size.width * 0.45,
      height: 250,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: themeData.cardColor),
      child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                    color: themeData.cardColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: CachedNetworkImage(
                  imageBuilder: (context , imageProvider){
                    return Container(
                      decoration: BoxDecoration(

                          color: themeData.cardColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),

                          )
                      ,image: DecorationImage(
                        image: imageProvider , fit: BoxFit.cover,
                        alignment: Alignment.topCenter
                      )
                      ),

                    );
                  },
                  imageUrl: widget.character.img ?? "",
                  errorWidget:  (context , url , error ) => const ErrorNetworkWidget(),
                  placeholder: (context , url) => const Loading(),
                ),
              ),
              Container(
                height: 50,
                width: size.width,
                decoration: BoxDecoration(
                    color: themeData.cardColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                alignment: Alignment.center,
                child: Text(
                  widget.character.name ?? "N/A",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: themeData.textTheme.bodyText1!.color,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          )),
    );
  }
}