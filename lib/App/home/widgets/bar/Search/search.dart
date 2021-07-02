import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/stores/home_store.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final HomeStore store = GetIt.I<HomeStore>();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    store.folded = false;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
        duration: Duration(microseconds: 400),
        width: store.folded ? size.width * 0.55 : 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Observer(
          builder: (_) {
            return Row(
              children: [
                Expanded(
                  child: store.folded
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 3.5),
                          child: TextField(
                            controller: controller,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                            ),
                            onChanged: (text) {
                              store.setSearchText(controller.text);
                              print(store.searchText);
                            },
                          ),
                        )
                      : Container(
                          color: Colors.transparent,
                        ),
                ),
                AnimatedContainer(
                  duration: Duration(microseconds: 400),
                  width: 40,
                  child: IconButton(
                    splashRadius: 20,
                    icon: Icon(
                      store.folded ? Icons.chevron_right : Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        store.setFolded();
                        store.setSearchText("");
                        controller.clear();
                      });
                    },
                  ),
                )
              ],
            );
          },
        ));
  }
}
