package com.se.toyshop.controller;

import java.util.Objects;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.se.toyshop.dao.PasswordResetTokenDAO;
import com.se.toyshop.dao.UserDao;
import com.se.toyshop.dto.PasswordDto;
import com.se.toyshop.entity.PasswordResetToken;
import com.se.toyshop.entity.ShippingAddress;
import com.se.toyshop.entity.User;
import com.se.toyshop.service.ISecurityUserService;
import com.se.toyshop.service.UserPrincipal;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private UserDao userDao;

	@Autowired
	private PasswordResetTokenDAO passwordResetTokenDao;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private Environment env;

	@Autowired
	private ISecurityUserService securityService;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimerEditor);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void add(@ModelAttribute("user") User user) {
		userDao.addUser(user);
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLoginForm(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		String errorMessage = null;
		if (error != null) {
			errorMessage = "Tên đăng nhập hoặc mật khẩu không chính xác";
		}
		if (logout != null) {
			errorMessage = "Bạn đã đăng xuất thành công";
		}
		return new ModelAndView("loginForm", "errorMessage", errorMessage);
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView showRegistrationForm() {
		return new ModelAndView("registerForm", "user", new User());
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView processRegistration(@ModelAttribute("user") @Valid User user, BindingResult errors,
			HttpServletRequest request) {
		if (errors.hasErrors()) {
			return new ModelAndView("registerForm", "result", "Tạo tài khoản thất bại");
		}

		User tempUser1 = userDao.findByUsername(user.getAccount().getUsername());
		User tempUser2 = userDao.findByEmail(user.getEmail());

		if (!Objects.isNull(tempUser1)) {
			return new ModelAndView("registerForm", "usernameError", "Tên đăng nhập đã tồn tại");
		} else if (!Objects.isNull(tempUser2)) {
			return new ModelAndView("registerForm", "emailError", "Email đã tồn tại");
		} else {
			userDao.addUser(user);
			mailSender.send(constructRegisterEmail(getAppUrl(request), user));
			return new ModelAndView("successPasswordForm", "message", "Xin chúc mừng, bạn đã tạo tài khoản thành công");
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView showUserProfile(@AuthenticationPrincipal UserPrincipal userDetails) {
		String username = userDetails.getUsername();
		User user = userDao.findByUsername(username);
		return new ModelAndView("userInfo", "user", user);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView updateUserProfile(@Valid @ModelAttribute("user") User user, BindingResult errors,
			@RequestParam(required = false) String oldPassword, @RequestParam(required = false) String newPassword,
			@RequestParam(required = false) String reNewPassword) {

		if (errors.hasErrors()) {
			return new ModelAndView("userInfo");
		}

		boolean isUpdated = false;

		User tempUser = userDao.findByUsername(user.getAccount().getUsername());

		if (oldPassword != null && newPassword != null && reNewPassword != null) {
			if (passwordEncoder.matches(oldPassword, tempUser.getAccount().getPassword())
					&& newPassword.equals(reNewPassword)) {
				user.getAccount().setPassword(passwordEncoder.encode(newPassword));
				user.set_id(tempUser.get_id());
				isUpdated = userDao.update(user);
			}
		} else {
			user.set_id(tempUser.get_id());
			isUpdated = userDao.update(user);
		}

		if (isUpdated) {
			return new ModelAndView("userInfo", "message", "Cập nhật thành công");
		} else {
			return new ModelAndView("userInfo", "message", "Cập nhật thất bại");
		}
	}

	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public ModelAndView showUserAddress(@AuthenticationPrincipal UserPrincipal userPrincipal) {
		String username = userPrincipal.getUsername();
		User user = userDao.findByUsername(username);
		return new ModelAndView("userAddress", "user", user);
	}

	@RequestMapping(value = "/address/create/{id}", method = RequestMethod.GET)
	public ModelAndView showAddressForm(@PathVariable String id) {
		return new ModelAndView("addressForm", "id", id);
	}

	@RequestMapping(value = "/address/create/{id}", method = RequestMethod.POST)
	public ModelAndView processAddressForm(@PathVariable String id, @RequestParam(required = false) String provinceList,
			@RequestParam(required = false) String districtList, @RequestParam(required = false) String wardList,
			@RequestParam(required = false) String street) {
		ShippingAddress shippingAddress = new ShippingAddress(street, wardList, districtList, provinceList);

		User user = userDao.getUser(id);

		user.getShippingAddresses().add(shippingAddress);

		boolean result = userDao.update(user);

		String message = null;
		if (result) {
			message = "Thêm địa chỉ thành công";
		} else {
			message = "Thêm địa chỉ thất bại";
		}
		return new ModelAndView("addressForm", "message", message);
	}

	@RequestMapping(value = "/address/edit/{id}", method = RequestMethod.POST, params = { "province", "district",
			"ward", "street" })
	public ModelAndView showEditAddressForm(@PathVariable String id, @RequestParam(required = false) String province,
			@RequestParam(required = false) String district, @RequestParam(required = false) String ward,
			@RequestParam(required = false) String street) {
		ShippingAddress shippingAddress = new ShippingAddress(street, ward, district, province);
		return new ModelAndView("editAddressForm", "shippingAddress", shippingAddress);
	}

	@RequestMapping(value = "/address/edit/{id}", method = RequestMethod.POST, params = { "province", "district",
			"ward", "street", "newProvince", "newDistrict", "newWard", "newStreet" })
	public String processEditAddressForm(@PathVariable String id,
			@ModelAttribute("shippingAddress") ShippingAddress shippingAddress,
			@RequestParam(required = false) String province, @RequestParam(required = false) String district,
			@RequestParam(required = false) String ward, @RequestParam(required = false) String street,
			@RequestParam(required = false) String newProvince, @RequestParam(required = false) String newDistrict,
			@RequestParam(required = false) String newWard, @RequestParam(required = false) String newStreet) {
		ShippingAddress oldAddress = new ShippingAddress(street, ward, district, province);
		ShippingAddress newAddress = new ShippingAddress(newStreet, newWard, newDistrict, newProvince);

		User user = userDao.getUser(id);
		for (int i = 0; i < user.getShippingAddresses().size(); i++) {
			if (user.getShippingAddresses().get(i).equals(oldAddress)) {
				user.getShippingAddresses().set(i, newAddress);
				userDao.update(user);
				break;
			}
		}

		return "redirect:/user/address";
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String showForgotPasswordForm() {
		return "forgotPasswordForm";
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public ModelAndView resetPassword(HttpServletRequest request, @RequestParam("email") String userEmail) {
		User user = userDao.findByEmail(userEmail);
		if (user == null) {
			return new ModelAndView("forgotPasswordForm", "message", "Không tìm thấy tài khoản với email này");
		}

		PasswordResetToken pResetToken = passwordResetTokenDao.findByUserId(user.get_id());

		String token = UUID.randomUUID().toString();
		if (pResetToken == null) {
			PasswordResetToken myToken = new PasswordResetToken(token, user);
			passwordResetTokenDao.save(myToken);
		} else {
			pResetToken.updateToken(token);
			passwordResetTokenDao.update(pResetToken);
		}

		mailSender.send(constructResetTokenEmail(getAppUrl(request), token, user));
		return new ModelAndView("successPasswordForm", "message",
				"Chúng tôi đã gửi một hướng dẫn khôi phục mật khẩu đến email của bạn, vui lòng kiểm tra email.");
	}

	private SimpleMailMessage constructResetTokenEmail(final String contextPath, final String token, final User user) {
		final String url = contextPath + "/user/changePassword?token=" + token;
		final String message = "Nhấn vào liên kết để khôi phục mật khẩu";
		return constructEmail("Khôi phục mật khẩu", message + " \r\n" + url, user);
	}

	private SimpleMailMessage constructRegisterEmail(final String contextPath, final User user) {
		final String message = "Xin chào " + user.getName() + ",\r\n" + "\r\n"
				+ "Cám ơn bạn đã đăng ký tài khoản của bạn tại website của chúng tôi. Chúng tôi hi vọng bạn sẽ có những trải nghiệm tốt nhất.\r\n"
				+ "Hãy liên lạc với chúng tôi nếu bạn có bất cứ câu hỏi nào.\r\n" + "Xin cảm ơn,\r\n" + "Toy Shop";
		return constructEmail("Đăng ký tài khoản thành công", message, user);
	}

	// Check the PasswordResetToken
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public ModelAndView showChangePasswordPage(@RequestParam("token") String token) {
		String result = securityService.validatePasswordResetToken(token);
		if (result != null) {
			if (result.equals("invalidToken")) {
				return new ModelAndView("forgotPasswordForm", "message", "Token không hợp lệ");
			} else {
				return new ModelAndView("forgotPasswordForm", "message", "Token đã hết hạn. Hãy đăng ký lại");
			}
		} else {
			PasswordDto passwordDto = new PasswordDto();
			passwordDto.setToken(token);
			return new ModelAndView("updatePasswordForm", "passwordDto", passwordDto);
		}
	}

	@RequestMapping(value = "/savePassword", method = RequestMethod.POST)
	public ModelAndView savePassword(@Valid @ModelAttribute("passwordDto") PasswordDto passwordDto,
			BindingResult errors, @RequestParam("reNewPassword") String reNewPassword) {

		if (errors.hasErrors()) {
			return new ModelAndView("updatePasswordForm");
		}

		if (!passwordDto.getNewPassword().equals(reNewPassword)) {
			return new ModelAndView("updatePasswordForm", "message", "Mật khẩu nhập lại không giống nhau");
		}

		String result = securityService.validatePasswordResetToken(passwordDto.getToken());

		if (result != null && result.equals("invalidToken")) {
			if (result.equals("invalidToken")) {
				return new ModelAndView("updatePasswordForm", "message", "Token không hợp lệ");
			} else {
				return new ModelAndView("updatePasswordForm", "message", "Token đã hết hạn. Hãy đăng ký lại");
			}
		}

		User user = userDao.getUserByPasswordResetToken(passwordDto.getToken());

		if (user != null) {
			user.getAccount().setPassword(passwordEncoder.encode(passwordDto.getNewPassword()));
			userDao.update(user);
			return new ModelAndView("successPasswordForm", "message", "Khôi phục mật khẩu thành công");
		} else {
			return new ModelAndView("updatePasswordForm", "message",
					"Không tìm thấy tài khoản - Khôi phục mật khẩu thất bại");
		}
	}

	public String getAppUrl(HttpServletRequest request) {
		return "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	}

	private SimpleMailMessage constructEmail(String subject, String body, User user) {
		final SimpleMailMessage email = new SimpleMailMessage();
		email.setSubject(subject);
		email.setText(body);
		email.setTo(user.getEmail());
		email.setFrom(env.getProperty("support.email"));
		return email;
	}
}