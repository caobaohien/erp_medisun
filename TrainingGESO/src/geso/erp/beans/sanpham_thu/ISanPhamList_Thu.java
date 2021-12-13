package geso.erp.beans.sanpham_thu;

import geso.dms.center.util.IPhan_Trang;
import geso.erp.db.sql.dbutils;

import java.sql.ResultSet;

public interface ISanPhamList_Thu extends IPhan_Trang{
	
	public String getMaSanPham() ;
	public void setMaSanPham(String maSanPham);
	public String getTenSanPham() ;
	public void setTenSanPham(String tenSanPham) ;
	public String getMaDoVi();
	public void setMaDoVi(String maDoVi);
	public String getTenDonVi() ;
	public void setTenDonVi(String tenDonVi) ;
	public String getUserId() ;
	public void setUserId(String userId) ;
	public String getTrangThai() ;
	public void setTrangThai(String trangThai);
	public dbutils getDb();
	public void setDb(dbutils db) ;
	public ResultSet getRsSanPham() ;
	public void setRsSanPham(ResultSet rsSanPham);
	public ResultSet getRsDonVi() ;
	public void setRsDonVi(ResultSet rsDonVi);
	public String getMsg() ;
	public void setMsg(String msg) ;
	
	public String getGiaBan() ;
	public void setGiaBan(String giaBan);
	public String getSoLương();
	public void setSoLương(String soLương);
	
	public void init(String string);
	
	public void CreateDonVi();

	public void DBclose();
	public boolean deleteSanPham();
	
}
