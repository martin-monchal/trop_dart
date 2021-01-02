import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trop_dart/ui/screens/shared/bloc/app_bloc.dart';
import 'package:trop_dart/ui/screens/shared/model/beer.dart';

const double kSectionListHorizontalPadding = 24.0;

class ListBeersBody extends StatefulWidget {
  ListBeersBody();

  @override
  _ListBeersBody createState() => _ListBeersBody();
}

class _ListBeersBody extends State<ListBeersBody> {
  double bottomPadding;
  bool isLoading;
  bool error;
  int offset;
  Iterable<Beer> items;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    error = false;
    offset = 1;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (BuildContext context, AppState state) {
        items = state.when(
          (Iterable<Beer> data) {
            isLoading = false;
            return data;
          },
          error: () => items,
          loading: () => items,
        );
        return ListView.builder(
          shrinkWrap: true,
          itemCount: items?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            Beer item = items.elementAt(index);
            debugPrint('item' + item.location.toString());

            return Padding(
              padding: EdgeInsets.only(
                  left: kSectionListHorizontalPadding,
                  right: kSectionListHorizontalPadding,
                  top: 16.0,
                  bottom: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: _ListItemBeerCell(item),
              ),
            );
          },
        );
      },
    );
  }
}

class _ListItemBeerCell extends StatelessWidget {
  _ListItemBeerCell(this.beer);

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    String date = DateFormat.yMMMd().format(beer.date);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(beer.name)),
          Text(date),
        ],
      ),
    );
  }
}
