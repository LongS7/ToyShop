package com.se.toyshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionController {
	@RequestMapping("/403")
	public String accessDenied() {
	    return "error-pages/403";
	}
}
