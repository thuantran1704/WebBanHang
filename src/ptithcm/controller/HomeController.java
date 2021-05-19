package ptithcm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.SystemException;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.org.apache.bcel.internal.classfile.Attribute;

import ptithcm.entity.CTHoaDon;
import ptithcm.entity.HoaDon;
import ptithcm.entity.SanPham;
import ptithcm.entity.KhachHang;

@Transactional
@Controller
@RequestMapping("/home/")
public class HomeController {
	@Autowired
	SessionFactory factory;
	
	public List<SanPham> getRandomProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham order by NewID() ";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		return list;
	}
	
	public List<SanPham> getAllProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		return list;
	}

	public List<SanPham> getGucciProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=1 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		return list;
	}

	public List<SanPham> getDiorProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=2 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		return list;
	}

	public List<SanPham> getPradaProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=3 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		return list;
	}

	public List<SanPham> getFendiProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=4 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		return list;
	}

	public List<SanPham> getRaybanProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=5 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		return list;
	}

	public KhachHang getuser(String username) {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(KhachHang.class);
		crit.add(Restrictions.eq("Username", username));
		KhachHang user = (KhachHang) crit.uniqueResult();
		return user;
	}

	public SanPham getproduct(int maSP) {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(SanPham.class);
		crit.add(Restrictions.eq("MaSP", maSP));
		SanPham product = (SanPham) crit.uniqueResult();
		return product;
	}
	
	@RequestMapping("error")
	public String error(ModelMap model) {
		return "home/error";
	}
	
	@RequestMapping("error/{username}")
	public String error(ModelMap model, @PathVariable String username) {
		model.addAttribute("user", getuser(username));
		return "home/error";
	}
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		model.addAttribute("randomproduct", getRandomProduct());
		model.addAttribute("productsAll", getAllProduct());
		model.addAttribute("SPGucci", getGucciProduct());
		model.addAttribute("SPDior", getDiorProduct());
		model.addAttribute("SPFendi", getFendiProduct());
		model.addAttribute("SPPrada", getPradaProduct());
		model.addAttribute("SPRayban", getRaybanProduct());
		return "home/index";
	}

	@RequestMapping("index/{username}")
	public String index1(ModelMap model, @PathVariable String username) {
		model.addAttribute("randomproduct", getRandomProduct());
		model.addAttribute("productsAll", getAllProduct());
		model.addAttribute("SPGucci", getGucciProduct());
		model.addAttribute("SPDior", getDiorProduct());
		model.addAttribute("SPFendi", getFendiProduct());
		model.addAttribute("SPPrada", getPradaProduct());
		model.addAttribute("SPRayban", getRaybanProduct());
		model.addAttribute("user", getuser(username));
		return "home/index";
	}

	@RequestMapping("gucci/{username}")
	public String gucci(ModelMap model, @PathVariable String username) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=1 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		model.addAttribute("SPGucci", list);

		return "home/gucci";
	}
	@RequestMapping("gucci")
	public String gucci(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=1 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		model.addAttribute("SPGucci", list);
		return "home/gucci";
	}

	@RequestMapping("dior/{username}")
	public String dior(ModelMap model, @PathVariable String username) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=2 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		model.addAttribute("SPDior", list);
		return "home/dior";
	}
	@RequestMapping("dior")
	public String dior(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=2 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		model.addAttribute("SPDior", list);
		return "home/dior";
	}

	@RequestMapping("fendi/{username}")
	public String fendi(ModelMap model, @PathVariable String username) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=4 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		model.addAttribute("SPFendi", list);
		return "home/fendi";
	}
	@RequestMapping("fendi")
	public String fendi(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=4 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		model.addAttribute("SPFendi", list);
		return "home/fendi";
	}

	@RequestMapping("prada/{username}")
	public String prada(ModelMap model, @PathVariable String username) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=3 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		model.addAttribute("SPPrada", list);
		return "home/prada";
	}
	@RequestMapping("prada")
	public String prada(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=3 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		model.addAttribute("SPPrada", list);
		return "home/prada";
	}

	@RequestMapping("rayban/{username}")
	public String rayban(ModelMap model, @PathVariable String username) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=5 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		model.addAttribute("SPRayban", list);
		return "home/rayban";
	}
	@RequestMapping("rayban")
	public String rayban(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham where MaLoaiSP=5 order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		model.addAttribute("SPRayban", list);
		return "home/rayban";
	}

	@RequestMapping(value = "one-product/{id}/{username}", method = RequestMethod.GET)
	public String singleproduct(ModelMap model, @PathVariable int id, @PathVariable String username)
			throws IllegalStateException, SystemException {
		model.addAttribute("p", getproduct(id));
		model.addAttribute("user", getuser(username));
		if (getproduct(id) != null) {
			try {
				model.addAttribute("sanpham", getproduct(id));
			} catch (Exception e) {
			}
		}
		return "home/one-product";
	}

	public List<HoaDon> getHoaDonNull(int maKH) {
		Session session = factory.getCurrentSession();
		String hql = "FROM HoaDon H WHERE H.MaKH = :maKH and H.TrangThai='0'";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		List<HoaDon> list = query.list();
		return list;
	}

	public void newHD(String username) {
		Session session = factory.getCurrentSession();

		HoaDon hd = new HoaDon();
		hd.setMaKH(getuser(username).getMaKH());
		hd.setNgay(new Date());
		hd.setTrangThai("0");

		session.save(hd);
	}

	@RequestMapping(value = "addtocart/{id}/{username}/{soluong}", method = RequestMethod.POST)
	public String addtocart(ModelMap model, @PathVariable int id, @PathVariable String username,
			@PathVariable int soluong, final RedirectAttributes redirectAttributes)
					throws IllegalStateException, SystemException {
		Session session = factory.getCurrentSession();

		if (getHoaDonNull(getuser(username).getMaKH()).isEmpty()) {
			newHD(username);
		}
		if (username == null) {
			model.addAttribute("message", "Bạn phải đăng nhập để mua hàng!");
			return "user/login";
		}

		try {
			CTHoaDon ct = new CTHoaDon();
			ct.setUser(getuser(username));
			ct.setsanpham(getproduct(id));
			ct.setNgay(new Date());
			ct.setTrangThai("0");
			ct.setHoaDon(getHoaDonNull(getuser(username).getMaKH()).get(0));
			if (soluong == 0) {
				ct.setSoLuong(1);
			} else {
				ct.setSoLuong(soluong);
			}
			ct.setSoTien(getproduct(id).getGiaSP() * ct.getSoLuong());

			session.save(ct);
			model.addAttribute("message", "Thêm mới thành công!");

		} catch (Exception e) {
			model.addAttribute("message", "Thêm thất bại!");
		}

		redirectAttributes.addFlashAttribute("user", getuser(username));
		return "redirect:./../../../index.htm";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		return "redirect:/home/index.htm";
	}

	@RequestMapping("search/{username}")
	public String search(ModelMap model, @PathVariable String username, @RequestParam("timkiem") String timkiem) {
		model.addAttribute("user", getuser(username));
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham WHERE TenSP LIKE '%" + timkiem + "%' order by GiaSP DESC";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		int size = list.size();
		if (list.isEmpty() == true) {
			model.addAttribute("message", "Không tìm thấy kết quả cho : " + timkiem);
		} else {
			model.addAttribute("p", list);
			model.addAttribute("message", "Tìm thấy " + size + " kết quả cho : " + timkiem);
		}
		return "home/search";

	}

	@RequestMapping("search")
	public String search1(ModelMap model, @RequestParam("timkiem") String timkiem) {
			Session session = factory.getCurrentSession();
			String hql = "FROM SanPham WHERE TenSP LIKE '%" + timkiem + "%' order by GiaSP DESC";
			Query query = session.createQuery(hql);
			List<SanPham> list = query.list();
		
		int size = list.size();
		if (list.isEmpty() == true) {
			model.addAttribute("message", "Không tìm thấy kết quả cho : " + timkiem);
		} else {
			model.addAttribute("p", list);
			model.addAttribute("message", "Có " + size + " kết quả cho : " + timkiem);
		}
		return "home/search";

	}
}
