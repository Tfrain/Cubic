package com.draw;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.db.magic.Dbase;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class findDataInMagic extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String name;
	private String chr;
	private String name1;
	private String namee;
	private String names;
	public String execute(){
		Dbase d = new Dbase();
		System.out.println("chr "+chr);
		System.out.println("namel "+name1);
		System.out.println("names "+names);
		System.out.println("namee "+namee);
		String [] na = null ;
		String []chrs = null;
		
		if(name1.isEmpty()){
			chrs = chr.split(", ");
		}else{
			name = name1;
			String ttp = "1,2,3,4,5,6,7,8,9,10";
			chrs = ttp.split(",");
		}
		
		na = name.split(", ");
		System.out.println("_________________");
		System.out.println("na " + na);
		System.out.println("name " + name);
		System.out.println("chr "+chr);
		
		Map<String,Object> attributes = ActionContext.getContext().getSession();
		attributes.put("names", na);
		attributes.put("chrs", chrs);
		//鏌ヨ鐢诲浘锛�
		if(chrs.length == 1){
			for(int i=0;i<na.length;i++){
				String sql;
				if(names.equals(""))
				{
					names="1";
					if(chr.equals("1")){
					namee="301354135";
					}
					else if(chr.equals("2")){
						namee="237068873";
						}
					else if(chr.equals("3")){
						namee="232140174";
						}
					else if(chr.equals("4")){
						namee="241473504";
						}
					else if(chr.equals("5")){
						namee="217872852";
						}
					else if(chr.equals("6")){
						namee="169174353";
						}
					else if(chr.equals("7")){
						namee="176764762";
						}
					else if(chr.equals("8")){
						namee="175793759";
						}
					else if(chr.equals("9")){
						namee="156750706";
						}
					else if(chr.equals("10")){
						namee="150189435";
						}
					sql="select parent,sta,end from all_bin where name='"+na[i]+"' AND chr='"+chr+"'";
				}
				else 
				{
					System.out.println("select parent,sta,end from all_bin where name='"+na[i]+"' AND ((sta BETWEEN "+names+" AND "+namee+") OR (end BETWEEN "+names+" AND "+namee+"))"+" AND chr='"+chr+"'");
					sql="select parent,sta,end from all_bin where name='"+na[i]+"' AND ((sta BETWEEN "+names+" AND "+namee+") OR (end BETWEEN "+names+" AND "+namee+"))"+" AND chr='"+chr+"'";
				}
				System.out.println(na[i]);
				d.getLen(sql).toString();
				System.out.println(d.getLen(sql));
				attributes.put(na[i], d.getLen(sql));
			}
		}else{
			for(int i=0;i<chrs.length;i++){
				String sql=null;
				if(names.equals(""))
				{
					names="1";
					if(chrs[i].equals("1")){
						namee="301354135";
						}
						else if(chrs[i].equals("2")){
							namee="237068873";
							}
						else if(chrs[i].equals("3")){
							namee="232140174";
							}
						else if(chrs[i].equals("4")){
							namee="241473504";
							}
						else if(chrs[i].equals("5")){
							namee="217872852";
							}
						else if(chrs[i].equals("6")){
							namee="169174353";
							}
						else if(chrs[i].equals("7")){
							namee="176764762";
							}
						else if(chrs[i].equals("8")){
							namee="175793759";
							}
						else if(chrs[i].equals("9")){
							namee="156750706";
							}
						else if(chrs[i].equals("10")){
							namee="150189435";
							}
					System.out.println("select parent,sta,end from all_bin where chr='"+chrs[i]+"' AND name='"+na[0]+"'");
					sql="select parent,sta,end from all_bin where chr='"+chrs[i]+"' AND name='"+na[0]+"'";
				}
				else
				{
					System.out.println("select parent,sta,end from all_bin where name='"+na[0]+"'AND ((sta BETWEEN "+names+" AND "+namee+") OR (end BETWEEN "+names+" AND "+namee+"))"+" AND chr='"+chrs[i]+"'");
					sql="select parent,sta,end from all_bin where name='"+na[0]+"'AND ((sta BETWEEN "+names+" AND "+namee+") OR (end BETWEEN "+names+" AND "+namee+"))"+" AND chr='"+chrs[i]+"'";
				}
				/*String sql="select parent,sta,end from all_bin where chr='"+chrs[i]+"' AND name='"+na[0]+"'";*/
				System.out.println(chrs[i]);
				d.getLen(sql).toString();
				System.out.println(d.getLen(sql));
				attributes.put(chrs[i], d.getLen(sql));
			}
		}
		//鐢昏〃
		HashMap<String,ArrayList<String>> mtable = new HashMap<String,ArrayList<String>>();
		System.out.println(na.length);
		for(int i=0;i<na.length;i++){
			String sql="select * from bin_summary_maxp2 where name='"+na[i]+"'";
			System.out.println(na[i]);
			System.out.println(sql);
			mtable.put(na[i], d.getTable(sql));
			System.out.println(mtable);
		}
		attributes.put("table", mtable);
		double sta1=1;
		double end1=301354135;
		if(!names.equals(""))
		{
			sta1 = Double.parseDouble(names);
		}
		if(!namee.equals(""))
		{
		    end1 = Double.parseDouble(namee);
		}
		System.out.println(sta1);
		System.out.println(end1);
		attributes.put("sta1", sta1);
		attributes.put("end1", end1);
		System.out.println(attributes.toString());
		
		d.Close();
		return SUCCESS;
	}
	
	
	public double elect(double x,String chrx)
	{
		if(chrx.equals("1"))
			x=x/301354135;
		else if(chrx.equals("2"))
			x=x/237068873;
		else if(chrx.equals("3"))
			x=x/232140174;
		else if(chrx.equals("4"))
			x=x/241473504;
		else if(chrx.equals("5"))
			x=x/217872852;
		else if(chrx.equals("6"))
			x=x/169174353;
		else if(chrx.equals("7"))
			x=x/176764762;
		else if(chrx.equals("8"))
			x=x/175793759;
		else if(chrx.equals("9"))
			x=x/156750706;
		else if(chrx.equals("10"))
			x=x/150189435;
		return x;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getChr() {
		return chr;
	}
	public void setChr(String chr) {
		this.chr = chr;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	
	
	public String getNamee() {
		return namee;
	}
	public void setNamee(String namee) {
		this.namee = namee;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	
}
