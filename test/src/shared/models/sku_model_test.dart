import 'package:ecommerce_app/src/shared/models/sku_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SkuModel', () {
    test('Instantiating the SkuModel class', () {
      final sku = SkuModel(
        skuId: 1,
        name: 'Produto 1',
        description: 'Descrição do produto 1',
        price: 10.0,
        sellingPrice: 9.0,
        images: [
          'https://m.media-amazon.com/images/I/417e-Aj1CYL._AC_SL1000_.jpg',
          'https://m.media-amazon.com/images/I/61+axYpz4YL._AC_SL1000_.jpg'
        ],
      );

      expect(sku.skuId, 1);
      expect(sku.name, 'Produto 1');
      expect(sku.description, 'Descrição do produto 1');
      expect(sku.price, 10.0);
      expect(sku.sellingPrice, 9.0);
      expect(sku.images, hasLength(2));
    });

    test('Instantiating the SkyModel class without images', () {
      final sku = SkuModel(
        skuId: 1,
        name: 'Produto 1',
        description: 'Descrição do produto 1',
        price: 10.0,
        sellingPrice: 9.0,
        images: [],
      );

      expect(sku.skuId, 1);
      expect(sku.name, 'Produto 1');
      expect(sku.description, 'Descrição do produto 1');
      expect(sku.price, 10.0);
      expect(sku.sellingPrice, 9.0);
      expect(sku.images, isEmpty);
    });

    group('From JSON', () {
      test('Converting JSON to SkuModel', () {
        final json = {
          'skuId': 1,
          'name': 'Produto 1',
          'description': 'Descrição do produto 1',
          'price': 10.0,
          'sellingPrice': 9.0,
          'images': [
            'https://m.media-amazon.com/images/I/417e-Aj1CYL._AC_SL1000_.jpg',
            'https://m.media-amazon.com/images/I/61+axYpz4YL._AC_SL1000_.jpg'
          ],
        };

        final sku = SkuModel.fromJson(json);

        expect(sku.skuId, 1);
        expect(sku.name, 'Produto 1');
        expect(sku.description, 'Descrição do produto 1');
        expect(sku.price, 10.0);
        expect(sku.sellingPrice, 9.0);
        expect(sku.images, hasLength(2));
      });

      test(
          'Converting JSON to a SkuModel without the image array',
          () {
        final json = {
          'skuId': 1,
          'name': 'Produto 1',
          'description': 'Descrição do produto 1',
          'price': 10.0,
          'sellingPrice': 9.0,
        };

        final sku = SkuModel.fromJson(json);

        expect(sku.skuId, 1);
        expect(sku.name, 'Produto 1');
        expect(sku.description, 'Descrição do produto 1');
        expect(sku.price, 10.0);
        expect(sku.sellingPrice, 9.0);
        expect(sku.images, isEmpty);
      });

      test(
          'Converting JSON to a SkuModel with null values',
          () {
        final json = {
          'skuId': null,
          'name': null,
          'description': null,
          'price': null,
          'sellingPrice': null,
          'images': null,
        };

        expect(() => SkuModel.fromJson(json), throwsA(isA<TypeError>()));
      });

      test(
          'Converting JSON to a SkuModel with null and missing values',
          () {
        final json = {
          'skuId': null,
        };

        expect(() => SkuModel.fromJson(json), throwsA(isA<TypeError>()));
      });
    });
  });
}
