// OP1: Insert all 3 documents
db.products.insertMany([
  {
    "id": 101,
    "name": "Samsung Galaxy S26",
    "category": "Electronics",
    "price": 75000,
    "brand": "Samsung",
    "productDetails": {
      "warranty": "2 years",
      "voltage": "220V",
      "features": [
        "5G",
        "AMOLED Display",
        "128GB Storage",
        "8GB RAM"
      ],
      "dimensions": {
        "height_mm": 146,
        "width_mm": 70,
        "depth_mm": 7.6
      }
    },
    "ratings": 4.8,
    "stock": 150
  },
  {
    "id": 201,
    "name": "Max style jogger",
    "category": "Clothing",
    "price": 1500,
    "brand": "Max",
    "sizesAvailable": [
      "S",
      "M",
      "L",
      "XL"
    ],
    "colorsAvailable": [
      "Blue",
      "Black",
      "Gray"
    ],
    "material": "Cotton",
    "careInstructions": "Machine wash cold, tumble dry low",
    "stock": 75
  },
  {
    "id": 301,
    "name": "Amul Fresh Milk 1L",
    "category": "Groceries",
    "price": 60,
    "expiryDate": "2026-03-30",
    "brand": "Amul",
    "nutritionalInfo": {
      "calories": 150,
      "protein_g": 8,
      "fat_g": 8,
      "carbs_g": 12
    },
    "ingredients": [
      "Milk"
    ],
    "organic": false,
    "stock": 200
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

//  OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiryDate: { $lt: ISODate("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { id: 101 },
  { $set: { discount_percent: 10 } }
);

// OP5: Create an index on the 'category' field
db.products.createIndex({ category: 1 });

// Explanation: 
// Indexing 'category' improves query performance when filtering by product category
// and fetches all products in that category faster.
