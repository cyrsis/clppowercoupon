import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

////-------- Playing around with IntrinsicWidth and TextField. ValueListenable and ValueListenableBuilder -------
void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.deepOrange,
        dividerColor: Colors.grey[400],
      ),
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  @override
  ExampleScreenState createState() => ExampleScreenState();
}

class ExampleScreenState extends State<ExampleScreen> {
  List<BasketItem> _items;

  @override
  void initState() {
    super.initState();
    _items = <BasketItem>[
      BasketItem('SKU-1', 5.99, 1),
      BasketItem('SKU-2', 10.99, 0),
      BasketItem('SKU-3', 2.99, 4),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _items[index];
          return BasketItemWidget(
            item: item,
            onAddToOrder: () => print('item: $item'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 2.0);
        },
      ),
    );
  }
}

class BasketItemWidget extends StatefulWidget {
  const BasketItemWidget({
    Key key,
    this.item,
    this.onAddToOrder,
  }) : super(key: key);

  final BasketItem item;
  final VoidCallback onAddToOrder;

  @override
  BasketItemWidgetState createState() => BasketItemWidgetState();
}

class BasketItemWidgetState extends State<BasketItemWidget> {
  FocusNode _quantityFocus;
  TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _quantityFocus = FocusNode();
    _quantityFocus.addListener(_onFocusChanged);
    _quantityController = TextEditingController(
      text: widget.item.quantity.toString(),
    );
  }

  void _onFocusChanged() {
    if (_quantityFocus.hasFocus) {
      // force the TextField cursor to the end of the text
      _updateCursor();
    }
  }

  @override
  void dispose() {
    _quantityFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ValueListenableBuilder<double>(
                    valueListenable: widget.item.total,
                    builder:
                        (BuildContext context, double value, Widget child) {
                      return Text(
                        '\$${value.toStringAsFixed(2)}',
                        style: theme.textTheme.display1.copyWith(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  Text(
                    'Please select required modifiers',
                    style: theme.textTheme.body1.copyWith(
                      color: theme.accentColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'quantity',
                    style: theme.textTheme.body2.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkResponse(
                        onTap: _decrementQuantity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.remove),
                        ),
                      ),
                      IntrinsicWidth(
                        child: TextField(
                          focusNode: _quantityFocus,
                          controller: _quantityController,
                          onChanged: _changeQuantity,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          maxLines: 1,
                          style: theme.textTheme.title.copyWith(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InkResponse(
                        onTap: _incrementQuantity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RaisedButton(
                      onPressed: widget.onAddToOrder,
                      child: Text('Add to order'),
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changeQuantity(String value) {
    widget.item.quantity = int.tryParse(value) ?? 0;
    _updateCursor();
  }

  void _decrementQuantity() {
    widget.item.decrementQuantity();
    _updateCursor();
  }

  void _incrementQuantity() {
    widget.item.incrementQuantity();
    _updateCursor();
  }

  void _updateCursor() {
    final text = widget.item.quantity.toString();
    _quantityController.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
      composing: TextRange.collapsed(text.length),
    );
  }
}

class BasketItem {
  BasketItem(this.sku, this.price, this._quantity) {
    _updateTotal();
  }

  final _total = ValueNotifier<double>(0);
  final String sku;
  final double price;
  int _quantity;

  ValueListenable<double> get total => _total;

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
    _updateTotal();
  }

  void decrementQuantity() {
    if (_quantity > 0) {
      _quantity--;
      _updateTotal();
    }
  }

  void incrementQuantity() {
    _quantity++;
    _updateTotal();
  }

  void _updateTotal() {
    _total.value = quantity * price;
  }

  @override
  String toString() => 'BasketItem(0x${hashCode.toRadixString(16)})'
      '{ $sku, $price * $quantity = ${_total.value} }';
}
