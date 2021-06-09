import 'package:flutter/material.dart';
import '../../models/transaction.dart';
import 'package:intl/intl.dart';

class transaction_card extends StatelessWidget {
  const transaction_card({
    Key key,
    @required this.tr,
    @required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('R\$${tr.value.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('dd/MM/y').format(tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                      Text(
                        'Excluir',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                onPressed: () => onRemove(tr.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Colors.grey,
                onPressed: () => onRemove(tr.id),
              ),
      ),
    );
  }
}