package com.se.toyshop.controller;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.toyshop.dao.CategoryDAO;
import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Brand;
import com.se.toyshop.entity.Product;

@Controller
@RequestMapping("/san-pham")
public class ProductController {
	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping("info")
	public String showInfo(Model model) {
		Product p = productDAO.getProduct();

		model.addAttribute("product", p);

		return "userInfo";
	}

	@RequestMapping("/tat-ca")
	public String showAllProduct(Model model, @RequestParam("page") int page, @RequestParam("limit") int limit) {
		List<Product> list = new ArrayList<Product>();

		int totalItem = productDAO.getAllProducts().size();

		list = productDAO.getAllProducts(page, limit);
		model.addAttribute("products", list);
		model.addAttribute("id", null);
		model.addAttribute("totalPage", (int) Math.ceil((double) totalItem / limit)); // tÃ­nh tá»•ng sá»‘ trang
		model.addAttribute("page", page);
		return "product-full";
	}

	@RequestMapping("/{_id}")
	public String showProductDetail(@PathVariable("_id") ObjectId id, Model model) {

		Product product = productDAO.getProductById(id);
		product.setBrand(productDAO.getBrandById(product.getBrand().get_id()));
		product.setCategory(productDAO.getCategoryById(product.getCategory().get_id()));
		
		System.out.println(product.toString());
		
		model.addAttribute("product", product);

		return "product-detail";
	}

	@RequestMapping("/")
	public String showProductByAge(@RequestParam("tuoi") String value, Model model, @RequestParam("page") int page,
			@RequestParam("limit") int limit) {
		String strAge = "";
		switch (value) {
		case "1-3-tuoi":
			strAge = "1-3 tuổi";
			break;
		case "4-6-tuoi":
			strAge = "4-6 tuổi";
			break;
		case "6-11-tuoi":
			strAge = "6-11 tuổi";
			break;
		case "12-tuoi-tro-len":
			strAge = "12 tuổi trở lên";
			break;
		default:
			strAge = "1-3 tuổi";
			break;
		}

		List<Product> list = new ArrayList<Product>();
		int totalItem = productDAO.getProductByAge(strAge).size();
		System.out.println("totaltem: " + totalItem);
		list = productDAO.getProductByAge(strAge,page,limit);
	
		model.addAttribute("products", list);
		model.addAttribute("totalPage", (int) Math.ceil((double) totalItem / limit)); // tÃ­nh tá»•ng sá»‘ trang
		model.addAttribute("page", page);
		model.addAttribute("tuoi",value);
		
		return "product-age";
	}
}
