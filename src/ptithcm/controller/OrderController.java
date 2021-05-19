package ptithcm.controller;

import java.util.Date;
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

import ptithcm.entity.HoaDon;

@Transactional
@Controller
@RequestMapping("/admin/")
public class OrderController {
	@Autowired 
	SessionFactory factory;
	
	@RequestMapping("order")
	public String user(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM HoaDon";
		Query query = session.createQuery(hql);
		long tongHD = (long) query.uniqueResult();
		int tongSoTrang = (int) (tongHD / 8 + ((tongHD % 8 == 0) ? 0 : 1));
		hql = "FROM HoaDon order by MaHD DESC";
		query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(8);
		List<HoaDon> list = query.list(); 
		model.addAttribute("hd", list);
		model.addAttribute("tongSoTrang", tongSoTrang);
		
		return "admin/order";
	}
	
	@RequestMapping(value="order/page{page}", method = RequestMethod.GET)
	public String user(ModelMap model, @PathVariable("page") int page) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM HoaDon";
		Query query = session.createQuery(hql);
		long tongHD = (long) query.uniqueResult();
		int tongSoTrang = (int) (tongHD / 8 + ((tongHD % 8 == 0) ? 0 : 1));
		hql = "FROM HoaDon order by MaHD DESC";
		query = session.createQuery(hql);
		query.setFirstResult(page * 8 - 8);
		query.setMaxResults(8);
		List<HoaDon> list = query.list(); 
		model.addAttribute("hd", list);
		model.addAttribute("tongSoTrang", tongSoTrang);
		
		return "admin/order";
	}
	
	public HoaDon gethd(int id) {
		Session session = factory.getCurrentSession();
	     Criteria crit = session.createCriteria(HoaDon.class);
	     crit.add(Restrictions.eq("MaHD", id));
	     HoaDon hd = (HoaDon) crit.uniqueResult();
		return hd;
	}
	
	@RequestMapping("delete/{id}")
	public String deleteorder(ModelMap model,@PathVariable int id) {
		HoaDon hd = gethd(id);	
		Session session = factory.getCurrentSession();
		hd.setTrangThai("Cancelled");
		session.update(hd);
					
		return "redirect:../order.htm";
	}
	
	@RequestMapping("complete/{id}")
	public String complete(ModelMap model,@PathVariable int id) {
		HoaDon hd = gethd(id);	
		Session session = factory.getCurrentSession();
		hd.setTrangThai("Completed");
		session.update(hd);
					
		return "redirect:../order.htm";
	}
	
	@RequestMapping("upstore/{id}")
	public String upstore(ModelMap model,@PathVariable int id) {
		HoaDon hd = gethd(id);	
		Session session = factory.getCurrentSession();
		hd.setTrangThai("Confirmed");
		session.update(hd);
					
		return "redirect:../order.htm";
	}

}
