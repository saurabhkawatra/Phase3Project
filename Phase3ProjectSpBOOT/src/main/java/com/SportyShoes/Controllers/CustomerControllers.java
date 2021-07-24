package com.SportyShoes.Controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.SportyShoes.DAO.ProductDAO;
import com.SportyShoes.DAO.Purchase_EntryDAO;
import com.SportyShoes.DAO.UserDAO;
import com.SportyShoes.MODELS.Product;
import com.SportyShoes.MODELS.Purchase_Entry;

@Controller
@RequestMapping("/customer")
public class CustomerControllers {
		
	@Autowired
	private UserDAO userDao;
	@Autowired
	private ProductDAO productDao;
	@Autowired
	private Purchase_EntryDAO purchase_entryDAO;
	
	
	
	@RequestMapping("/customer-home")
	public String customerhome(Model model)
	{
		System.out.println("Executing customerhome Handler(CustomerController)");
		
		
		List<Product> productlist=new ArrayList<>();
		productDao.findAll().forEach(p -> {productlist.add(p);});
		model.addAttribute("productlist", productlist);
		
		return "customer/customer_home";
	}
	
	@RequestMapping(path = "/buyproduct",method = RequestMethod.POST)
	public String buyproduct(Model model,@RequestParam("buyproductid") int productid,@RequestParam("buyuserid") int userid)
	{
		System.out.println("Executing buyproduct Handler(CustomerController)");
		System.out.println("Purchase Request for Product Id :: "+productid+" :: User Id :: "+userid);
		Date date = new Date();
		System.out.println("date :: "+date);
		Purchase_Entry pe = new Purchase_Entry(productid, userid, date);
		Purchase_Entry saved=purchase_entryDAO.save(pe);
		System.out.println("Purchase Entry Made :: "+saved);
		model.addAttribute("purchasedproductidbycustomer",productid);
		
		List<Product> productlist=new ArrayList<>();
		productDao.findAll().forEach(p -> {productlist.add(p);});
		model.addAttribute("productlist", productlist);
		return "customer/customer_home";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
