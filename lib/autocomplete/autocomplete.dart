import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:playground/data/lokasi.dart';

class AutocompleteApp extends StatefulWidget {

  @override
  State createState() => _AutocompleteState();
}

class _AutocompleteState extends State<AutocompleteApp> {
  static const JsonCodec JSON = const JsonCodec();

  String codePuskesmas = "";

  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQueryController =
  new TextEditingController();
  final FocusNode _focusNode = new FocusNode();

  bool _isSearching = true;
  String _searchText = "";
  List<String> _searchList = List();
  List<LokasiData> _searchLokasiList = List();
  bool _onTap = false;
  int _onTapTextLength = 0;

  _AutocompleteState() {
    _searchQueryController.addListener(() {
      if (_searchQueryController.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
          _searchList = List();
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _searchQueryController.text;
          _onTap = _onTapTextLength == _searchText.length;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: buildAppbar(context),
      body: buildBody(context),
    );
  }

  Widget getFutureWidget() {
    return new FutureBuilder(
        future: _buildSearchLokasiList(), //_buildSearchList(),
        initialData: List<ListTile>(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ListTile>> childItems) {
          return new Container(
            color: Colors.white,
            height: getChildren(childItems) == null? 50.0: getChildren(childItems).length * 48.0,
            width: MediaQuery.of(context).size.width,
            child: new ListView(
//            padding: new EdgeInsets.only(left: 50.0),
              children: (childItems.data != null &&  childItems.data.isNotEmpty)
                  ? ListTile
                  .divideTiles(
                  context: context, tiles: getChildren(childItems))
                  .toList()
                  : List(),
            ),
          );
        });
  }

  List<ListTile> getChildren(AsyncSnapshot<List<ListTile>> childItems) {
    if (_onTap && _searchText.length != _onTapTextLength) _onTap = false;
    List<ListTile> childrenList =
    _isSearching && !_onTap ? childItems.data : List();
    return childrenList;
  }

  ListTile _getLokasiListTile(LokasiData lokasi) {
    var suggestedPhrase = "${lokasi.desa}, ${lokasi.kec}, ${lokasi.kotakab}, ${lokasi.provinsi}";
    return new ListTile(
      dense: true,
      title: new Text(
        suggestedPhrase,
        style: Theme.of(context).textTheme.subhead,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        setState(() {
          _onTap = true;
          _isSearching = false;
          _onTapTextLength = suggestedPhrase.length;
          _searchQueryController.text = suggestedPhrase;
          codePuskesmas = lokasi.code;
        });
        _searchQueryController.selection = TextSelection
            .fromPosition(new TextPosition(offset: suggestedPhrase.length));
      },
    );
  }

  Future<List<ListTile>> _buildSearchLokasiList() async {
    if (_searchText.isEmpty || _searchText.length < 3) {
      _searchList = List();
      return List();
    } else {
      _searchLokasiList = await _getLokasiSuggestion(_searchText) ?? List();

      List<ListTile> childItems = new List();
      for (var value in _searchLokasiList) {
        childItems.add(_getLokasiListTile(value));
      }
      return childItems;
    }
  }

  Future<List<LokasiData>> _getLokasiSuggestion(String hintText) async {
    String url = "http://localhost:800/api/v2/get_lokasi?value=$hintText";

    var response =
    await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    if(response.statusCode != 200){
      return null;
    }
    List<LokasiData> decode = LokasiResponse.fromJson(json.decode(response.body)).data;

    return decode;
  }

//  ListTile _getListTile(String suggestedPhrase) {
//    return new ListTile(
//      dense: true,
//      title: new Text(
//        suggestedPhrase,
//        style: Theme.of(context).textTheme.subhead,
//        overflow: TextOverflow.ellipsis,
//      ),
//      onTap: () {
//        setState(() {
//          _onTap = true;
//          _isSearching = false;
//          _onTapTextLength = suggestedPhrase.length;
//          _searchQueryController.text = suggestedPhrase;
//        });
//        _searchQueryController.selection = TextSelection
//            .fromPosition(new TextPosition(offset: suggestedPhrase.length));
//      },
//    );
//  }
//
//  Future<List<ListTile>> _buildSearchList() async {
//    if (_searchText.isEmpty || _searchText.length < 3) {
//      _searchList = List();
//      return List();
//    } else {
//      _searchList = await _getSuggestion(_searchText) ?? List();
////        ..add(_searchText);
//
//      List<ListTile> childItems = new List();
//      for (var value in _searchList) {
//          childItems.add(_getListTile(value));
////        if (!(value.contains(" ") && value.split(" ").length > 2)) {
////        }
//      }
//      return childItems;
//    }
//  }
//  Future<List<String>> _getSuggestion(String hintText) async {
//    String url = "http://192.168.200.66:800/api/v2/get_lokasi?value=$hintText";
//
//    var response =
//    await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
//
//    if(response.statusCode != 200){
//      return null;
//    }
//    List<LokasiData> decode = LokasiResponse.fromJson(json.decode(response.body)).data;
////    if (response.statusCode != HttpStatus.OK || decode.length == 0) {
////      return null;
////    }
//    List<String> suggestedWords = new List();
//
//    if (decode.length == 0) return null;
//
//    decode.forEach((f) {
//      print("desa: ${f.desa}, ${f.kec}, ${f.kotakab}, ${f.provinsi}, ID: ${f.code}");
//      suggestedWords.add("${f.desa}, ${f.kec}, ${f.kotakab}, ${f.provinsi}");
//    });
////    String data = decode[0]["word"];
//
//    return suggestedWords;
//  }

  Widget buildAppbar(BuildContext context) {
    return new AppBar(
      title: new Text('Suggestions Demo'),
    );
  }

  Widget buildBody(BuildContext context) {
    return new SafeArea(
      top: false,
      bottom: false,
      child: new SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 80.0),
                      new TextFormField(
                        controller: _searchQueryController,
                        focusNode: _focusNode,
                        onFieldSubmitted: (String value) {
                          print("$value submitted. code: $codePuskesmas");
                          setState(() {
                            _searchQueryController.text = value;
                            _onTap = true;
                          });
                        },
                        onSaved: (String value) => print("$value saved"),
                        decoration: const InputDecoration(
                          border: const UnderlineInputBorder(),
                          filled: true,
                          icon: const Icon(Icons.search),
                          hintText: 'Type two words with space',
                          labelText: 'Seach words *',
                        ),
                      ),

                      const SizedBox(height: 40.0),
                      new Center(
                        child: new RaisedButton(
                            color: Colors.orangeAccent,
                            onPressed: () => print("Pressed. code: $codePuskesmas"),
                            child: const Text(
                              '    Search    ',
                              style: const TextStyle(fontSize: 18.0),
                            )),
                      ),
                      const SizedBox(height: 200.0),
                    ],
                  ),
                ),
              ],
            ),
            new Container(
                alignment: Alignment.topCenter,
                padding: new EdgeInsets.only(
//                  top: MediaQuery.of(context).size.height * .18,
                    top: 136.0,
                    right: 0.0,
                    left: 38.0),
                child: _isSearching && (!_onTap) ? getFutureWidget() : null)
          ],
        ),
      ),
    );
  }
}