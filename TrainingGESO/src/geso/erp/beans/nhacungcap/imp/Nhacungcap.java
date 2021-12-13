package geso.erp.beans.nhacungcap.imp;

import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
 
import geso.erp.beans.nhacungcap.INhacungcap;
import geso.erp.db.sql.dbutils;
import geso.erp.util.Library;
 

public class Nhacungcap implements INhacungcap {
	
	String UserId;
	String ShopId;
	String Trangthai;
	String Ma;
	String Ten;
	String Diachi;
	String Dienthoai;
	String Msg="";
	String Id;
	dbutils db;
	
	public Nhacungcap(){
		this.Trangthai="";
		this.Ma="";
		this.Ten="";
		this.Diachi="";
		this.Dienthoai="";
		this.Msg="";
		this.Id="";
		db=new dbutils();
	}

	@Override
	public String getUserId() {
		// TODO Auto-generated method stub
		return this.UserId;
	}

	@Override
	public void setUserId(String userId) {
		// TODO Auto-generated method stub
		this.UserId=userId;
	}

	@Override
	public String getShopId() {
		// TODO Auto-generated method stub
		return this.ShopId;
	}

	@Override
	public void setShopId(String ShopId) {
		// TODO Auto-generated method stub
		this.ShopId = ShopId;
	}

	@Override
	public String getTrangthai() {
		// TODO Auto-generated method stub
		return this.Trangthai;
	}

	@Override
	public void setTrangthai(String trangthai) {
		// TODO Auto-generated method stub
		this.Trangthai=trangthai;
	}

	@Override
	public String getMa() {
		// TODO Auto-generated method stub
		return this.Ma;
	}

	@Override
	public void setMa(String Ma) {
		// TODO Auto-generated method stub
		this.Ma=Ma;
	}

	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return this.Id;
	}

	@Override
	public void setId(String Id) {
		// TODO Auto-generated method stub
		this.Id=Id;
	}

	@Override
	public String getTen() {
		// TODO Auto-generated method stub
		return this.Ten;
	}

	@Override
	public void setTen(String ten) {
		// TODO Auto-generated method stub
		this.Ten=ten;
	}

	@Override
	public String getDienthoai() {
		// TODO Auto-generated method stub
		return this.Dienthoai;
	}

	@Override
	public void setDienthoai(String dt) {
		// TODO Auto-generated method stub
		this.Dienthoai=dt;
	}

	@Override
	public String getDiachi() {
		// TODO Auto-generated method stub
		return this.Diachi;
	}

	@Override
	public void setDiachi(String diachi) {
		// TODO Auto-generated method stub
		this.Diachi=diachi;
	}

	@Override
	public void setmsg(String msg) {
		// TODO Auto-generated method stub
		this.Msg=msg;
	}

	@Override
	public String getmsg() {
		// TODO Auto-generated method stub
		return this.Msg;
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub
		try{
			String query="SELECT PK_SEQ,MA,TEN , TRANGTHAI FROM NHACUNGCAP WHERE PK_SEQ="+Id;
			ResultSet rs=db.get(query);
			if(rs.next()){
				this.Ten=rs.getString("ten");
				this.Ma=rs.getString("ma");
				 
				this.Trangthai=rs.getString("trangthai");
				
				
			}
			rs.close();
		}catch(Exception er){
			er.printStackTrace();
		}
	
	}

	@Override
	public void CreateRs() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void DBclose() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean save() {
		// TODO Auto-generated method stub
		try{
			db.getConnection().setAutoCommit(false);
			String query="";
			if(Id.length() >0){
				query="UPDATE NHACUNGCAP set ma=N'"+this.Ma+"',ten=N'"+Ten+"' WHERE PK_SEQ="+this.Id;
				if(!db.update(query)){
					this.Msg="Không  thực hiện được câu lệnh: "+query;
					db.getConnection().rollback();
					return false;
				}
				
			}else{
				query="INSERT INTO NHACUNGCAP (MA,TEN,TRANGTHAI,NGAYTAO,NGAYSUA,NGUOITAO,NGUOISUA) " +
						"VALUES(N'"+Ma+"',N'"+Ten+"','"+this.Trangthai+"','"+this.getDateTime()+"','"+this.getDateTime()+"',"+this.UserId+","+this.UserId+")";
				if(!db.update(query)){
					this.Msg="Không  thực hiện được câu lệnh: "+query;
					db.getConnection().rollback();
					return false;
				}
			}
			
			db.getConnection().commit();
			db.getConnection().setAutoCommit(true);
			
		}catch(Exception err){
			this.Msg="Lỗi :"+err.getMessage();
			db.update("rollback");
			err.printStackTrace();
			return false;
			
		}
	
		return true;
	}
	
	private String getDateTime()
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return dateFormat.format(date);
	}
	
}
