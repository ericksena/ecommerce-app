import 'package:ecommerce_app/src/shared/models/product_model.dart';
import 'package:ecommerce_app/src/shared/models/sku_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Product Model', () {
    test('Instantiating the ProductModel class', () {
      final product = ProductModel(
        id: 1,
        name: 'Produto 1',
        description: 'Descrição do produto 1',
        skus: [],
      );

      expect(product.id, 1);
      expect(product.name, 'Produto 1');
      expect(product.description, 'Descrição do produto 1');
      expect(product.skus, isEmpty);
      expect(product.image, isNull);
    });

    test('Instantiating the SkyModel class with SkuModel', () {
      final product = ProductModel(
        id: 1,
        name: 'Produto 1',
        description: 'Descrição do produto 1',
        skus: [
          SkuModel(
            skuId: 1,
            name: 'Produto 1',
            description: 'Descrição do produto 1',
            price: 10.0,
            sellingPrice: 9.0,
            images: [
              'https://m.media-amazon.com/images/I/417e-Aj1CYL._AC_SL1000_.jpg',
              'https://m.media-amazon.com/images/I/61+axYpz4YL._AC_SL1000_.jpg'
            ],
          ),
        ],
      );

      expect(product.id, 1);
      expect(product.name, 'Produto 1');
      expect(product.description, 'Descrição do produto 1');
      expect(product.skus, hasLength(1));
      expect(product.image, isNotNull);
      expect(
          product.image,
          equals(
              'https://m.media-amazon.com/images/I/417e-Aj1CYL._AC_SL1000_.jpg'));
    });

    group('From Json', () {
      test('Convertendo JSON em objeto para a classe de ProductModel', () {
        final json = {
          'id': 1,
          'name': 'Produto 1',
          'description': 'Descrição do produto 1',
          'skus': [],
        };

        final product = ProductModel.fromJson(json);

        expect(product.id, 1);
        expect(product.name, 'Produto 1');
        expect(product.description, 'Descrição do produto 1');
        expect(product.skus, isEmpty);
        expect(product.image, isNull);
      });

      test(
          'Convertendo JSON em objeto para a classe de ProductModel com um sku',
          () {
        final json = {
          'id': 1,
          'name': 'Produto 1',
          'description': 'Descrição do produto 1',
          'skus': [
            {
              'skuId': 1,
              'name': 'Produto 1',
              'description': 'Descrição do produto 1',
              'price': 10.0,
              'sellingPrice': 9.0,
              'images': [
                'https://m.media-amazon.com/images/I/417e-Aj1CYL._AC_SL1000_.jpg',
                'https://m.media-amazon.com/images/I/61+axYpz4YL._AC_SL1000_.jpg'
              ],
            }
          ],
        };

        final product = ProductModel.fromJson(json);

        expect(product.id, 1);
        expect(product.name, 'Produto 1');
        expect(product.description, 'Descrição do produto 1');
        expect(product.skus, hasLength(1));
        expect(product.image, isNotNull);
        expect(
            product.image,
            equals(
                'https://m.media-amazon.com/images/I/417e-Aj1CYL._AC_SL1000_.jpg'));
      });

      test(
          'Convertendo JSON em objeto para a classe de ProductModel sem um sku vinculado',
          () {
        final json = {
          'id': 1,
          'name': 'Produto 1',
          'description': 'Descrição do produto 1',
        };

        final product = ProductModel.fromJson(json);

        expect(product.id, 1);
        expect(product.name, 'Produto 1');
        expect(product.description, 'Descrição do produto 1');
        expect(product.skus, isEmpty);
        expect(product.image, isNull);
      });

      test(
          'Convertendo JSON em objeto para a classe de ProductModel em valores nulos',
          () {
        final json = {
          'id': null,
          'name': null,
          'description': null,
        };

        expect(() => ProductModel.fromJson(json), throwsA(isA<TypeError>()));
      });

      test(
          'Convertendo JSON em objeto para a classe de ProductModel em valores faltando e nulos',
          () {
        final json = {
          'id': null,
        };

        expect(() => ProductModel.fromJson(json), throwsA(isA<TypeError>()));
      });
    });
  });
}
