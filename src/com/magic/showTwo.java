package com.magic;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class showTwo extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String trait;

	public String execute(){
		System.out.println("good");
		Map<String,Object> session = ActionContext.getContext().getSession();
		session.put("trait", trait);
		System.out.println("the trait which you choose is " + session.get("trait"));
		String[] traitArray = trait.split(",");
		
		int len = traitArray.length;
		int i = 0;
		for(i=0;i<len;i++){
			System.out.println(i+" is "+traitArray[i]);
		}
		session.put("traitlen", len);
		session.put("traitArray", traitArray);
		return SUCCESS;
	}
	
	public String getTrait() {
		return trait;
	}

	public void setTrait(String trait) {
		this.trait = trait;
	}
}
