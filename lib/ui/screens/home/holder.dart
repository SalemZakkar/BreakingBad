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
    return Column(
      children: [
        Container(
          width: size.width * 0.9,
          height: 400,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: themeData.cardColor),
          child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 340,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: themeData.cardColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: CachedNetworkImage(
                      imageBuilder: (context , imageProvider){
                        return Container(
                          decoration: BoxDecoration(

                              color: themeData.cardColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),

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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: themeData.cardColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      alignment: Alignment.center,

                      child: Text(
                        widget.character.name ?? "N/A",
                        textScaleFactor: 1.4,
                        style: TextStyle(
                            color: themeData.textTheme.bodyText2!.color,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              )),
        ),
        const Text("\n")
      ],
    );
  }
}