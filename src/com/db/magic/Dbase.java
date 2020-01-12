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
	//服务器密码为"",本地为654321
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
	
	public Map<String,Object> getNewChr(String sql){
		System.out.println("getNewChr is executing");
		String action = "http://modem.hzau.edu.cn/Magic/JBrowse/jbrowse.jsp?loc=";
		Map<String,Object> map = new HashMap<String,Object> ();
		Map<String,ArrayList<String>> map1 = new HashMap<String,ArrayList<String>> ();
		try {
			rs = stmt.executeQuery(sql);//用于执行SELECT查询。它返回ResultSet的对象。
		    int i = 1;
			while(rs.next()){
			    int j = 1;
				ArrayList<String> list = new ArrayList<String>();

			    while(j<rs.getMetaData().getColumnCount()){
			    	if(j==2) {
			    		action += rs.getString(j);
			    	}
			    	if(j==3) {
			    		action = action+"%3A"+rs.getString(j)+"&tracks=cubic_merge%2CGFF3%2CDNA&highlight=";
			    	}
			    	if(j==9) {
			    		list.add(rs.getString(15));
			    		list.add(action);
			    		action = "http://modem.hzau.edu.cn/Magic/JBrowse/jbrowse.jsp?loc=";
			    		j++;
			    	}
			    	list.add(rs.getString(j));
			    	j++;
			    }
			    list.add("-");
			    //System.out.println(list);
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
	
	public JSONObject gettree(String sql){
		JSONObject jsonresult=new JSONObject();
		try {
			rs = stmt.executeQuery(sql);
			boolean setHeight = true;
			boolean removeNormal = false;
			int text=0;
			int chrJump = 0;
			int genenum=1;
			ResultSetMetaData metaData = (ResultSetMetaData) rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			
			if (rs != null)
			{
				text++;
				int sum=0;
				int normalSum=0;
				JSONObject jsonOuter=new JSONObject();
				jsonOuter.put("start", 0);
				jsonOuter.put("end", 0);
				//获取第二层
				JSONArray childrenOfGene = new JSONArray();
				JSONArray childrenOfChr = new JSONArray();
//				方便跳到多个基因时移除
				JSONObject removeText=new JSONObject();
				
				JSONObject json=new JSONObject();
				
				while(rs.next())
				{
					JSONObject jsonInner=new JSONObject();
					JSONObject jsonresultText=new JSONObject();
					JSONObject OuterGray=new JSONObject();
						for (int i = 1; i <= columnCount; i++) {
				            String columnName =metaData.getColumnLabel(i);
				            String value = rs.getString(columnName);
				            jsonInner.put(columnName, value);
				        }
						float startInner=Float.parseFloat(jsonInner.getString("start"));
						float endInner=Float.parseFloat(jsonInner.getString("end"));
						
//						if(Float.parseFloat(jsonOuter.getString("start")) == 0) {
//							System.out.println(88);
//						}
						//第三层
//						单层基因跳到多层基因中,因为外层基因要跟上内层基因，所以不得不这么做
						if(startInner < Float.parseFloat(jsonOuter.getString("end")))
						{	
//							正常到多基因的情况要排除，所以要 removeNormal
							if(!removeNormal) {
								childrenOfChr.remove(removeText);
//								System.out.println("移除变正确吗？" + removeText);
								removeText.clear();
								text--;
							}
//							外层第一个算进去
							if(sum == 0) {
								JSONObject jsonresultGene=new JSONObject();
								jsonresultGene = JSONOfGene(jsonOuter, genenum);
								
						        if(jsonresultGene.containsKey("Chr")){
						        	childrenOfGene.add(jsonresultGene);
						        }
						        sum++;
							}
							JSONObject jsonresultGene=new JSONObject();
							jsonresultGene = JSONOfGene(jsonInner, genenum);
					        
					        if(jsonresultGene.containsKey("Chr")){
					        	childrenOfGene.add(jsonresultGene);
					        }
					        genenum++;
					        setHeight = false;
//					                为了不一直移除下去
					        removeNormal = true;
						} else if (startInner >= Float.parseFloat(jsonOuter.getString("end"))&& setHeight == true) {
//							正常的长度就是end-start
//							外结束-外正常，保证多基因到正常时，out的正常能添加到正常中
							if(normalSum == 0 && Float.parseFloat(jsonOuter.getString("start")) != 0) {
								
//								这里加外部的一个text和gene，和灰色，和外面内容一样，不过只要加一次
								float height = Float.parseFloat(jsonOuter.getString("end")) - Float.parseFloat(jsonOuter.getString("start"));
								JSONOfText(jsonresultText, jsonOuter, heightReduction(height), text);
								
								JSONObject jsonresultGene=new JSONObject();
								jsonresultGene = JSONOfGene(jsonOuter, genenum);
								childrenOfGene.add(jsonresultGene);
								if(!childrenOfGene.isEmpty())
								{
//									这里的是正常的二层children
									jsonresultText.put("children", childrenOfGene);
									childrenOfGene.clear();
								}
								
								if(jsonresultText.containsKey("children")){
//									因为children重名，必须及时添加
									childrenOfChr.add(jsonresultText);
								}
								normalSum++;
								text++;
								genenum=1;
							}
							
//							为了避免两个第一基因，必须要有这一个
							if (chrJump == 0) {
								chrJump++;
								normalSum++;
							}
							
//							灰色是必备的，而且是先出现。内开始-外结束
							float grayHeight=heightReduction(Math.abs(startInner-Float.parseFloat(jsonOuter.getString("end"))));
							if (grayHeight >= 0 ) {
								JSONArray InnerGray=new JSONArray();
								JSONObject jsonResultGray =new JSONObject();
								jsonResultGray = grayJSON(OuterGray, jsonInner, grayHeight);
								InnerGray.add(jsonResultGray);
								
								if(!InnerGray.isEmpty())
								{
//									这里的是灰色的内层children加到外层
									OuterGray.put("children", InnerGray);
									InnerGray.clear();
								}
							}
//							正常，内结束-内开始
							JSONOfText(jsonresultText, jsonInner, heightReduction(endInner-startInner), text);
//							内层单个基因
							JSONObject jsonresultGene=new JSONObject();
							jsonresultGene=JSONOfGene(jsonInner, genenum);
							childrenOfGene.add(jsonresultGene);
							if(!childrenOfGene.isEmpty())
							{
//								这里的是正常的二层children
								jsonresultText.put("children", childrenOfGene);
								childrenOfGene.clear();
							}
							text++;
							genenum=1;
							sum = 0;
							removeNormal = false;
						} //多基因-》正常，多基因-》多基因
						else if(startInner >= Float.parseFloat(jsonOuter.getString("end")) && setHeight == false) {
//							外层基因，是内层基因的最后一个，但是高度重新计算 endOuter-startOuter
							float height = Float.parseFloat(jsonOuter.getString("end")) - Float.parseFloat(jsonOuter.getString("start"));
							JSONOfText(jsonresultText, jsonOuter, heightReduction(height), text);
							if(!childrenOfGene.isEmpty())
							{
//								这里的是正常的二层children
								jsonresultText.put("children", childrenOfGene);
								childrenOfGene.clear();
							}
							text++;
							genenum=1;
//							灰色基因，startInner-endOuter
							float grayHeight=heightReduction(Math.abs(startInner-Float.parseFloat(jsonOuter.getString("end"))));
							if (grayHeight >= 0 ) {
								JSONArray InnerGray=new JSONArray();
								JSONObject jsonResultGray =new JSONObject();
//								在其中外层灰色已经添加相应属性
								jsonResultGray = grayJSON(OuterGray, jsonInner, grayHeight);
								InnerGray.add(jsonResultGray);
								if(!InnerGray.isEmpty())
								{
//									这里的是灰色的内层children加到外层
									OuterGray.put("children", InnerGray);
									InnerGray.clear();
								}
							}
							setHeight = true;
							normalSum = 0;
						} 
						
						if(startInner >= Float.parseFloat(jsonOuter.getString("end"))) {
							jsonOuter = jsonInner;
							sum=0;
						}
						//此时多基因善后（第三个选择语句）应该改变顺序为正常灰色，这样就走总体正常了，变量只有选择 normalSum 证明刚从善后选择语句出来
						if(OuterGray.containsKey("children") && normalSum != 0)
						{
							childrenOfChr.add(OuterGray);
						}
						if(jsonresultText.containsKey("children")){
//							加入单个或多个基因
							childrenOfChr.add(jsonresultText);
//							去除正常基因多出来的一组
							removeText = jsonresultText;
//							System.out.println("赋值成功吗？" + removeText);
//							jsonresultText.clear();
						}
						if(OuterGray.containsKey("children") && normalSum == 0)
						{
							childrenOfChr.add(OuterGray);
						}
				}

					JSONObject OuterGray=new JSONObject();
					float[] endGray= {307041717,244442276,235667834,242029974,217928451,169381756,182381542,175347686,157021084,149627545};
					//多基因加上去情况
					if(childrenOfGene != null && !json.containsKey("children")) {
						float height = Float.parseFloat(jsonOuter.getString("end")) - Float.parseFloat(jsonOuter.getString("start"));
						JSONOfText(json, jsonOuter, heightReduction(height), text);
						if(!childrenOfGene.isEmpty())
						{
//							这里的是正常的二层children
							json.put("children", childrenOfGene);
							childrenOfGene.clear();
						}
						text++;
						normalSum++;
					}
//					加入重叠基因情况
					if(json.containsKey("children")&&normalSum != 0){
//						因为children重名，必须及时添加
						childrenOfChr.add(json);
						normalSum = 0;
					}
					
//					距离endGray的灰色,都要加的
					float grayHeight=heightReduction(endGray[Integer.parseInt(jsonOuter.getString("Chr"))-1]-Float.parseFloat(jsonOuter.getString("end")));
					if (grayHeight >= 0 ) {
						JSONArray InnerGray=new JSONArray();
						JSONObject jsonResultGray =new JSONObject();
//						在其中外层灰色已经添加相应属性
						jsonResultGray = grayJSON(OuterGray, jsonOuter, grayHeight);
						InnerGray.add(jsonResultGray);
						if(!InnerGray.isEmpty())
						{
//							这里的是灰色的内层children加到外层
							OuterGray.put("children", InnerGray);
							InnerGray.clear();
						}
					}
//					此时和多基因先基因后灰色，正常基因先灰色后基因已经没有关系，结尾都要加
					if(OuterGray.containsKey("children"))
					{
						childrenOfChr.add(OuterGray);
					}
				if(!childrenOfChr.isEmpty()){
					jsonresult.put("children", childrenOfChr);
				}
				return jsonresult;
			}//首层判断
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return jsonresult;
	}//函数体
	
	public JSONObject JSONOfGene(JSONObject json, int genenum){
		JSONObject jsonresult=new JSONObject();
		jsonresult.put("Chr", json.getString("Chr"));
        jsonresult.put("type",json.getString("method"));
        String colorTransform=colorr(json.getString("Trait"));
		jsonresult.put("color",colorTransform);
        jsonresult.put("start",json.getString("start"));
        jsonresult.put("end",json.getString("end"));
        jsonresult.put("value",json.getString("pve"));
        jsonresult.put("filter",json.getString("Trait"));
        jsonresult.put("name","第"+genenum+"个基因");
        
		return jsonresult;
	}
	
	public void JSONOfText(JSONObject jsonresult, JSONObject json, float height, int text){
		
		jsonresult.put("chr", json.getString("Chr"));
		jsonresult.put("id", json.getString("method"));
		jsonresult.put("type", json.getString("method"));
		String colorTransform=colorr(json.getString("Trait"));
		jsonresult.put("color",colorTransform);
        jsonresult.put("value", json.getString("pve"));
        jsonresult.put("height", height);
		jsonresult.put("name", "第"+text+"段");

	}
	
	public JSONObject grayJSON(JSONObject OuterGray, JSONObject jsonInner, float height){
		OuterGray.put("id", "space");
		OuterGray.put("type", jsonInner.getString("method"));
		OuterGray.put("color", "gray");
		OuterGray.put("value", "null");
		OuterGray.put("height", height);
		OuterGray.put("name", "空白");
			
//		灰色内层
		JSONObject jsonresult=new JSONObject();
		jsonresult.put("Chr", jsonInner.getString("Chr"));
	    jsonresult.put("type",jsonInner.getString("method"));
	    jsonresult.put("color","gray");
	    jsonresult.put("value","null");
	    jsonresult.put("filter","space");
	    jsonresult.put("name","空白");
        
		return jsonresult;
	}
	
	public float heightReduction(float f)
	{
			f /= 300000;
		    return f;
	}
	public String colorr(String color)
	{
		if(color.equals("ATI"))
		{
		     String color1="#A52A2A";
		     return color1;
		}else if(color.equals("CW"))
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
		else if(color.equals("KNPR"))
		{
		     String color1="#FF1483";
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
		     String color1="#FFA07A";
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
		else if(color.equals("TL"))
		{
			 String color1="#228B22";
			 return color1;
		}
		else if(color.equals("SAI"))
		{
			 String color1="#6495ED";
			 return color1;
		}
		else if(color.equals("STI"))
		{
			 String color1="#D2691E";
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
