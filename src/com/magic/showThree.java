package com.magic;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.db.magic.Dbase;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class showThree extends ActionSupport{

	/**
	 *
	 */

//	public String execute(){
//		System.out.println("good");
//		Map<String,Object> session = ActionContext.getContext().getSession();
//		session.put("trait", trait);
//		System.out.println("the trait which you choose is " + session.get("trait"));
//		String[] traitArray = trait.split(",");
//
//		int len = traitArray.length;
//		int i = 0;
//		for(i=0;i<len;i++){
//			System.out.println(i+" is "+traitArray[i]);
//		}
//		session.put("traitlen", len);
//		session.put("traitArray", traitArray);
//		return SUCCESS;
//	}
//


	private static final long serialVersionUID = 1L;
	private String trait;
	private String chr;
	private String start;
	private String end;
	private String gene;
	private String search;

	public String getWebClassesPath() {
		String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		return path;
	}

	public String getWebRoot() {
		String path = getWebClassesPath();
		if (path.indexOf("WEB-INF") > 0) {
			path = path.substring(0, path.indexOf("WEB-INF/classes"));
		}
		return path;
	}



	public String execute(){

		System.out.println(chr);
		System.out.println(start);
		System.out.println(end);
		System.out.println(gene);
		System.out.println(search);
		Map<String,Object> attributes = ActionContext.getContext().getSession();
		attributes.put("trait", trait);//trait是一组数据CW,ED,DTS,DTT,ED，，，
		System.out.println(attributes.get("trait"));
		String[] traitArray = trait.split(",");

		int traitlen = traitArray.length;

//		String[] traitArray = (String[]) attributes.get("traitArray");

		for(int i=0;i<traitlen;i++){
			System.out.println("traitArray "+i+" is "+traitArray[i]);
		}


		attributes.put("search", search);
		String sql;
		String sql2;

		Dbase d = new Dbase();
		Dbase d2 = new Dbase();

		Map<String,Object> map =  new HashMap<String,Object>();
		Map<String,Object> map2 =  new HashMap<String,Object>();
		Map<String, String> startEndMap;
		String traits = "";
				for (int i = 0; i < traitlen; i++) {
			if (i == traitlen - 1) {
				traits = traits + "trait = '" + traitArray[i];
			} else {
				traits = traits + "trait = '" + traitArray[i] + "' or ";
			}
		}

		if(search.equals("first")){
			//sql = "select Trait,Marker,Locus,Site,p,markerR2,snp,allele,gene,transcript,annotation from sig_snp_annotation,magic_all_sig_snp where magic_all_sig_snp.Marker=sig_snp_annotation.snp AND Locus='" +chr+ "'AND  Site BETWEEN "+start+" AND "+end+" AND (";
            sql = "select Trait,magic_all_sig_snp.snp,Chr,Pos,p,magic_all_sig_snp.snp,allele,gene,transcript,annotation from sig_snp_annotation,magic_all_sig_snp where magic_all_sig_snp.snp=sig_snp_annotation.snp AND Chr='" +chr+ "'AND  Pos BETWEEN "+start+" AND "+end+" AND (";
			sql2 ="select * FROM gwas WHERE chr='"+chr+"' AND ((start<"+start+" AND end>"+start+") OR(start<"+end+" AND end>"+end+")) AND (";
			for(int i=0;i<traitlen;i++){
				String sql1 = "";
				if(i==traitlen-1){
					sql1 = "trait = '"+traitArray[i];//trait = 'ED'这种类型
				}else{
					sql1 = "trait = '"+traitArray[i]+"' or ";
				}
				sql += sql1;
				sql2+= sql1;
			}
			sql += "')";
			sql2 += "')";
			System.out.println(sql2);
			System.out.println(sql);

		}else{
			sql = "select trait , chr , pos , p , sig_snp_annotation.* from sig_snp_annotation,magic_all_sig_snp where gene='"+gene+"' AND magic_all_sig_snp.snp=sig_snp_annotation.snp";
			sql2 ="SELECT * FROM gwas where (`start`<(SELECT `start` FROM zmb73_annotation_combined WHERE id='"+gene+"') AND `end`>(SELECT `start` FROM zmb73_annotation_combined WHERE id='"+gene+"'))OR (`start`<(SELECT `end` FROM zmb73_annotation_combined WHERE id='"+gene+"') AND `end`>(SELECT `end` FROM zmb73_annotation_combined WHERE id='"+gene+"'))";
			System.out.println(sql2);//基因则直接根据名称，更容易写sql
			startEndMap = d.getStartEnd(gene);
			start = startEndMap.get("start");
			end = startEndMap.get("end");
			chr = startEndMap.get("chr");
		}


				String path = getWebRoot();
		path = path.substring(1, path.length());
		path = path + "py_scripts/";
		String driver = path.substring(0, path.indexOf('/'));
		System.out.println(path);
		Runtime rt = Runtime.getRuntime();
		try {
			String tmp = " cmd /c " + driver + " & cd " + path + " &  " + driver + " & del  chrome.html &  python " + path
					+ "chromesome.py " + Integer.parseInt(start) + " " + Integer.parseInt(end) + " " + chr + " " + "\""+ traits + "\"";
			System.out.println(tmp);
			rt.exec(tmp).waitFor();
//			rt.exec(tmp);
			System.out.println("after waitFor");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		map2 = (HashMap<String,Object>)d2.getChr(sql2);//调用定义的函数，return的是map，里面就包含键值对
		map = (HashMap<String,Object>)d.getChr(sql);

		attributes.put("len", map.get("len"));//键值匹配上，len和data在Dbase函数中
		attributes.put("data", map.get("data"));
		attributes.put("len2", map2.get("len"));
		attributes.put("data2", map2.get("data"));


		d.Close();
		d2.Close();
		return SUCCESS;
	}



	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}

	public String getChr() {
		return chr;
	}


	public void setChr(String chr) {
		this.chr = chr;
	}


	public String getStart() {
		return start;
	}


	public void setStart(String start) {
		this.start = start;
	}


	public String getEnd() {
		return end;
	}


	public void setEnd(String end) {
		this.end = end;
	}


	public String getGene() {
		return gene;
	}


	public void setGene(String gene) {
		this.gene = gene;
	}


	public String getTrait() {
		return trait;
	}

	public void setTrait(String trait) {
		this.trait = trait;
	}



}

