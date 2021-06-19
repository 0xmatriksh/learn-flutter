import 'package:flutter/material.dart';
import 'package:learn_flutter/model/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      height: 135,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 4.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(8),
            child: Center(child: Image.network(item.imageUrl)),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(item.desc),
              ButtonBar(
                buttonPadding: const EdgeInsets.all(0),
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${item.price.toString()}'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Buy'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey[700]),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
