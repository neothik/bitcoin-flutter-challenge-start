import 'dart:convert';

import 'package:http/http.dart' as http;

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

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '?apikey=4D6219A0-561D-4EDC-B804-76D6D4BE9DEB';

class CoinData {
  //TODO: Create your getCoinData() method here.
  Future<Map> getCoinData(String selectedCurrency) async {
    Map rateData = {};

    for (String crypto in cryptoList) {
      var response =
          await http.get("$coinAPIURL/$crypto/$selectedCurrency$apiKey");

      if (response.statusCode == 200) {
        print(response.body);

        double bitRate = jsonDecode(response.body)['rate'];
        rateData[crypto] = bitRate.toStringAsFixed(0);
        print(bitRate.round());
      } else {
        print('Error retriving the data from coinapi.io');
        throw ('http exception');
      }
    }
    print(rateData['BTC']);
    print(rateData['ETH']);
    print(rateData['LTC']);

    return rateData;
  }
}
//https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=4D6219A0-561D-4EDC-B804-76D6D4BE9DEB
