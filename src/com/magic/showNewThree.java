package com.magic;

import com.db.magic.Dbase;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.HashMap;
import java.util.Map;





public class showNewThree
  extends ActionSupport
{
  private static final long serialVersionUID = 1L;
  private String variation;
  private String gene;
  private String feature;
  private String chr;
  private String start;
  private String end;
  private String effect;
  private int i = 0;

  
  public String getWebClassesPath() { return getClass().getProtectionDomain().getCodeSource().getLocation().getPath(); }


  
  public String getWebRoot() {
    String path = getWebClassesPath();
    if (path.indexOf("WEB-INF") > 0) {
      path = path.substring(0, path.indexOf("WEB-INF/classes"));
    }
    return path;
  }
  
  public String execute() {
    System.out.println(this.variation);
    System.out.println(this.gene);
    System.out.println(this.feature);
    System.out.println(this.chr);
    System.out.println(this.start);
    System.out.println(this.end);
    System.out.println(this.effect);

    
    Map<String, Object> attributes = ActionContext.getContext().getSession();



    
    String sql = "SELECT * FROM variation WHERE";
    Dbase d = new Dbase();
    Map<String, Object> map = new HashMap<String, Object>();
    if (this.variation != null && !this.variation.equals("")) {
      this.i++;
      sql = String.valueOf(sql) + " Uploaded_variation = '" + this.variation + "'";
    } 
    if (this.gene != null && !this.gene.equals("")) {
      if (this.i == 0) {
        sql = String.valueOf(sql) + " Gene = '" + this.gene + "'";
      } else {
        
        sql = String.valueOf(sql) + " AND Gene = '" + this.gene + "'";
      } 
      this.i++;
    } 
    if (this.feature != null && !this.feature.equals("")) {
      if (this.i == 0) {
        sql = String.valueOf(sql) + " Consequence = '" + this.feature + "'";
      } else {
        
        sql = String.valueOf(sql) + " AND Consequence = '" + this.feature + "'";
      } 
      this.i++;
    } 
    if (this.chr != null && !this.chr.equals("")) {
      if (this.i == 0) {
        sql = String.valueOf(sql) + " Chr = '" + this.chr + "'";
      } else {
        
        sql = String.valueOf(sql) + " AND Chr = '" + this.chr + "'";
      } 
      this.i++;
    } 
    if (this.start != null && !this.start.equals("")) {
      if (this.i == 0) {
        sql = String.valueOf(sql) + " Location >= " + this.start;
      } else {
        
        sql = String.valueOf(sql) + " AND Location >= " + this.start;
      } 
      this.i++;








    
    }
    else if (this.end != null && !this.end.equals("")) {
      if (this.i == 0) {
        sql = String.valueOf(sql) + " Location <= " + this.end;
      } else {
        
        sql = String.valueOf(sql) + " AND Location <= " + this.end;
      } 
      this.i++;
    } 







    
    if (this.effect != null && !this.effect.equals("")) {
      if (this.i == 0) {
        sql = String.valueOf(sql) + " Extra LIKE 'IMPACT=" + this.effect + "%'";
      } else {
        
        sql = String.valueOf(sql) + " AND Extra LIKE 'IMPACT=" + this.effect + "%'";
      } 
      this.i++;
    } 
    sql = String.valueOf(sql) + " LIMIT 800";
    
    System.out.println(sql);


    
    map = (HashMap)d.getNewChr(sql);
    
    attributes.put("len", map.get("len"));
    attributes.put("data", map.get("data"));

    
    d.Close();
    
    return "success";
  }

  
  public String getChr() { return this.chr; }



  
  public void setChr(String chr) { this.chr = chr; }



  
  public String getStart() { return this.start; }



  
  public void setStart(String start) { this.start = start; }



  
  public String getEnd() { return this.end; }



  
  public void setEnd(String end) { this.end = end; }



  
  public String getGene() { return this.gene; }



  
  public void setGene(String gene) { this.gene = gene; }


  
  public String getVariation() { return this.variation; }


  
  public void setVariation(String variation) { this.variation = variation; }

  
  public String getFeature() { return this.feature; }


  
  public void setFeature(String feature) { this.feature = feature; }


  
  public String getEffect() { return this.effect; }


  
  public void setEffect(String effect) { this.effect = effect; }
}
