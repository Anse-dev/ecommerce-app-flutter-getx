# Projet Flutter - Architecture et Organisation

## Introduction

Ce projet est une application Flutter conçue en utilisant une architecture modulaire et évolutive. L'objectif est de garantir une maintenabilité à long terme tout en facilitant l'ajout de nouvelles fonctionnalités. Nous avons utilisé **GetX** pour la gestion de l'état, la navigation, et les dépendances, en combinaison avec les principes de **Clean Architecture** pour structurer le code.

## Structure du Projet

Le projet est organisé en différentes couches pour séparer les responsabilités et favoriser la réutilisation du code. Voici les principales couches de l'architecture :

### 1. **Features (Fonctionnalités)**

Chaque fonctionnalité de l'application est isolée dans son propre module. Une fonctionnalité est représentée par un dossier sous `lib/features/`. Chaque module contient les éléments suivants :

- **Data** : Contient les implémentations concrètes des sources de données (API, base de données locale) et les modèles de données. Les classes de repository se trouvent ici.
- **Domain** : Contient les entités (modèles métiers) et les interfaces des repositories.
- **Presentation** : Contient les contrôleurs, widgets, et écrans liés à la fonctionnalité. C'est ici que GetX intervient pour la gestion de l'état, la navigation, et l'injection des dépendances.

**Exemple de structure :**

```
lib/
│
├── features/
│   ├── product/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   │   └── sources/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   └── repositories/
│   │   └── presentation/
│   │       ├── controllers/
│   │       ├── widgets/
│   │       └── screens/
│   └── cart/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── ...
```

### 2. **Routing (Gestion des Routes)**

La gestion des routes est centralisée dans le fichier `lib/routing/AppRoutes.dart`. GetX permet une navigation fluide et une gestion des arguments lors du passage d'une page à l'autre.

**Exemple :**

```dart
class AppRoutes {
  static const String home = '/';
  static const String productDetail = '/productDetail';
  static const String cart = '/cart';

  static List<GetPage> routes = [
    GetPage(name: home, page: () => ProductListScreen()),
    GetPage(name: productDetail, page: () => ProductDetailScreen()),
    GetPage(name: cart, page: () => CartScreen()),
  ];
}
```

### 3. **Gestion de l'État**

GetX est utilisé pour la gestion de l'état. Les contrôleurs sont utilisés pour gérer les logiques métier et l'état de l'application. Chaque contrôleur est associé à une fonctionnalité spécifique et est injecté dans la présentation via `Get.put()`.

**Exemple :**

```dart
class ProductController extends GetxController {
  final ProductRepository repository;
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  ProductController(this.repository);

  void fetchProducts() async {
    try {
      isLoading(true);
      products.value = await repository.getProducts();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
```

### 4. **Dépendances**

L'injection de dépendances est gérée par GetX, ce qui permet de créer et de partager les instances de services et de contrôleurs au sein de l'application.

**Exemple :**

```dart
final ProductController controller = Get.put(
    ProductController(HttpProductRepositoryImpl(client: http.Client())));
```

## Gestion des Notifications et des Badges

L'application utilise également GetX pour la gestion des notifications utilisateur et des badges sur l'icône du panier, offrant ainsi une meilleure expérience utilisateur.

## Conclusion

L'architecture de ce projet est pensée pour être modulaire, testable et maintenable. Grâce à l'utilisation de GetX et des principes de Clean Architecture, nous avons pu créer une application structurée, facile à comprendre et à faire évoluer. Cette architecture facilite également la collaboration entre développeurs et permet d'intégrer de nouvelles fonctionnalités sans compromettre la stabilité du code existant.
