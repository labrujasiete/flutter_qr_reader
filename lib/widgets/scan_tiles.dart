import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) => {
          Provider.of<ScanListProvider>(context, listen: false).borrarTodosPorId(scans[i].id!)
        },
        child: ListTile(
          leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(
            this.tipo == 'http'
              ? Icons.home_outlined
              : Icons.map_outlined,
            color: Colors.grey,
          ),
          onTap: () => theLaunchUrl(context, scans[i]),
        ),
      )
    );
  }
}