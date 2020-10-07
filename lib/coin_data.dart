import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '44AB57B0-19A9-49DB-A98E-3B5A4E6D5D6F';
const coinIoUrl = 'https://rest.coinapi.io/v1/exchangerate';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

class CoinData {

  Future getBitCoinData(String currency) async {
    var url = '$coinIoUrl/BTC/$currency?apikey=$apiKey';
    http.Response coinData = await http.get(url);
    if(coinData.statusCode == 200) {
      var jsonResponse = jsonDecode(coinData.body);
      return jsonResponse['rate'].toStringAsFixed(0);
    }
    else{
      print('There was a problem with coinAPI servers.');
    }
  }

  Future getEthereumData(String currency) async {
    var url = '$coinIoUrl/ETH/$currency?apikey=$apiKey';
    http.Response coinData = await http.get(url);
    if(coinData.statusCode == 200) {
      var jsonResponse = jsonDecode(coinData.body);
      return jsonResponse['rate'].toStringAsFixed(0);
    }
    else{
      print('There was a problem with coinAPI servers.');
    }
  }

  Future getLiteCoinData(String currency) async {
    var url = '$coinIoUrl/LTC/$currency?apikey=$apiKey';
    http.Response coinData = await http.get(url);
    if(coinData.statusCode == 200) {
      var jsonResponse = jsonDecode(coinData.body);
      return jsonResponse['rate'].toStringAsFixed(0);
    }
    else{
      print('There was a problem with coinAPI servers.');
    }
  }

}