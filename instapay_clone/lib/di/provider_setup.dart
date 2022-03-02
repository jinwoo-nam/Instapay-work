import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  return [
    ChangeNotifierProvider<RootViewModel>(
      create: (context) => RootViewModel(),
    )
  ];
}