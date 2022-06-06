import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardAsylum extends StatelessWidget {
  const CardAsylum({
    Key? key,
    this.titleTxt,
    this.subTxt,
    this.image,
  }) : super(key: key);
  final String? titleTxt;
  final String? subTxt;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: Transform(
        transform: Matrix4.translationValues(0.0, 50 * (1.0 - 0.6), 0.0),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
          child: InkWell(
            splashColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(4, 4),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 2,
                          child: Image.network(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          color: Color(0xFFFFFFFF),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 8, bottom: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          titleTxt!,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                            color: Color(0XFF0089A5),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              subTxt!,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey
                                                      .withOpacity(0.8)),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Icon(FontAwesomeIcons.locationDot,
                                                size: 12,
                                                color: Color(0XFF54D3C2)),
                                            Expanded(
                                              child: Text(
                                                'pertinho de voce ...',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                "Esperamos a sua visita :)",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 16, top: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.handHoldingHeart,
                                      color: Color(0XFF54D3C2),
                                      size: 22,
                                    ),
                                    Text(
                                      "60+",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.withOpacity(0.8)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.mapLocationDot,
                              color: Color(0XFF54D3C2),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
