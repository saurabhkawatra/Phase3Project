package com.SportyShoes.DAO;

import org.springframework.data.repository.CrudRepository;

import com.SportyShoes.MODELS.Product;

public interface ProductDAO extends CrudRepository<Product, Integer> {
	
	

}
