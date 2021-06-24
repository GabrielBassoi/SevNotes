import 'package:mobx/mobx.dart';
part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  @observable
  bool folded;

  @observable
  String searchText;

  @action
  void setFolded() => folded = !folded;

  @action
  void setSearchText(String value) => searchText = value;
}
