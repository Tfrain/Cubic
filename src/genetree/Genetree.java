package genetree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
//		String sql1="select Trait,method,Chr,start,end,pve from gwas where Chr=1";

		for (int i=1; i<= 10; i++) {
			JSONObject jsonTemp = new JSONObject();
			String temp = "select Trait,method,Chr,start,end,pve from gwas where Chr='" + i + "'";
			jsonTemp=d.gettree(temp);
			jsonArray.add(jsonTemp);
		}
//		System.out.println(jsonArray);
		attributes.put("tree",jsonArray);
//		System.out.println("ºóÌ¨ÅÅÐò");
		d.Close();
		return SUCCESS;
	}
}
