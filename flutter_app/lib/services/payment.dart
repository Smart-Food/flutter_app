import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class Payment extends StatefulWidget {
  Payment({Key key}): super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Payment> {
  void _pay() {
    InAppPayments.setSquareApplicationId('sq0idb-oDAwkBp9Temg_CpRqwViRw');
    InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _cardNonceRequestSuccess,
      onCardEntryCancel: _cardEntryCancel,
    );
  }


  void _cardEntryCancel() {
    // Cancelled card entry
  }

  void _cardNonceRequestSuccess(CardDetails result) {
    print(result.nonce);

    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete,
    );
  }

  void _cardEntryComplete() {
    //Success
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Make a payment: '),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pay,
        tooltip: 'Payment',
        child: Icon(Icons.payment),
      ),
    );
  }
}


Widget _prettyButton() {
  return RaisedButton(
    child: Text('PAY'),
    onPressed: () {},
  );
}

//// _payment(AppStateModel model) async {
//_payment() async {
//  await InAppPayments.setSquareApplicationId('sq0idb-oDAwkBp9Temg_CpRqwViRw');
//  await InAppPayments.startCardEntryFlow(
//      onCardNonceRequestSuccess: (CardDetails result) {
//        try {
//          var chargeResult =
//          PaymentsRepository.actuallyMakeTheCharge(result.nonce);
//          if (chargeResult != 'Succes!') throw new StateError(chargeResult);
//            Text('a');
//        } catch (ex) {
//          InAppPayments.showCardNonceProcessingError(ex.toString());
//        }
//      },
//      onCardEntryCancel: () {});
//}

//onCardNonceRequestSuccess: (CardDetails result) {
//try {
//var chargeResult =
//PaymentsRepository.actuallyMakeTheCharge(result.nonce);
//if (chargeResult != 'Success!') throw new StateError(chargeResult);
//InAppPayments.completeCardEntry(
//onCardEntryComplete: model.clearCart);
//} catch (ex) {
//InAppPayments.showCardNonceProcessingError(ex.toString());
//}
//},