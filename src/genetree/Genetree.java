package genetree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;

import com.db.magic.Dbase;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;



public class Genetree extends ActionSupport{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	public String execute(){
		Dbase d = new Dbase();

		Map<String,Object> attributes = ActionContext.getContext().getSession();
		JSONArray jsonArray = new JSONArray();
		//find genetree data in mysql
		//String sql="select Trait,method,Chr,start,end,pve from gwas";
		String sql="select Trait,method,Chr,start,end,pve from gwas";
		jsonArray=d.gettree(sql);
		attributes.put("tree",jsonArray);
//		System.out.println(jsonArray);
//		System.out.println("∫ÛÃ®≈≈–Ú");
		d.Close();
		return SUCCESS;
	}
}
