package com.grocery.entities;

public class product {
	
private int id;	
private String name;
private double price;
private int quantity;
private String unit;
private String description;
private byte[] image;






public product(int id, String name, double price, int quantity, String unit,String description, byte[] image) {
	
	this.id = id;
	this.name = name;
	this.price = price;
	this.quantity = quantity;
	this.unit=unit;
	this.description = description;
	this.image = image;
}


public product() {
	
}

public product(String name, double price, int quantity,String unit, String description, byte[] image) {
	
	this.name = name;
	this.price = price;
	this.quantity = quantity;
	this.unit=unit;
	this.description = description;
	this.image = image;
}







public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public double getPrice() {
	return price;
}

public void setPrice(double price) {
	this.price = price;
}

public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}


public String getUnit() {
	return unit;
}


public void setUnit(String unit) {
	this.unit = unit;
}


public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public byte[] getImage() {
	return image;
}

public void setImage(byte[] image) {
	this.image = image;
}







}
