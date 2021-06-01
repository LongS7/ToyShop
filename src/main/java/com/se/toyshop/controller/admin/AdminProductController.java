package com.se.toyshop.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.toyshop.dao.CategoryDAO;
import com.se.toyshop.dao.ProductDAO;
import com.se.toyshop.entity.Brand;
import com.se.toyshop.entity.Category;
import com.se.toyshop.entity.Gender;
import com.se.toyshop.entity.Product;

@Controller
@RequestMapping("/admin/manage-products")
public class AdminProductController {
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String showFormForAdd(Model model) {

		// gender
		List<String> listGender = productDAO.getAllGender();

		// brands
		List<Brand> listBrand = productDAO.getAllBrand();

		// age
		List<String> listAge = productDAO.getAllAge();

		// category
		List<Category> listCategory = categoryDAO.getAllCateroty();

		Product product = new Product();
		

		model.addAttribute("product", product);
		model.addAttribute("listGender", listGender);
		model.addAttribute("listBrand", listBrand);
		model.addAttribute("listAge", listAge);
		model.addAttribute("listCategory", listCategory);

		return "admin/product-form";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String showFormForEdit(@RequestParam("productId") ObjectId productId, Model model) {
		Product product = productDAO.getProductById(productId);
		model.addAttribute("product", product);

		// gender
		List<String> listGender = productDAO.getAllGender();

		// brands
		List<Brand> listBrand = productDAO.getAllBrand();

		// age
		List<String> listAge = productDAO.getAllAge();

		// category
		List<Category> listCategory = categoryDAO.getAllCateroty();

		
		model.addAttribute("listGender", listGender);
		model.addAttribute("listBrand", listBrand);
		model.addAttribute("listAge", listAge);
		model.addAttribute("listCategory", listCategory);
		return "admin/product-form";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteProduct(@RequestParam("productId") ObjectId productId) {
		productDAO.deleteProduct(productId);
		return "redirect:/admin/manage-products/list";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String viewProduct(@RequestParam("productId") ObjectId productId,Model model) {
		Product product = productDAO.getProductById(productId);
		model.addAttribute("product",product);
		return "admin/product-detail";
	}

	@RequestMapping("/list")
	public String showListProduct(Model model) {

		List<Product> list = productDAO.getAllProducts();
		model.addAttribute("products", list);

		return "admin/list-product";
	}

	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	public String saveProduct(@Valid @ModelAttribute("product") Product product, Errors errors, Model model) {
		if (errors.hasErrors()) {
			// gender
			List<String> listGender = productDAO.getAllGender();

			// brands
			List<Brand> listBrand = productDAO.getAllBrand();

			// age
			List<String> listAge = productDAO.getAllAge();

			// category
			List<Category> listCategory = categoryDAO.getAllCateroty();

			model.addAttribute("product", product);
			model.addAttribute("listGender", listGender);
			model.addAttribute("listBrand", listBrand);
			model.addAttribute("listAge", listAge);
			model.addAttribute("listCategory", listCategory);

			return "admin/product-form";
		}
//		product.setGender(Gender.valueOf(String.valueOf(product.getGender())));
		else {
				productDAO.saveProduct(product);

			return "redirect:/admin/manage-products/list";
		}
		
	}
}
