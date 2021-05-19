package ptithcm.controller;

import javax.transaction.SystemException;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.KhachHang;

@Controller
@Transactional
@RequestMapping("/user/")
public class RegisterController {

	@Autowired
	SessionFactory factory;

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		model.addAttribute("user", new KhachHang());
		return "user/register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String insertRegister(ModelMap model, @ModelAttribute("user") KhachHang user)
			throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(KhachHang.class);
		crit.add(Restrictions.eq("Username", user.getUsername()));
		KhachHang user1 = (KhachHang) crit.uniqueResult();
		if (user1 != null) {
			model.addAttribute("message", "Tên đăng nhập đã tồn tại vui lòng chọn tên đăng nhập khác!");
			return "user/register";
		} else if (user1 == null) {
			if (user.getUsername().trim().equalsIgnoreCase("") == true
					|| user.getPassword().trim().equalsIgnoreCase("") == true) {
				model.addAttribute("message", "Tên đăng nhập và mật khẩu không được bỏ trống!");
				return "user/register";
			} else {
				try {
					user.setPhanQuyen("user");
					session.save(user);
					model.addAttribute("message",
							"Đăng ký thành công. <a href=\"user/login.htm\">Đăng nhập tại đây.</a>");
				} catch (Exception e) {
					model.addAttribute("message", "Đăng ký thất bại!");
					return "user/register";
				}
			}

		}
		return "user/login";
	}
}
