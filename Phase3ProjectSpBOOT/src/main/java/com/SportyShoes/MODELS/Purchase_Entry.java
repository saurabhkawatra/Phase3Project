package com.SportyShoes.MODELS;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Purchase_Entry {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int purchase_entry_id;
	
	private int purchased_productid;
	private int purchased_By_userid;
	private Date purchased_Date;
	
	
	public Purchase_Entry() {
		super();
	}


	public Purchase_Entry(int purchase_entry_id, int purchased_productid, int purchased_By_userid,
			Date purchased_Date) {
		super();
		this.purchase_entry_id = purchase_entry_id;
		this.purchased_productid = purchased_productid;
		this.purchased_By_userid = purchased_By_userid;
		this.purchased_Date = purchased_Date;
	}


	public Purchase_Entry(int purchased_productid, int purchased_By_userid, Date purchased_Date) {
		super();
		this.purchased_productid = purchased_productid;
		this.purchased_By_userid = purchased_By_userid;
		this.purchased_Date = purchased_Date;
	}
	
	
	@Override
	public String toString() {
		return "Purchase_Entry [purchase_entry_id=" + purchase_entry_id + ", purchased_productid=" + purchased_productid
				+ ", purchased_By_userid=" + purchased_By_userid + ", purchased_Date=" + purchased_Date + "]";
	}


	public int getPurchase_entry_id() {
		return purchase_entry_id;
	}


	public void setPurchase_entry_id(int purchase_entry_id) {
		this.purchase_entry_id = purchase_entry_id;
	}


	public int getPurchased_productid() {
		return purchased_productid;
	}


	public void setPurchased_productid(int purchased_productid) {
		this.purchased_productid = purchased_productid;
	}


	public int getPurchased_By_userid() {
		return purchased_By_userid;
	}


	public void setPurchased_By_userid(int purchased_By_userid) {
		this.purchased_By_userid = purchased_By_userid;
	}


	public Date getPurchased_Date() {
		return purchased_Date;
	}


	public void setPurchased_Date(Date purchased_Date) {
		this.purchased_Date = purchased_Date;
	}



	
}
