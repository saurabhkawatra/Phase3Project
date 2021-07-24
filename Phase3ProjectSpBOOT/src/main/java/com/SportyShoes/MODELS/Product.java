package com.SportyShoes.MODELS;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int product_id;
	
	private String product_name;
	private String product_type;
	private String product_for;
	private String product_image_name;
	private String product_image_type;
	private int product_price;
	
	
	public Product() {
		super();
	}


	public Product(int product_id, String product_name, String product_type, String product_for,
			String product_image_name, String product_image_type, int product_price) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_type = product_type;
		this.product_for = product_for;
		this.product_image_name = product_image_name;
		this.product_image_type = product_image_type;
		this.product_price = product_price;
	}


	public Product(String product_name, String product_type, String product_for, String product_image_name,
			String product_image_type, int product_price) {
		super();
		this.product_name = product_name;
		this.product_type = product_type;
		this.product_for = product_for;
		this.product_image_name = product_image_name;
		this.product_image_type = product_image_type;
		this.product_price = product_price;
	}


	@Override
	public String toString() {
		return "Product details are [product_id=" + product_id + ", product_name=" + product_name + ", product_type=" + product_type
				+ ", product_for=" + product_for + ", product_image_name=" + product_image_name
				+ ", product_image_type=" + product_image_type + ", product_price=" + product_price + "]";
	}


	public int getProduct_id() {
		return product_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getProduct_type() {
		return product_type;
	}


	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}


	public String getProduct_for() {
		return product_for;
	}


	public void setProduct_for(String product_for) {
		this.product_for = product_for;
	}


	public String getProduct_image_name() {
		return product_image_name;
	}


	public void setProduct_image_name(String product_image_name) {
		this.product_image_name = product_image_name;
	}


	public String getProduct_image_type() {
		return product_image_type;
	}


	public void setProduct_image_type(String product_image_type) {
		this.product_image_type = product_image_type;
	}


	public int getProduct_price() {
		return product_price;
	}


	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	
}
