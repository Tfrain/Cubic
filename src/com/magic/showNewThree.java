package com.magic;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.db.magic.Dbase;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class showNewThree extends ActionSupport{



	private static final long serialVersionUID = 1L;

	private String variation;
	private String gene;
	private String feature;
	private String chr;
	private String start;
	private String end;
	private String effect;
	private int i=0;
	
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
		System.out.println(variation);
		System.out.println(gene);
		System.out.println(feature);
		System.out.println(chr);
		System.out.println(start);
		System.out.println(end);
		System.out.println(effect);
	
		
		Map<String,Object> attributes = ActionContext.getContext().getSession();
		//attributes.put("variation", variation);
		//System.out.println(attributes.get("variation"));
		
		//attributes.put("effect", effect);
		String sql= "SELECT * FROM variation WHERE";
		Dbase d = new Dbase();
		Map<String,Object> map =  new HashMap<String,Object>();
		if (variation!=null&&!variation.equals("")) {
			i++;
			sql = sql + " Uploaded_variation = '"+variation+"'";
		}
		if(gene!=null&&!gene.equals("")) {
			if(i==0) {
				sql = sql + " Gene = '"+gene+"'";
			}
			else {
				sql = sql + " AND Gene = '"+gene+"'";
			}
			i++;
		}
		if(feature!=null&&!feature.equals("")) {
			if(i==0) {
				sql = sql + " ((Consequence = '"+feature+"') OR ("+"Consequence LIKE '%"+feature+"') OR ("+"Consequence LIKE '"+feature+"%'))";
			}
			else {
				sql = sql + " AND ((Consequence = '"+feature+"') OR ("+"Consequence LIKE '%"+feature+"') OR ("+"Consequence LIKE '"+feature+"%'))";
			}
			i++;
		}
		if(chr != null&&!chr.equals("")) {
			if(i==0) {
				sql = sql + " Chr = '"+chr+"'";
			}
			else {
			sql = sql + " AND Chr = '"+chr+"'";
			}
			i++;
		}
		if(start != null&&!start.equals("")) {
			if(i==0) {
				sql = sql + " Location >= "+start+"";
			}
			else {
			sql = sql + " AND Location >= "+start+"";
			}
			i++;
		} else {
			if(i==0) {
				sql = sql + " Location >= "+100+"";
			}
			else {
			sql = sql + " AND Location >= "+100+"";
			}
			i++;
		}
		
		if(end!=null&&!end.equals("")) {
			if(i==0) {
				sql = sql + " Location <= "+end+"";
			}
			else {
			sql = sql + " AND Location <= "+end+"";
			}
			i++;
		} else {
			if(i==0) {
				sql = sql + " Location <= "+4000+"";
			}
			else {
			sql = sql + " AND Location <= "+4000+"";
			}
			i++;
		}
		if(effect!=null&&!effect.equals("")) {
			if(i==0) {
				sql = sql + " Extra LIKE 'IMPACT="+effect+"%'";
			}
			else {
			sql = sql + " AND Extra LIKE 'IMPACT="+effect+"%'";
			}
			i++;
		}
		
		//sql ="select * FROM test WHERE Gene = '"+gene+"' and Uploaded_variation LIKE '"+chr+"%'";
		System.out.println(sql);

		
		
		map = (HashMap<String,Object>)d.getNewChr(sql);

		attributes.put("len", map.get("len"));//键值匹配上，len和data在Dbase函数中
		attributes.put("data", map.get("data"));


		d.Close();
		
		return SUCCESS;
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

	public String getVariation() {
		return variation;
	}

	public void setVariation(String variation) {
		this.variation = variation;
	}
	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getEffect() {
		return effect;
	}

	public void setEffect(String effect) {
		this.effect = effect;
	}

}

