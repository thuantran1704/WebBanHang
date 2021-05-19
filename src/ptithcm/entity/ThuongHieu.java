package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ThuongHieu")
public class ThuongHieu {

	@Id
	@GeneratedValue
	@Column(name="MaLoaiSP")
	int MaLoaiSP;
	@OneToMany(mappedBy = "type",fetch = FetchType.EAGER)
	Collection<SanPham> sanpham;
	
	@Column(name="TenLoaiSP")
	String TenLoaiSP;

	public int getMaLoaiSP() {
		return MaLoaiSP;
	}

	public void setMaLoaiSP(int maLoaiSP) {
		MaLoaiSP = maLoaiSP;
	}

	public Collection<SanPham> getSanpham() {
		return sanpham;
	}

	public void setSanpham(Collection<SanPham> sanpham) {
		this.sanpham = sanpham;
	}

	public String getTenLoaiSP() {
		return TenLoaiSP;
	}

	public void setTenLoaiSP(String tenLoaiSP) {
		TenLoaiSP = tenLoaiSP;
	}
}	
