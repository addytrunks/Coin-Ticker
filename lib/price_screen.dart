import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  var bitCoinValue = '?';
  var ethereumValue = '?';
  var liteCoinValue = '?';
  var currencyName = 'AUD';

  List<Widget> getStringDataIOS(){
    List<Text> items = [];
    for (String currency in currenciesList){
      items.add(
          Text(
            currency,
            style: TextStyle(color: Colors.white),
          )
      );
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    getBitCoinData(0);
    getEthereumData(0);
    getLiteCoinData(0);
  }

  void getBitCoinData(index) async {
    var currencyData = await CoinData().getBitCoinData(currenciesList[index]);
    setState(() {
      bitCoinValue = currencyData;
      currencyName = currenciesList[index];
    });
  }

  void getEthereumData(index) async {
    var currencyData = await CoinData().getEthereumData(currenciesList[index]);
    setState(() {
      ethereumValue = currencyData;
      currencyName = currenciesList[index];
    });
  }

  void getLiteCoinData(index) async {
    var currencyData = await CoinData().getLiteCoinData(currenciesList[index]);
    setState(() {
      liteCoinValue = currencyData;
      currencyName = currenciesList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.blue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bitCoinValue $currencyName',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0),
            child: Card(
              color: Colors.blue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $ethereumValue $currencyName',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0),
            child: Card(
              color: Colors.blue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTE = $liteCoinValue $currencyName',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            color: Colors.black26,
            child: CupertinoPicker(
              itemExtent: 32.0,
              backgroundColor: Colors.black26,
              onSelectedItemChanged: (index){
                getBitCoinData(index);
                getEthereumData(index);
                getLiteCoinData(index);
              },
              children: getStringDataIOS(),
            )
          ),
        ],
      ),
    );
  }
}
