package com.SportyShoes.Controllers;

import java.io.File;

import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.SportyShoes.DAO.ProductDAO;
import com.SportyShoes.DAO.Purchase_EntryDAO;
import com.SportyShoes.DAO.UserDAO;
import com.SportyShoes.MODELS.Product;
import com.SportyShoes.MODELS.Purchase_Entry;
import com.SportyShoes.MODELS.User;

@Controller
@RequestMapping(path = {"/admin"})
public class AdminControllers {
	
	@Autowired
	private UserDAO userDao;
	@Autowired
	private ProductDAO productDao;
	@Autowired
	private Purchase_EntryDAO purchase_entryDAO;

	
	@RequestMapping(path = {"/admin-home"},method = {RequestMethod.GET})
	public String admin_home(HttpServletRequest request,HttpServletResponse response,Model model)
	{
		System.out.println("Executing admin_home Handler(AdminController)");
		List<Product> allproductlist=new ArrayList<>();
		Iterator<Product> allproductiterator = productDao.findAll().iterator();
		while(allproductiterator.hasNext()) {
			allproductlist.add(allproductiterator.next());
		}
		model.addAttribute("productlist", allproductlist);
		
				if(request.getSession(false)!=null) {
							Enumeration<String> allusers = request.getSession(false).getAttributeNames();
							while(allusers.hasMoreElements())
								System.out.println("Session Attribute :: "+allusers.nextElement());
				}
		
			
		return "admin_home";
	}
	
