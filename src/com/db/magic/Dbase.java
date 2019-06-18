package com.db.magic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.*;

import net.sf.json.JSONObject;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSetMetaData;

public class Dbase {
	private String user = "root";
	private String password = "654321";
	private String url = "jdbc:mysql://localhost:3306/magic";
	private String driver = "com.mysql.jdbc.Driver";
	
	private Connection con = null;
    private Statement stmt = null;
    private java.sql.PreparedStatement stmtq;
	private ResultSet rs = null;

	public Dbase(){
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,password);
			stmt = con.createStatement();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			System.out.println("锟斤拷菘锟斤拷锟斤拷锟斤拷!");
			System.out.println(e1.toString());
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			System.out.println("密码错误!");
			System.out.println(e2.toString());
		}
	}

	public Map<String,Object> getChr(String sql){
		System.out.println("step in getChr");
		Map<String,Object> map = new HashMap<String,Object> ();
		Map<String,ArrayList<String>> map1 = new HashMap<String,ArrayList<String>> ();
		try {
			rs = stmt.executeQuery(sql);//用于执行SELECT查询。它返回ResultSet的对象。
		    int i = 1;
			while(rs.next()){
			    int j = 1;
				ArrayList<String> list = new ArrayList<String>();
/*			    list.add(rs.getString(1));
			    list.add(rs.getString(2));
			    list.add(rs.getString(3));
			    list.add(rs.getString(4));
			    list.add(rs.getString(5));
			    list.add(rs.getString(6));
			    list.add(rs.getString(7));
			    list.add(rs.getString(8));
			    list.add(rs.getString(9));
			    list.add(rs.getString(10));*/
			    while(j<=rs.getMetaData().getColumnCount()){
			    	//System.out.println(j);
			    	list.add(rs.getString(j));
			    	j++;
			    }
			    System.out.println(list);
			    map1.put(Integer.toString(i), list);
			    i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("data", map1);
		int len = map1.size();
		map.put("len", len);
        System.out.println("getChr: query sucessfully length = " + len);
		return map;
	}


	public String getPrimer3(String sql){
		String result = "";
		try {
			rs = stmt.executeQuery(sql);
			 while(rs.next()){
				 String st1 = rs.getString(1);
				 System.out.println(st1);
				 String st2 = rs.getString(2);
				 /*System.out.println(st1+ st2);*/
				 result =result+"TARGET=" + st1+"," + st2+ "\r\n"+"PRIMER_INTERNAL_OLIGO_EXCLUDED_REGION="+st1+"," + st2+"\r\n";

		     }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("result:" + result);
		return result;
	}

	public Map<String, String> getStartEnd(String gene){
		Map<String, String> map = new HashMap<String, String>();
		try {
			String sql = "select start, end , chr from zmb73_annotation_combined where ID ='" + gene + "'";
			rs = stmt.executeQuery(sql);
			System.out.println(sql);
			if(rs.next()){
			map.put("start" , rs.getString("start"));
			map.put("end" , rs.getString("end"));
			map.put("chr" , rs.getString("chr"));
			}else{
				System.out.println("no gene match");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	public String test(String sql){
		String result = "";
		try {
			rs = stmt.executeQuery(sql);
			 while(rs.next()){
				 String st = rs.getString(1);
				 System.out.println(st);
				 result += st+",";
		     }
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public String jbtest(String sql){
		String result = "";
		try {
			rs = stmt.executeQuery(sql);
			rs.next();
			result=result+rs.getString(1)+","+rs.getString(2)+","+rs.getString(3);
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	public JSONArray gettree(String sql){

		JSONArray jsonArray = new JSONArray();
		try {
			String ende;
			String starte;
			String color;
			rs = stmt.executeQuery(sql);
			int flag=0;
			int text=0;
			int genenum=0;
			float start;
			float end;
			ResultSetMetaData metaData = (ResultSetMetaData) rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			// 遍历ResultSet中的每条数据
			while(rs.next())
			{
				start=Float.MAX_VALUE;
				end=-1;
				text++;
				genenum=0;
				int sum=0;

				JSONObject jsonresult1=new JSONObject();
				JSONObject jsonobj=new JSONObject();
				//获取第一个chr
				for (int i = 1; i <= columnCount; i++) {
		            String columnName =metaData.getColumnLabel(i);
		            String value = rs.getString(columnName);
		            jsonobj.put(columnName, value);
		        }
				String chr1;
				chr1=jsonobj.getString("Chr");

				start=Float.parseFloat(jsonobj.getString("start"));
				end=Float.parseFloat(jsonobj.getString("end"));

				//获取第二层
				JSONArray children2 = new JSONArray();
				JSONArray children1 = new JSONArray();

				while(rs!=null)
				{

					sum++;
					JSONObject jsonobj2=new JSONObject();
					JSONObject jsonresult2=new JSONObject();
					JSONObject jsonspace=new JSONObject();
					for (int i = 1; i <= columnCount; i++) {
			            String columnName =metaData.getColumnLabel(i);
			            String value = rs.getString(columnName);
			            jsonobj2.put(columnName, value);
			        }
					String chr2=jsonobj2.getString("Chr");
					if(!chr2.equals(chr1))
					{
						text=0;
						break;
					}
					float start2=Float.parseFloat(jsonobj2.getString("start"));
					float end2=Float.parseFloat(jsonobj2.getString("end"));
					//第三层

					if((start2<=end)&&(end2>start)&&sum!=1)
					{
						color=jsonobj2.getString("Trait");
						String color1=colorr(color);
						JSONObject jsonresult3=new JSONObject();
						jsonresult3.put("Chr", jsonobj2.getString("Chr"));
				        jsonresult3.put("type",jsonobj2.getString("method"));
				        jsonresult3.put("start",jsonobj2.getString("start"));
				        jsonresult3.put("end",jsonobj2.getString("end"));
				        jsonresult3.put("color",color1);
				        jsonresult3.put("value",jsonobj2.getString("pve"));
				        jsonresult3.put("filter",jsonobj2.getString("Trait"));
				        jsonresult3.put("name","第"+genenum+"个基因");
				        if(jsonresult3.containsKey("Chr")){
				        	children2.add(jsonresult3);
				        }
				        start=start2;
				        genenum++;
					}
					else
					{

						color=jsonobj2.getString("Trait");
						String color1=colorr(color);
						float x=(Float.parseFloat(jsonobj2.getString("end"))-Float.parseFloat(jsonobj2.getString("start")));
						x=numberwei(x,jsonobj2.getString("Chr"));
						jsonresult2.put("chr", jsonobj2.getString("Chr"));
						jsonresult2.put("id", jsonobj2.getString("method"));
						jsonresult2.put("type", jsonobj2.getString("method"));
				        jsonresult2.put("color", color1);
				        jsonresult2.put("value", jsonobj2.getString("pve"));
				        jsonresult2.put("height", x);
						jsonresult2.put("name", "第"+text+"段");
						if(sum!=1)
						{
							x=numberwei(Math.abs(start2-end),jsonobj2.getString("Chr"));
							jsonspace.put("id", "space");
							jsonspace.put("type", jsonobj2.getString("method"));
							jsonspace.put("color", "gray");
							jsonspace.put("value", "null");
							jsonspace.put("height", x);
							jsonspace.put("name", "空白");
							JSONObject jsonresult3=new JSONObject();
							jsonresult3.put("Chr", jsonobj2.getString("Chr"));
					        jsonresult3.put("type",jsonobj2.getString("method"));
					        jsonresult3.put("color","gray");
					        jsonresult3.put("value","null");
					        jsonresult3.put("filter","space");
					        jsonresult3.put("name","空白");
					        JSONArray childrenspace=new JSONArray();
							childrenspace.add(jsonresult3);

							if(!childrenspace.isEmpty())
							{

								jsonspace.put("children", childrenspace);
								childrenspace.clear();
							}
						}

						JSONObject jsonresult3=new JSONObject();
						jsonresult3.put("Chr", jsonobj2.getString("Chr"));
				        jsonresult3.put("type",jsonobj2.getString("method"));
				        jsonresult3.put("color",color1);
				        jsonresult3.put("start",jsonobj2.getString("start"));
				        jsonresult3.put("end",jsonobj2.getString("end"));
				        jsonresult3.put("value",jsonobj2.getString("pve"));
				        jsonresult3.put("filter",jsonobj2.getString("Trait"));
				        jsonresult3.put("name","第"+genenum+"个基因");
				        children2.add(jsonresult3);
						text++;
						genenum=1;
						if(!children2.isEmpty())
						{

							jsonresult2.put("children", children2);
							children2.clear();
						}
					}
					if(start2>end)
						end=end2;
					if(jsonspace.containsKey("name")&&jsonspace.containsKey("id")&&jsonspace.containsKey("type")&&jsonspace.containsKey("color")&&jsonspace.containsKey("value")&&jsonspace.containsKey("height"))
					{
						children1.add(jsonspace);
					}
					if(jsonresult2.containsKey("children")){
						//children1.add(jsonspace);
						children1.add(jsonresult2);
					}

			        rs.next();
				}
				if(!children1.isEmpty())
					jsonresult1.put("children", children1);
				jsonArray.add(jsonresult1);
			}
		}


		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return jsonArray;
	}
	public float numberwei(float f,String chr)
	{
		    float beishu=3;
			if(chr.equals("5"))
				beishu=(float) 0.66*beishu;
			if(chr.equals("6"))
				beishu=(float) 2.5*beishu;
			if(chr.equals("9"))
				beishu=(float) 2.5*beishu;
			if(chr.equals("4"))
				beishu=(float) 1.1*beishu;
			if(chr.equals("1"))
				beishu=(float) 1.2*beishu;
		    if(f>1)
		    {
		    	while(f>10)
		    	{
		    		f /= 10 ;
		    	}
		    }
		    if(f<1)
		    {
		    	while(f<1)
		    	{
		    		f=f*10;
		    	}
		    }
		    if(f>5)
		    	f=f/2;
		    return f*beishu;
	}
	public String colorr(String color)
	{
		if(color.equals("CW"))
		{
		     String color1="#5AB400";
		     return color1;
		}
		else if(color.equals("DTA"))
		{
		     String color1="#FFDAB9";
		     return color1;
		}
		else if(color.equals("DTS"))
		{
		     String color1="#00FFFF";
		     return color1;
		}
		else if(color.equals("DTT"))
		{
		     String color1="#4EEE94";
		     return color1;
		}
		else if(color.equals("ED"))
		{
		     String color1="Black";
		     return color1;
		}
		else if(color.equals("EH"))
		{
		     String color1="#000080";
		     return color1;
		}
		else if(color.equals("EL"))
		{
		     String color1="#8B8B00";
		     return color1;
		}
		else if(color.equals("ELL"))
		{
		     String color1="#FF6A6A";
		     return color1;
		}
		else if(color.equals("ELW"))
		{
		     String color1="#FF1493";
		     return color1;
		}
		else if(color.equals("ERN"))
		{
		     String color1="#FFA500";
		     return color1;
		}
		else if(color.equals("EW"))
		{
		     String color1="#8B0000";
		     return color1;
		}
		else if(color.equals("KNPE"))
		{
		     String color1="#6959CD";
		     return color1;
		}
		else if(color.equals("KWPE"))
		{
		     String color1="#EE00EE";
		     return color1;
		}
		else if(color.equals("LBT"))
		{
		     String color1="#551A8B";
		     return color1;
		}
		else if(color.equals("LNAE"))
		{
		     String color1="#F0FFFF";
		     return color1;
		}
		else if(color.equals("LNBE"))
		{
		     String color1="#76EE00";
		     return color1;
		}
		else if(color.equals("PH"))
		{
			 String color1="#A5B400";
			 return color1;
		}
		else if(color.equals("TBN"))
		{
			 String color1="#C30000";
			 return color1;
		}
		else
		{
		      String color1="#2F4F4F";
		      return color1;
		}
	}
	public ArrayList<ArrayList<Integer>> getLen(String sql){
		ArrayList<ArrayList<Integer>> data = new ArrayList<ArrayList<Integer>>();
		ArrayList<Integer> parent_all = new ArrayList<Integer>();
		ArrayList<Integer> sta_all = new ArrayList<Integer>();
		ArrayList<Integer> end_all = new ArrayList<Integer>();
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				parent_all.add(Integer.valueOf(rs.getString(1)));
				sta_all.add(Integer.valueOf(rs.getString(2)));
				end_all.add(Integer.valueOf(rs.getString(3)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		data.add(parent_all);
		data.add(sta_all);
		data.add(end_all);
		return data;
	}

	public ArrayList<String> getTable(String sql){
		ArrayList<String> table_data = new ArrayList<String>();
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				for(int i=5;i<=35;i++){
					table_data.add(rs.getString(i));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return table_data;
	}


	public void Close(){
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (Exception e) {
			System.out.println("db close rs error!");
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
			} catch (Exception e) {
				System.out.println("db close stmt error!");
			} finally {
				try {
					if (con != null) {
						con.close();
						con = null;
					}
				} catch (Exception e) {
					System.out.println("db close conn error!");
				}
			}
		}
	}
}
