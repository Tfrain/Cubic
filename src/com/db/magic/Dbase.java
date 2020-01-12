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
	//����������Ϊ"",����Ϊ654321
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
			System.out.println("��ݿ������!");
			System.out.println(e1.toString());
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			System.out.println("�������!");
			System.out.println(e2.toString());
		}
	}

	public Map<String,Object> getChr(String sql){
		System.out.println("step in getChr");
		Map<String,Object> map = new HashMap<String,Object> ();
		Map<String,ArrayList<String>> map1 = new HashMap<String,ArrayList<String>> ();
		try {
			rs = stmt.executeQuery(sql);//����ִ��SELECT��ѯ��������ResultSet�Ķ���
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
			rs = stmt.executeQuery(sql);//����ִ��SELECT��ѯ��������ResultSet�Ķ���
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
				//��ȡ�ڶ���
				JSONArray childrenOfGene = new JSONArray();
				JSONArray childrenOfChr = new JSONArray();
//				���������������ʱ�Ƴ�
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
						//������
//						�������������������,��Ϊ������Ҫ�����ڲ�������Բ��ò���ô��
						if(startInner < Float.parseFloat(jsonOuter.getString("end")))
						{	
//							���������������Ҫ�ų�������Ҫ removeNormal
							if(!removeNormal) {
								childrenOfChr.remove(removeText);
//								System.out.println("�Ƴ�����ȷ��" + removeText);
								removeText.clear();
								text--;
							}
//							����һ�����ȥ
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
//					                Ϊ�˲�һֱ�Ƴ���ȥ
					        removeNormal = true;
						} else if (startInner >= Float.parseFloat(jsonOuter.getString("end"))&& setHeight == true) {
//							�����ĳ��Ⱦ���end-start
//							�����-����������֤���������ʱ��out����������ӵ�������
							if(normalSum == 0 && Float.parseFloat(jsonOuter.getString("start")) != 0) {
								
//								������ⲿ��һ��text��gene���ͻ�ɫ������������һ��������ֻҪ��һ��
								float height = Float.parseFloat(jsonOuter.getString("end")) - Float.parseFloat(jsonOuter.getString("start"));
								JSONOfText(jsonresultText, jsonOuter, heightReduction(height), text);
								
								JSONObject jsonresultGene=new JSONObject();
								jsonresultGene = JSONOfGene(jsonOuter, genenum);
								childrenOfGene.add(jsonresultGene);
								if(!childrenOfGene.isEmpty())
								{
//									������������Ķ���children
									jsonresultText.put("children", childrenOfGene);
									childrenOfGene.clear();
								}
								
								if(jsonresultText.containsKey("children")){
//									��Ϊchildren���������뼰ʱ���
									childrenOfChr.add(jsonresultText);
								}
								normalSum++;
								text++;
								genenum=1;
							}
							
//							Ϊ�˱���������һ���򣬱���Ҫ����һ��
							if (chrJump == 0) {
								chrJump++;
								normalSum++;
							}
							
//							��ɫ�Ǳر��ģ��������ȳ��֡��ڿ�ʼ-�����
							float grayHeight=heightReduction(Math.abs(startInner-Float.parseFloat(jsonOuter.getString("end"))));
							if (grayHeight >= 0 ) {
								JSONArray InnerGray=new JSONArray();
								JSONObject jsonResultGray =new JSONObject();
								jsonResultGray = grayJSON(OuterGray, jsonInner, grayHeight);
								InnerGray.add(jsonResultGray);
								
								if(!InnerGray.isEmpty())
								{
//									������ǻ�ɫ���ڲ�children�ӵ����
									OuterGray.put("children", InnerGray);
									InnerGray.clear();
								}
							}
//							�������ڽ���-�ڿ�ʼ
							JSONOfText(jsonresultText, jsonInner, heightReduction(endInner-startInner), text);
//							�ڲ㵥������
							JSONObject jsonresultGene=new JSONObject();
							jsonresultGene=JSONOfGene(jsonInner, genenum);
							childrenOfGene.add(jsonresultGene);
							if(!childrenOfGene.isEmpty())
							{
//								������������Ķ���children
								jsonresultText.put("children", childrenOfGene);
								childrenOfGene.clear();
							}
							text++;
							genenum=1;
							sum = 0;
							removeNormal = false;
						} //�����-�������������-�������
						else if(startInner >= Float.parseFloat(jsonOuter.getString("end")) && setHeight == false) {
//							���������ڲ��������һ�������Ǹ߶����¼��� endOuter-startOuter
							float height = Float.parseFloat(jsonOuter.getString("end")) - Float.parseFloat(jsonOuter.getString("start"));
							JSONOfText(jsonresultText, jsonOuter, heightReduction(height), text);
							if(!childrenOfGene.isEmpty())
							{
//								������������Ķ���children
								jsonresultText.put("children", childrenOfGene);
								childrenOfGene.clear();
							}
							text++;
							genenum=1;
//							��ɫ����startInner-endOuter
							float grayHeight=heightReduction(Math.abs(startInner-Float.parseFloat(jsonOuter.getString("end"))));
							if (grayHeight >= 0 ) {
								JSONArray InnerGray=new JSONArray();
								JSONObject jsonResultGray =new JSONObject();
//								����������ɫ�Ѿ������Ӧ����
								jsonResultGray = grayJSON(OuterGray, jsonInner, grayHeight);
								InnerGray.add(jsonResultGray);
								if(!InnerGray.isEmpty())
								{
//									������ǻ�ɫ���ڲ�children�ӵ����
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
						//��ʱ������ƺ󣨵�����ѡ����䣩Ӧ�øı�˳��Ϊ������ɫ�������������������ˣ�����ֻ��ѡ�� normalSum ֤���մ��ƺ�ѡ��������
						if(OuterGray.containsKey("children") && normalSum != 0)
						{
							childrenOfChr.add(OuterGray);
						}
						if(jsonresultText.containsKey("children")){
//							���뵥����������
							childrenOfChr.add(jsonresultText);
//							ȥ����������������һ��
							removeText = jsonresultText;
//							System.out.println("��ֵ�ɹ���" + removeText);
//							jsonresultText.clear();
						}
						if(OuterGray.containsKey("children") && normalSum == 0)
						{
							childrenOfChr.add(OuterGray);
						}
				}

					JSONObject OuterGray=new JSONObject();
					float[] endGray= {307041717,244442276,235667834,242029974,217928451,169381756,182381542,175347686,157021084,149627545};
					//��������ȥ���
					if(childrenOfGene != null && !json.containsKey("children")) {
						float height = Float.parseFloat(jsonOuter.getString("end")) - Float.parseFloat(jsonOuter.getString("start"));
						JSONOfText(json, jsonOuter, heightReduction(height), text);
						if(!childrenOfGene.isEmpty())
						{
//							������������Ķ���children
							json.put("children", childrenOfGene);
							childrenOfGene.clear();
						}
						text++;
						normalSum++;
					}
//					�����ص��������
					if(json.containsKey("children")&&normalSum != 0){
//						��Ϊchildren���������뼰ʱ���
						childrenOfChr.add(json);
						normalSum = 0;
					}
					
//					����endGray�Ļ�ɫ,��Ҫ�ӵ�
					float grayHeight=heightReduction(endGray[Integer.parseInt(jsonOuter.getString("Chr"))-1]-Float.parseFloat(jsonOuter.getString("end")));
					if (grayHeight >= 0 ) {
						JSONArray InnerGray=new JSONArray();
						JSONObject jsonResultGray =new JSONObject();
//						����������ɫ�Ѿ������Ӧ����
						jsonResultGray = grayJSON(OuterGray, jsonOuter, grayHeight);
						InnerGray.add(jsonResultGray);
						if(!InnerGray.isEmpty())
						{
//							������ǻ�ɫ���ڲ�children�ӵ����
							OuterGray.put("children", InnerGray);
							InnerGray.clear();
						}
					}
//					��ʱ�Ͷ�����Ȼ�����ɫ�����������Ȼ�ɫ������Ѿ�û�й�ϵ����β��Ҫ��
					if(OuterGray.containsKey("children"))
					{
						childrenOfChr.add(OuterGray);
					}
				if(!childrenOfChr.isEmpty()){
					jsonresult.put("children", childrenOfChr);
				}
				return jsonresult;
			}//�ײ��ж�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return jsonresult;
	}//������
	
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
        jsonresult.put("name","��"+genenum+"������");
        
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
		jsonresult.put("name", "��"+text+"��");

	}
	
	public JSONObject grayJSON(JSONObject OuterGray, JSONObject jsonInner, float height){
		OuterGray.put("id", "space");
		OuterGray.put("type", jsonInner.getString("method"));
		OuterGray.put("color", "gray");
		OuterGray.put("value", "null");
		OuterGray.put("height", height);
		OuterGray.put("name", "�հ�");
			
//		��ɫ�ڲ�
		JSONObject jsonresult=new JSONObject();
		jsonresult.put("Chr", jsonInner.getString("Chr"));
	    jsonresult.put("type",jsonInner.getString("method"));
	    jsonresult.put("color","gray");
	    jsonresult.put("value","null");
	    jsonresult.put("filter","space");
	    jsonresult.put("name","�հ�");
        
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
