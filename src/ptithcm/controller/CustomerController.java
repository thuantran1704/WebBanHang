package ptithcm.controller;

import java.util.List;

import javax.transaction.SystemException;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.KhachHang;

@Transactional
@Controller
@RequestMapping("/admin/")
public class CustomerController {

	@Autowired
	SessionFactory factory;

	@RequestMapping("user")
	public String user(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM KhachHang";
		Query query = session.createQuery(hql);
		List<KhachHang> list = query.list();
		model.addAttribute("users", list);

		return "admin/user";
	}

	@RequestMapping(value = "deleteuser/{id}")
	public String delete(@PathVariable int id, ModelMap model) throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Criteria crit = session.createCriteria(KhachHang.class);
		crit.add(Restrictions.eq("MaKH", id));
		KhachHang user = (KhachHang) crit.uniqueResult();
		if (user != null) {
			try {
				session.delete(user);
				model.addAttribute("message", "Xoá thành công!");
				t.commit();
			} catch (Exception e) {
				// TODO: handle exception
				t.rollback();
				model.addAttribute("message", "Xoá thất bại!");
			}
			
		}

		return "redirect:../user.htm";

	}

	@RequestMapping(value = "insertuser", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("user", new KhachHang());
		return "admin/insertuser";
	}

	@RequestMapping(value = "insertuser", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("user") KhachHang user, BindingResult errors)
			throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Criteria crit = session.createCriteria(KhachHang.class);
		crit.add(Restrictions.eq("Username", user.getUsername()));
		KhachHang user1 = (KhachHang) crit.uniqueResult();
		if (user1 != null) {
			model.addAttribute("message", "Tên đăng nhập đã tồn tại vui lòng chọn tên đăng nhập khác!");
			return "admin/insertuser";
		} else if (user.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "user", "Username không được để trống!");
			return "admin/insertuser";
		} else if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Password không được để trống!");
			return "admin/insertuser";
		} else {
			try {
				user.setPhanQuyen("user");
				session.save(user);
				t.commit();
				model.addAttribute("message", "Thêm mới thành công!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Thêm mới thất bại!");
			}
		}

		return "redirect:admin/../user.htm";
	}

	@RequestMapping(value = "updateuser/{id}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable int id) throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(KhachHang.class);
		crit.add(Restrictions.eq("MaKH", id));
		KhachHang user = (KhachHang) crit.uniqueResult();
		if (user != null) {
			try {
				model.addAttribute("user", user);
			} 
			catch (Exception e) {
			}
		}

		return "admin/updateuser";

	}

	@RequestMapping(value = "updateuser/{id}", method = RequestMethod.POST)
	public String deleteuser(ModelMap model, @PathVariable int id, @Validated @ModelAttribute("user") KhachHang user,
			BindingResult errors) throws IllegalStateException, SystemException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		if (user.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "user", "Username không được để trống!");
			return "admin/updateuser";
		}
		if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Password không được để trống!");
			return "admin/updateuser";
		} else {
			try {
				user.setPhanQuyen("user");
				session.update(user);
				t.commit();
				model.addAttribute("message", "Sua thanh cong!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Sua that bai!");
				return "admin/updateuser";
			}
		}

		return "redirect:../user.htm";

	}
}
