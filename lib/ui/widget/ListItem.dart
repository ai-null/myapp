part of 'widgets.dart';

class ListItem extends StatelessWidget {
  final String title;

  const ListItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title));
  }
}
