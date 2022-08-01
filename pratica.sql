CREATE DATABASE "clothing_store";

CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL
);

CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "userAddresses" (
    "id" SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES "users"("id"),
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "postalCode" VARCHAR(8) NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id"),
);

CREATE TABLE "categories" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
);

CREATE TABLE "sizes" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
);

CREATE TABLE "products" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "mainPhoto" TEXT NOT NULL,
    "sizeId" INTEGER NOT NULL REFERENCES "sizes"("id"),
    "categoryId" INTEGER NOT NULL REFERENCES "categories"("id")
);

CREATE TABLE "additionalPhotos" (
    "id" SERIAL PRIMARY KEY,
    "url" TEXT NOT NULL,
    "productId" INTEGER NOT NULL REFERENCES "products"("id")
);

CREATE TABLE "orders" (
    "id" SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES "users"("id"),
    "addressId" INTEGER NOT NULL REFERENCES "userAddresses"("id"),
    "status" TEXT NOT NULL,
    "date" DATE,
);

CREATE TABLE "orderDetails" (
    "id" SERIAL PRIMARY KEY,
    "productId" INTEGER NOT NULL REFERENCES "products"("id"),
    "quantity" INTEGER NOT NULL,
    "totalPrice" INTEGER NOT NULL,
    "orderId" INTEGER NOT NULL REFERENCES "orders"("id")
);

