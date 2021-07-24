package com.SportyShoes.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.SportyShoes.MODELS.Purchase_Entry;

public interface Purchase_EntryDAO extends CrudRepository<Purchase_Entry, Integer>{
	
	@Query(value = "select * from purchase_entry",nativeQuery = true)
	public List<Purchase_Entry> getallpurchases();
	
	@Query(value="select * from purchase_entry where purchased_date= :date",nativeQuery = true)
	public List<Purchase_Entry> searchbydate(@Param("date") String date);
	
	@Query(value="select * from purchase_entry where purchased_date between :stdate and :enddate",nativeQuery = true)
	public List<Purchase_Entry> searchbydaterange(@Param("stdate") String startdate,@Param("enddate") String enddate);
	
	@Query(value="select purchase_entry_id,purchased_By_userid,purchased_Date,purchased_productid from purchase_entry,product where purchase_entry.purchased_productid=product.product_id and product.product_for=:prodfor",nativeQuery = true)
	public List<Purchase_Entry> searchbyproductfor(@Param("prodfor") String productfor);
	
	@Query(value="select purchase_entry_id,purchased_By_userid,purchased_Date,purchased_productid from purchase_entry,product where purchase_entry.purchased_productid=product.product_id and product.product_type=:prodtype",nativeQuery = true)                                         
	public List<Purchase_Entry> searchbyproducttype(@Param("prodtype") String producttype);

}