	@RequestMapping(path = "/changePassword",method = RequestMethod.POST)
	public String changepassword(Model model,@RequestParam("oldpassword") String oldp,@RequestParam("newpassword") String newp,HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("Executing changePassword Handler(AdminController)");
		User u1=(User)request.getSession(false).getAttribute("user_admin");
		
		if(u1.getPassword().equals(oldp)) {
			System.out.println("Old Password Confirmed");
			u1.setPassword(newp);
			User u2=userDao.save(u1);
			System.out.println("New Password Set in the Database!");
			request.getSession(false).setAttribute("user_admin", u2);
			System.out.println("Updated User object Set in the current httpSession");
			model.addAttribute("passwordchangerequestresult", "success");
		}
		else {
			System.out.println("Old Password Failed Confirmation!!");
			model.addAttribute("passwordchangerequestresult", "fail");
		}
		
		List<Product> allproductlist=new ArrayList<>();
		Iterator<Product> allproductiterator = productDao.findAll().iterator();
		while(allproductiterator.hasNext()) {
			allproductlist.add(allproductiterator.next());
		}
		
		model.addAttribute("productlist", allproductlist);
		
		
		return "operation_result";
	}
	
	
	@RequestMapping(path = {"/addproduct"},method = {RequestMethod.POST},consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String addproduct(Model model,HttpServletRequest request,HttpServletResponse response,@RequestParam(required = false,name = "imagefile") MultipartFile imgfile,@ModelAttribute Product newprod)
	{
		System.out.println("Executing addproduct Handler(AdminController)");
		System.out.println("Details received from Form : "+newprod);
		String msg="New Product ADDED :: "+productDao.save(newprod).toString();
		System.out.println("msg :: "+msg);
		if(imgfile.getOriginalFilename().isEmpty())
		{
			System.out.println("if condition isEmpty executed === No Image Uploaded === Setting Default image");
			
			String genfilename="default-product-image.jpg";
			System.out.println("Generated image name :: "+genfilename);
			newprod.setProduct_image_name(genfilename);
			newprod.setProduct_image_type("image/jpeg");
			String msg2="Updated Filename in Product :: "+productDao.save(newprod).toString();
			System.out.println(msg2);
			model.addAttribute("addedproduct", newprod);
		}
		else {
			
			System.out.println("ContentType :: "+imgfile.getContentType());
			System.out.println("Uploading File --> "+imgfile.getOriginalFilename());
			
			File file=new File(request.getRealPath(""));
			String newpath=file.getParent()+"\\resources\\static\\Resources\\uploads\\";
			System.out.println("newpath :: "+newpath);
			
			File infile=new File(newpath+String.valueOf(newprod.getProduct_id())+"_"+imgfile.getOriginalFilename());
			
			try {
				System.out.println("File path :: "+newpath+String.valueOf(newprod.getProduct_id())+"_"+imgfile.getOriginalFilename());
				if(infile.exists())
				{
					System.out.println("A file already exists with same name, and that file is going to be replaced");
				}
				infile.createNewFile();
				imgfile.transferTo(infile);
				System.out.println("File was uploaded successfully");
				
				String genfilename=String.valueOf(newprod.getProduct_id())+"_"+imgfile.getOriginalFilename();
				System.out.println("Generated image name :: "+genfilename);
				newprod.setProduct_image_name(genfilename);
				newprod.setProduct_image_type(imgfile.getContentType());
				String msg2="Updated File Name and Type :: "+productDao.save(newprod).toString();
				System.out.println(msg2);
				model.addAttribute("addedproduct", newprod);
			}catch(Exception e)
			{
				System.out.println("File Exception");
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
		
		List<Product> allproductlist=new ArrayList<>();
		Iterator<Product> allproductiterator = productDao.findAll().iterator();
		while(allproductiterator.hasNext()) {
			allproductlist.add(allproductiterator.next());
		}
		model.addAttribute("productlist", allproductlist);
		
		
		return "operation_result";
	}
	
	@RequestMapping(path = {"/removeproducts"},method = RequestMethod.POST)
	public String removeproduct(Model model,@RequestParam(name = "rem_products", required = false ) int[] rem_products_ids,HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("Executing removeproduct Handler(AdminController)");
		if(rem_products_ids==null)
		{
			System.out.println("No Value Selected for removal...Redirecting to admin-home page...");
			return "redirect:/admin/admin-home";
		}
		else {
				System.out.println("Number of Products selected for Removal :: "+rem_products_ids.length);
				List<Product> removal_product_list = new ArrayList<>();
				for(int r:rem_products_ids)
				{
					Product remprod = productDao.findById(r).get();
					System.out.println("Removing Product... "+remprod);
					
					if(!remprod.getProduct_image_name().equals("default-product-image.jpg"))
					{
						File f=new File(request.getRealPath(""));
						File f1=new File(f.getParent()+"\\resources\\static\\Resources\\uploads\\"+remprod.getProduct_image_name());
						try {
							f1.delete();
							System.out.println("Image File for the Product Deleted...");
						}catch(Exception e)
						{
							System.out.println("Error During deleting the Image File for the product");
							System.out.println(e.getMessage());
							e.printStackTrace();
						}
						
					}
					
					productDao.delete(remprod);
					removal_product_list.add(remprod);
				}
				List<Product> allproductlist=new ArrayList<>();
				Iterator<Product> allproductiterator = productDao.findAll().iterator();
				while(allproductiterator.hasNext()) {
					allproductlist.add(allproductiterator.next());
				}
				model.addAttribute("productlist", allproductlist);
				model.addAttribute("removal_product_list", removal_product_list);
			
				return "operation_result";
		}
		
	}
	
	@RequestMapping("/updateproduct/{id}")
	public String updateproduct(@PathVariable("id") int updateid,Model model)
	{
		System.out.println("Executing updateproduct Handler(AdminController)");
		System.out.println("Update Product Id :: "+updateid);
		Product upd = productDao.findById(updateid).get();
		
		List<Product> allproductlist=new ArrayList<>();
		Iterator<Product> allproductiterator = productDao.findAll().iterator();
		while(allproductiterator.hasNext()) {
			allproductlist.add(allproductiterator.next());
		}
		model.addAttribute("productlist", allproductlist);
		model.addAttribute("update_product", upd);
		
		
		return "update_product";
	}
	
	@RequestMapping(path = "/updateproduct",method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String updateproduct_op(Model model,@ModelAttribute Product updprod,@RequestParam("updateproductid") int pid,@RequestParam(name = "imagefile",required = false) MultipartFile imagefile,HttpServletRequest request,HttpServletResponse response)  
	{
		System.out.println("Executing updateproduct_op Handler(AdminController)");
		System.out.println("Values Received for Update Product :: "+updprod);
		System.out.println("Product Id to be Updated :: "+pid);
		Product oldproduct=productDao.findById(pid).get();
		Product oldproduct1 = new Product();
		oldproduct1.setProduct_for(oldproduct.getProduct_for());oldproduct1.setProduct_id(oldproduct.getProduct_id());oldproduct1.setProduct_image_name(oldproduct.getProduct_image_name());oldproduct1.setProduct_image_type(oldproduct.getProduct_image_type());oldproduct1.setProduct_name(oldproduct.getProduct_name());oldproduct1.setProduct_price(oldproduct.getProduct_price());oldproduct1.setProduct_type(oldproduct.getProduct_type());
		System.out.println("Old Product :: "+oldproduct);
		model.addAttribute("oldproductdetails", oldproduct1);
		if(imagefile.isEmpty())
		{
			System.out.println("No Image Uploaded for Update!");
			updprod.setProduct_id(oldproduct.getProduct_id());
			updprod.setProduct_image_name(oldproduct.getProduct_image_name());
			updprod.setProduct_image_type(oldproduct.getProduct_type());
			Product saved=productDao.save(updprod);
			System.out.println("Product Updated Successfully!");
			System.out.println("Updated Product :: "+saved);
		}
		else {
			File f=new File(request.getRealPath(""));
			File oldimage=new File(f.getParent()+"\\resources\\static\\Resources\\uploads\\"+oldproduct.getProduct_image_name());
			File newimage=new File(f.getParent()+"\\resources\\static\\Resources\\uploads\\"+oldproduct.getProduct_id()+"_"+imagefile.getOriginalFilename());
			if(oldproduct.getProduct_image_name().equals("default-product-image.jpg"))
			{
				System.out.println("Image Uploaded -----  Previously Default Image");
				updprod.setProduct_id(oldproduct.getProduct_id());
				updprod.setProduct_image_name(oldproduct.getProduct_id()+"_"+imagefile.getOriginalFilename());
				updprod.setProduct_image_type(imagefile.getContentType());
				try {
					newimage.createNewFile();
					imagefile.transferTo(newimage);
					System.out.println("Image File is Created Successfully! :: "+newimage.getName());
				}catch(Exception e) {
					System.out.println("File Update Error!!");
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
				Product saved=productDao.save(updprod);
				System.out.println("Product Updated Successfully!");
				System.out.println("Updated Product :: "+saved);
				
			}
			else {
				System.out.println("Image Uploaded -----  Image is to be Updated");
				oldimage.delete();
				System.out.println("Old Image deleted!!");
				updprod.setProduct_id(oldproduct.getProduct_id());
				updprod.setProduct_image_name(oldproduct.getProduct_id()+"_"+imagefile.getOriginalFilename());
				updprod.setProduct_image_type(imagefile.getContentType());
				try {
					newimage.createNewFile();
					imagefile.transferTo(newimage);
					System.out.println("Image File is Created Successfully! :: "+newimage.getName());
				}catch(Exception e) {
					System.out.println("File Update Error!!");
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
				Product saved=productDao.save(updprod);
				System.out.println("Product Updated Successfully!");
				System.out.println("Updated Product :: "+saved);
			}
		}
		
		model.addAttribute("updateproductresult", updprod);
		
		List<Product> allproductlist=new ArrayList<>();
		Iterator<Product> allproductiterator = productDao.findAll().iterator();
		while(allproductiterator.hasNext()) {
			allproductlist.add(allproductiterator.next());
		}
		model.addAttribute("productlist", allproductlist);
		
		
		return "operation_result";
	}
	
	@RequestMapping(path = {"/showCustomers"})
	public String showAllcustomers(Model model)
	{
		System.out.println("Executing showAllCustomers Handler(AdminController)");
		List<User> customerList=userDao.getUserbyType("customer");
		model.addAttribute("customerList", customerList);
		
		List<Product> allproductlist=new ArrayList<>();
		Iterator<Product> allproductiterator = productDao.findAll().iterator();
		while(allproductiterator.hasNext()) {
			allproductlist.add(allproductiterator.next());
		}
		model.addAttribute("productlist", allproductlist);
		return "showAllCustomers";
	}
	
	@RequestMapping(path = {"/searchcustomer"}, method = RequestMethod.POST)
	public String searchCustomer(Model model,@RequestParam("method") String method,HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("Executing searchCustomer Handler(AdminController)");
		
		if(method.equals("searchbyname")) {
			
			System.out.println("Search By Name");
			List<User> nameresultlist = new ArrayList<>();
			String namepattern=(String)request.getParameter("customersearchbyname");
			namepattern="%"+namepattern+"%";
			System.out.println("namepattern :: "+namepattern);
			nameresultlist=userDao.getCustomerbyName(namepattern);
										System.out.println("Size of resultList :: "+nameresultlist.size());
										nameresultlist.forEach(u->{System.out.println(u);});
			model.addAttribute("customersearchresult",nameresultlist);
			model.addAttribute("methodname", "resultbyname");
			
		}else if(method.equals("searchbyphoneno")) {
			
			System.out.println("Search By Phone No");
			List<User> phoneresultlist = new ArrayList<>();
			String phonepattern=(String)request.getParameter("customersearchbyphoneno");
			phonepattern="%"+phonepattern+"%";
			phoneresultlist=userDao.getCustomerbyphoneNo(phonepattern);
										System.out.println("Size of resultList :: "+phoneresultlist.size());
										phoneresultlist.forEach(u->{System.out.println(u);});
			model.addAttribute("customersearchresult",phoneresultlist );
			model.addAttribute("methodname", "resultbyphoneno");
			
		}else {
			
			System.out.println("Search By Username");
			User usernameresult = new User();
			String usernamepattern=(String)request.getParameter("customersearchbyusername");
			usernameresult=userDao.getCustomerbyusername(usernamepattern);
			 		System.out.println("Result user :: "+usernameresult);
			model.addAttribute("customersearchresult",usernameresult );
			model.addAttribute("methodname", "resultbyusername");
			
		}
		
		
		List<Product> allproductlist=new ArrayList<>();
		Iterator<Product> allproductiterator = productDao.findAll().iterator();
		while(allproductiterator.hasNext()) {
			allproductlist.add(allproductiterator.next());
		}
		
		model.addAttribute("productlist", allproductlist);
		
		return "operation_result";
		
	}
	
	@RequestMapping(path = {"/showPurchases"})
	public String showAllpurchases(Model model)
	{
		System.out.println("Executing showAllpurchases Handler(AdminController)");
		List<Purchase_Entry> purchaseList=purchase_entryDAO.getallpurchases();
		List<User> purchaseuserlist= new ArrayList<>();
		List<Product> purchaseproductlist = new ArrayList<>();
		if(purchaseList!=null)
		{
			for(Purchase_Entry p : purchaseList)
			{
				User u1=userDao.findById(p.getPurchased_By_userid()).get();
							//System.out.println("Testing u1=  "+u1);
				purchaseuserlist.add(u1);
				Product p1=productDao.findById(p.getPurchased_productid()).get();
							//System.out.println("Testing p1=  "+p1);
				purchaseproductlist.add(p1);
			}
		}
		
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("purchase_productList", purchaseproductlist);
		model.addAttribute("purchase_userList", purchaseuserlist);
				
		List<Product> allproductlist=new ArrayList<>();
		Iterator<Product> allproductiterator = productDao.findAll().iterator();
		while(allproductiterator.hasNext()) {
			allproductlist.add(allproductiterator.next());
		}
		model.addAttribute("productlist", allproductlist);
		return "showAllPurchases";
	}
	
	@RequestMapping(path = {"/searchpurchase"},method = RequestMethod.POST)
	public String searchpurchase(Model model,@RequestParam("method") String method,HttpServletRequest request,HttpServletResponse response)
	{
		
		System.out.println("Executing searchpurchase Handler(AdminController)");
		
		if(method.equals("particulardate")) {
			System.out.println("search purchases by particular date... ");
			String date=request.getParameter("purchasesearchdate");
			System.out.println("Selected date for Search :: "+date);
			List<Purchase_Entry> purchasesearchresultlist=purchase_entryDAO.searchbydate(date);
			System.out.println("Number of Results Found :: "+purchasesearchresultlist.size());
							purchasesearchresultlist.forEach(pe -> System.out.println(pe));
			List<User> purchasesearchuserlist=new ArrayList<>();
			List<Product> purchasesearchproductlist=new ArrayList<>();
			for(Purchase_Entry pe:purchasesearchresultlist)
			{
				User u1=userDao.findById(pe.getPurchased_By_userid()).get();
				purchasesearchuserlist.add(u1);
				Product p1=productDao.findById(pe.getPurchased_productid()).get();
				purchasesearchproductlist.add(p1);
			}
							purchasesearchuserlist.forEach(u -> System.out.println(u));
							purchasesearchproductlist.forEach(p -> System.out.println(p));
			model.addAttribute("purchaseList", purchasesearchresultlist);
			model.addAttribute("purchase_userList", purchasesearchuserlist);
			model.addAttribute("purchase_productList", purchasesearchproductlist);
			
		} else if(method.equals("rangedate")) {
			System.out.println("search purchases by range of dates... ");
			String fromdate=request.getParameter("purchasesearchfromdate");
			String todate=request.getParameter("purchasesearchtodate");
			System.out.println("Selected start-date for Search :: "+fromdate);
			System.out.println("Selected end-date for Search :: "+todate);
			List<Purchase_Entry> purchasesearchresultlist=purchase_entryDAO.searchbydaterange(fromdate, todate);
			System.out.println("Number of Results Found :: "+purchasesearchresultlist.size());
							purchasesearchresultlist.forEach(pe -> System.out.println(pe));
			List<User> purchasesearchuserlist=new ArrayList<>();
			List<Product> purchasesearchproductlist=new ArrayList<>();
			for(Purchase_Entry pe:purchasesearchresultlist)
			{
			User u1=userDao.findById(pe.getPurchased_By_userid()).get();
			purchasesearchuserlist.add(u1);
			Product p1=productDao.findById(pe.getPurchased_productid()).get();
			purchasesearchproductlist.add(p1);
			}
						purchasesearchuserlist.forEach(u -> System.out.println(u));
						purchasesearchproductlist.forEach(p -> System.out.println(p));
			model.addAttribute("purchaseList", purchasesearchresultlist);
			model.addAttribute("purchase_userList", purchasesearchuserlist);
			model.addAttribute("purchase_productList", purchasesearchproductlist);

		} else if(method.equals("productcategoryfor")) {
			System.out.println("search purchases by category-for of Product... ");
			String searchproductfor=request.getParameter("searchpurchaseproductfor");
			System.out.println("Selected Product-for for Search :: "+searchproductfor);
			List<Purchase_Entry> purchasesearchresultlist=purchase_entryDAO.searchbyproductfor(searchproductfor);
			System.out.println("Number of Results Found :: "+purchasesearchresultlist.size());
									purchasesearchresultlist.forEach(pe -> System.out.println(pe));
			List<User> purchasesearchuserlist=new ArrayList<>();
			List<Product> purchasesearchproductlist=new ArrayList<>();
			for(Purchase_Entry pe:purchasesearchresultlist)
			{
			User u1=userDao.findById(pe.getPurchased_By_userid()).get();
			purchasesearchuserlist.add(u1);
			Product p1=productDao.findById(pe.getPurchased_productid()).get();
			purchasesearchproductlist.add(p1);
			}
						purchasesearchuserlist.forEach(u -> System.out.println(u));
						purchasesearchproductlist.forEach(p -> System.out.println(p));
			model.addAttribute("purchaseList", purchasesearchresultlist);
			model.addAttribute("purchase_userList", purchasesearchuserlist);
			model.addAttribute("purchase_productList", purchasesearchproductlist);
						
			
		} else {
			System.out.println("search purchases by Type of Product... ");
			String searchproducttype=request.getParameter("inputproducttype");
			System.out.println("Selected Product-type for Search :: "+searchproducttype);
			List<Purchase_Entry> purchasesearchresultlist=purchase_entryDAO.searchbyproducttype(searchproducttype);
			System.out.println("Number of Results Found :: "+purchasesearchresultlist.size());
									purchasesearchresultlist.forEach(pe -> System.out.println(pe));
			List<User> purchasesearchuserlist=new ArrayList<>();
			List<Product> purchasesearchproductlist=new ArrayList<>();
			for(Purchase_Entry pe:purchasesearchresultlist)
			{
			User u1=userDao.findById(pe.getPurchased_By_userid()).get();
			purchasesearchuserlist.add(u1);
			Product p1=productDao.findById(pe.getPurchased_productid()).get();
			purchasesearchproductlist.add(p1);
			}
						purchasesearchuserlist.forEach(u -> System.out.println(u));
						purchasesearchproductlist.forEach(p -> System.out.println(p));
			model.addAttribute("purchaseList", purchasesearchresultlist);
			model.addAttribute("purchase_userList", purchasesearchuserlist);
			model.addAttribute("purchase_productList", purchasesearchproductlist);
		}
		
		
		List<Product> allproductlist=new ArrayList<>();
		Iterator<Product> allproductiterator = productDao.findAll().iterator();
		while(allproductiterator.hasNext()) {
			allproductlist.add(allproductiterator.next());
		}
		
		model.addAttribute("productlist", allproductlist);
		return "operation_result";
	}
	
	
	
	
	
	
	
	
	

	
}
