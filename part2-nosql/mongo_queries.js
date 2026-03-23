// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "E101",
    name: "Smartphone",
    category: "Electronics",
    brand: "Samsung",
    price: 25000,
    specs: {
      voltage: "220V",
      warranty_years: 1
    },
    features: ["Touchscreen", "128GB Storage"]
  },
  {
    _id: "C201",
    name: "T-Shirt",
    category: "Clothing",
    brand: "H&M",
    price: 799,
    details: {
      size: "M",
      color: "Black",
      material: "Cotton"
    },
    care: ["Machine Wash", "Do Not Bleach"]
  },
  {
    _id: "G301",
    name: "Milk",
    category: "Groceries",
    brand: "Amul",
    price: 30,
    expiry: {
      manufacture_date: "2024-12-20",
      expiry_date: "2024-12-25"
    },
    nutrition: {
      calories: 42,
      protein_g: 3.4
    }
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  "expiry.expiry_date": { $lt: "2025-01-01" }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "E101" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });