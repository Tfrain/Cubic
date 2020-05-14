package blast;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.Map.Entry;
import java.util.regex.*;
import java.sql.ResultSet;
import java.io.*;
import java.sql.*;
import java.io.Reader;

public class Blast extends ActionSupport{
	/**
	 *
	 */
	public String getWebClassesPath()
	{
	     String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
	     return path;
	}
	 public String getWebRoot()
	 {
	     String path = getWebClassesPath();
	     if (path.indexOf("WEB-INF") > 0)
	     {
	        path = path.substring(0,path.indexOf("WEB-INF/classes"));
	     }
	     return path;
	}
	private static final long serialVersionUID = 1L;
	Map<String, Object> attribute = ActionContext.getContext().getSession();
	String inputeralue;
	String inputmaxtarget;
	String inputpercent;
	String blastdatabase = "",blastdatabase1="";
	String database,database1;
	String blastprograme,blastprograme1;
	String programe,programe1;
	String score,score1;
	String evalue,evalue1;
	String identity,identity1;
	String querylength,querylength1;
	String inputid,inputid1;
	String gap,gap1;
	String qseq,qseq1;
	String hseq,hseq1;
	//  添加 
	String positive,positive1;
	String midline,midline1;
	String queryid,queryid1;
	String chr,chr1,trait;
	String hspnum,hspnum1;
	String hitnum,hitnum1;
	String hitfrom,hitfrom1;
	String hitto,hitto1;
	String queryfrom,queryfrom1;
	String queryto,queryto1;
	String totalscore,totalscore1;
	String inputfile,inputfile1;
	String inputtext,inputtext1;
    Map<String, String> qseqmap=new HashMap<String, String>();
    Map<String, String> midlinemap=new HashMap<String, String>();
    Map<String, String> hseqmap=new HashMap<String, String>();
    Map<String, String> evaluemap=new HashMap<String, String>();
    Map<String, String> scoremap=new HashMap<String, String>();
    Map<String, String> totalscoremap=new HashMap<String, String>();
    Map<String, String> chrmap=new HashMap<String, String>();
    Map<String, String> identitymap=new HashMap<String, String>();
    Map<String, String> gapmap=new HashMap<String, String>();
    Map<String,String>  queryfrommap=new HashMap<String, String>();
    Map<String,String>  querytomap=new HashMap<String, String>();
    Map<String,String>  hitfrommap=new HashMap<String, String>();
    Map<String,String>  hittomap=new HashMap<String, String>();
    Map<String,String>  positivemap=new HashMap<String, String>();

    public String getTrait() {
		return trait;
	}

	public void setTrait(String trait) {
		this.trait= trait;
	}

	public String getBlastprograme() {
		return blastprograme;
	}


	public void setBlastprograme(String blastprograme) {
		this.blastprograme = blastprograme;
	}
	public String getPrograme() {
		return programe;
	}

	public void setPrograme(String programe) {
		this.programe = programe;
	}
	public String getInputeralue() {
		return inputeralue;
	}

	public void setInputeralue(String inputeralue) {
		this.inputeralue = inputeralue;
	}
	public String getDatabase() {
		return database;
	}

	public void setDatabase(String database) {
		this.database = database;
	}
	public String getInputmaxtarget() {
		return inputmaxtarget;
	}

	public void setInputmaxtarget(String inputmaxtarget) {
		this.inputmaxtarget = inputmaxtarget;
	}
	public String getInputpercent() {
		return inputpercent;
	}

	public void setInputpercent(String inputpercent) {
		this.inputpercent = inputpercent;
	}

	public String getInputfile() {
		return inputfile;
	}

	public void setInputfile(String inputfile) {
		this.inputfile = inputfile;
	}

	public String getInputtext() {
		return inputtext;
	}

	public void setInputtext(String inputtext) {
		this.inputtext = inputtext;
	}


	public String execute(){
		if(inputtext!=null)
		{
			try{
				String filePath=getWebRoot();
	            filePath = filePath+"file/";
	            filePath = filePath.substring(1);
	            filePath = filePath.replaceAll("\\/","\\\\");
				String textpath=filePath+"blastin.txt";
				 File writer = new File(textpath);
				 if(writer.exists())
				 {
					 OutputStream out=null;
					 out=new FileOutputStream(writer);
                     Pattern p = Pattern.compile("[^ATGCatgc]");
                     Matcher matcher = p.matcher(inputtext);
                     inputtext = matcher.replaceAll("");
					 byte b[] = inputtext.getBytes();
					 out.write(b);
					 out.close();
				 }

			}catch (Exception e) {
				System.out.println("写入文件内容出错");
				e.printStackTrace();
			}finally{}
		}
		try {
            Runtime rt = Runtime.getRuntime();
            String filePath=getWebRoot();
            filePath = filePath+"file/";
            filePath = filePath.substring(1);
            filePath = filePath.replaceAll("\\/","\\\\");
            inputfile=filePath+"blastin.txt";
            String cmd1="blastn";
            /*
             *if(database == null || blastprograme == null){
             *    return SUCCESS;
             *}
             */
            //如果database为空就执行try后面的代码，这不是bug，而是正常流程
            if(blastprograme.equals("primer-blast"))
                cmd1="blastn -task blastn-short";
            String datafile = new String();
            /*
             *if(database.equals("HZS"))
             *{
             *    datafile="F:\\work\\website_project\\blast\\blast\\hzs\\HZ_H.genome";
             *    database1=database;
             *}
             *else if(database.equals("V3.25"))
             *{
             *    datafile="F:\\Magic\\blast\\v3.25\\Zea_mays.AGPv3.25";
             *    database1=database;
             *}
             *else if(database.equals("V4"))
             *{
             *    datafile="F:\\Magic\\blast\\v4\\Zea_mays.AGPv4.dna.toplevel.fa";
             *    database1=database;
             *}
             *else if(database.equals("PAN"))
             *{
             *    datafile="F:\\Magic\\blast\\pan\\pan.fasta";
             *    database1=database;
             *}
             */
//             the path for the server
            if(database.equals("HZS"))
            {
                datafile="E:\\Magic\\blast\\hzs\\HZ_H.genome";
            }
            else if(database.equals("V3.25"))
            {
                datafile="E:\\Magic\\blast\\v3.25\\Zea_mays.AGPv3.25.database";
            }
            else if(database.equals("V4"))
            {
                datafile="E:\\Magic\\blast\\v4\\Zea_mays.AGPv4.dna.toplevel.fa";
            }
            else if(database.equals("PAN"))
            {
                datafile="E:\\Magic\\blast\\pan\\pan.fasta";
            }

            System.out.println("database="+database);
            System.out.println("database1="+database1);

            Process pr = rt.exec("cmd /c "+cmd1+" -evalue "+inputeralue+" -perc_identity "+inputmaxtarget+" -max_target_seqs "+inputpercent+" -outfmt 5 "+" -query "+inputfile+" -out "+filePath+"blast.txt -db "+ datafile); // cmd /c calc
            //Process pr = rt.exec("cmd /c "+cmd1+" -evalue "+inputeralue+" -perc_identity "+inputmaxtarget+" -max_target_seqs "+inputpercent+" -outfmt 5 "+" -query "+inputfile+" -out "+filePath+"blast.txt -db "+" E:\\Magic\\blast\\hzs\\HZ_H.genome"); // cmd /c calc
            	//-task blastn-short
            System.out.println("cmd /c "+cmd1+" -evalue "+inputeralue+" -perc_identity "+inputmaxtarget+" -max_target_seqs "+inputpercent+" -outfmt 5 "+" -query "+inputfile+" -out "+filePath+"blast.txt -db "+datafile);
            //blastn  -evalue 0.00001 -perc_identity 95 -max_target_seqs 5 -outfmt 5  -query D:\Blast+\blast\test1.fasta -out D:\Blast+\blast\blast.txt -db D:\Blast+\blast\hzs\HZ_H.genome
            BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream(), "GBK"));

            String line = null;

            while ((line = input.readLine()) != null) {
                System.out.println(line+"1");
            }

            //System.out.println("Exited with error code " + exitVal+":"+"cmd /c "+"blastn -task blastn-short  -evalue "+inputeralue+" -perc_identity "+inputmaxtarget+" -max_target_seqs "+inputpercent+" -outfmt 5 "+" -query D:\\Blast+\\blast\\test1.fasta"+" -out D:\\Blast+\\blast\\blast.txt -db "+"D:\\Blast+\\blast\\hzs\\HZ_H.genome");
        } catch (Exception e) {
            //System.out.println(e.toString());
            e.printStackTrace();
        }finally{}

		try {
            String encoding="GBK";
            String filePath=getWebRoot();
            filePath = filePath+"file/";
            filePath = filePath.substring(1);
            filePath = filePath.replaceAll("\\/","\\\\");
            filePath = filePath+"blast.txt";//blast.out文件路径
            File file=new File(filePath);
            //System.out.println(filePath);
            	if(file.isFile() && file.exists()){ //判断文件是否存在
            		InputStreamReader read = new InputStreamReader(
            		new FileInputStream(file),encoding);//考虑到编码格式
            		BufferedReader bufferedReader = new BufferedReader(read);
            		String lineTxt = null;
            		while((lineTxt = bufferedReader.readLine()) != null){
            			//char[] strchar=lineTxt.toCharArray();
            			lineTxt=lineTxt.trim();
            			//System.out.println(""+lineTxt);
            			if(lineTxt.indexOf("<Iteration_query-ID>")!=-1)
            			{
            				queryid=lineTxt.replace("<Iteration_query-ID>","");
            				queryid=queryid.replace("</Iteration_query-ID>","");
            				queryid1=queryid;
            				//System.out.println("queryid="+queryid);
            			}
            			else if(lineTxt.indexOf("<BlastOutput_program>")!=-1)
            			{
            				programe=lineTxt.replace("<BlastOutput_program>","");
            				programe=programe.replace("</BlastOutput_program>","");
            				programe1=programe;
            				//System.out.println("programe="+programe);
            			}
            			else if(lineTxt.indexOf("<BlastOutput_db>")!=-1)
            			{
            				blastdatabase=lineTxt.replace("<BlastOutput_db>","");
            				blastdatabase=blastdatabase.replace("</BlastOutput_db>","");
            				blastdatabase1=blastdatabase;
            				//System.out.println("database="+blastdatabase);
            			}
            			else if(lineTxt.indexOf("<BlastOutput_query-def>")!=-1)
            			{
            				inputid=lineTxt.replace("<BlastOutput_query-def>","");
            				inputid=inputid.replace("</BlastOutput_query-def>","");
            				inputid1=inputid;
            				//System.out.println("inputid="+inputid);
            			}
            			else if(lineTxt.indexOf("<BlastOutput_query-len>")!=-1)
            			{
            				querylength=lineTxt.replace("<BlastOutput_query-len>","");
            				querylength=querylength.replace("</BlastOutput_query-len>","");
            				querylength1=querylength;
            				//System.out.println("querylength="+querylength);
            			}
            			else if(lineTxt.indexOf("<Hsp_bit-score>")!=-1)
            			{
            				totalscore=lineTxt.replace("<Hsp_bit-score>","");
            				totalscore=totalscore.replace("</Hsp_bit-score>","");
            				totalscore1=totalscore;
            				if(chr!=null&&hitnum!=null&&hspnum!=null&&totalscore!=null)
                			{
                				totalscoremap.put(chr+"."+hitnum+"."+hspnum,totalscore);
                				
                				//chrmap.put(chr+"."+hitnum+"."+hspnum, chr+"."+hitfrom+"."+hitto);
                				//chrmap.put(chr+"."+hitnum+"."+hspnum, chr+"."+hitnum+"."+hspnum);
                				
                				System.out.println("totalscoreput:"+chr+"."+hitnum+"."+hspnum+"  "+totalscore);
                				//System.out.println("chrput:"+chr+"."+hitnum+"."+hspnum+"  "+chr+"."+hitnum+"."+hspnum);
                			}
            				//System.out.println("score="+score);
            			}

            			else if(lineTxt.indexOf("<Hsp_query-from>")!=-1)
            			{
            			queryfrom=lineTxt.replace("<Hsp_query-from>","");
            			queryfrom=queryfrom.replace("</Hsp_query-from>","");
            			queryfrom1=queryfrom;
            				if(chr!=null&&hitnum!=null&&hspnum!=null&&queryfrom!=null)
            				{
            					queryfrommap.put(chr+"."+hitnum+"."+hspnum,queryfrom);

                				System.out.println("queryfromput:"+chr+"."+hitnum+"."+hspnum+"  "+queryfrom);

                			}
            			}
            			else if(lineTxt.indexOf("<Hsp_query-to>")!=-1)
                			{
                				queryto=lineTxt.replace("<Hsp_query-to>","");
                				queryto=queryto.replace("</Hsp_query-to>","");
                				queryto1=queryto;
                				if(chr!=null&&hitnum!=null&&hspnum!=null&&queryto!=null)
                    			{
                					querytomap.put(chr+"."+hitnum+"."+hspnum,queryto);
                    				System.out.println("querytoput:"+chr+"."+hitnum+"."+hspnum+"  "+queryto);
                    			}
                				//System.out.println("score="+score);
                			}

            			else if(lineTxt.indexOf("<Hsp_hit-from>")!=-1)
            			{
            				hitfrom=lineTxt.replace("<Hsp_hit-from>","");
            				hitfrom=hitfrom.replace("</Hsp_hit-from>","");
            				hitfrom1=hitfrom;
            				if(chr!=null&&hitnum!=null&&hspnum!=null&&hitfrom!=null)
                			{
            					hitfrommap.put(chr+"."+hitnum+"."+hspnum,hitfrom);

                				System.out.println("hitfromput:"+chr+"."+hitnum+"."+hspnum+"  "+hitfrom);

                			}
            			}
            			else if(lineTxt.indexOf("<Hsp_hit-to>")!=-1)
                			{
            				    hitto=lineTxt.replace("<Hsp_hit-to>","");
            				    hitto=hitto.replace("</Hsp_hit-to>","");
                				hitto1=hitto;
                				if(chr!=null&&hitnum!=null&&hspnum!=null&&hitto!=null)
                    			{
                					hittomap.put(chr+"."+hitnum+"."+hspnum,hitto);
                					chrmap.put(chr+"."+hitnum+"."+hspnum, chr+"_"+hitfrom+"_"+hitto);
                					//System.out.println("chrmap" + chrmap.get(chr+"."+hitnum+"."+hspnum));
                    				System.out.println("querytoput:"+chr+"."+hitnum+"."+hspnum+"  "+hitto);
                    			}
                				//System.out.println("score="+score);
                			}

            			else if(lineTxt.indexOf("<Hsp_score>")!=-1)
            			{
            				score=lineTxt.replace("<Hsp_score>","");
            				score=score.replace("</Hsp_score>","");
            				score1=score;
            				if(chr!=null&&hitnum!=null&&hspnum!=null&&score!=null)
                			{
                				scoremap.put(chr+"."+hitnum+"."+hspnum,score);
                				System.out.println("scoreput:"+chr+"."+hitnum+"."+hspnum+"  "+score);
                			}
            				//System.out.println("score="+score);
            			}
            			else if(lineTxt.indexOf("<Hsp_evalue>")!=-1)
            			{
            				evalue=lineTxt.replace("<Hsp_evalue>","");
            				evalue=evalue.replace("</Hsp_evalue>","");
            				evalue1=evalue;
            				if(chr!=null&&hitnum!=null&&hspnum!=null&&evalue!=null)
                			{
                				evaluemap.put(chr+"."+hitnum+"."+hspnum,evalue);
                				System.out.println("evalueput:"+chr+"."+hitnum+"."+hspnum+"  "+evalue);
                			}
            				//System.out.println("evalue="+evalue);
            			}
            			else if(lineTxt.indexOf("<Hsp_identity>")!=-1)
            			{
            				identity=lineTxt.replace("<Hsp_identity>","");
            				identity=identity.replace("</Hsp_identity>","");
            				identity1=identity;
            				if(chr!=null&&hitnum!=null&&hspnum!=null&&identity!=null)
                			{
            					identitymap.put(chr+"."+hitnum+"."+hspnum,identity);
                				System.out.println("identityput:"+chr+"."+hitnum+"."+hspnum+"  "+identity);
                			}
            				//System.out.println("identity="+identity);
            			}
            			else if(lineTxt.indexOf("<Hsp_positive>")!=-1)
            			{
            				positive=lineTxt.replace("<Hsp_positive>","");
            				positive=positive.replace("</Hsp_positive>","");
            				positive1=positive;
            				if(chr!=null&&hitnum!=null&&hspnum!=null&&positive!=null)
                			{
            					positivemap.put(chr+"."+hitnum+"."+hspnum,identity);
                				System.out.println("positiveput:"+chr+"."+hitnum+"."+hspnum+"  "+positive);
                			}
            			}

            			else if(lineTxt.indexOf("<Hsp_gaps>")!=-1)
            			{
            				gap=lineTxt.replace("<Hsp_gaps>","");
            				gap=gap.replace("</Hsp_gaps>","");
            				gap1=gap;
            				if(chr!=null&&hitnum!=null&&hspnum!=null&&gap!=null)
                			{
                				gapmap.put(chr+"."+hitnum+"."+hspnum,gap);
                				System.out.println("gapput:"+chr+"."+hitnum+"."+hspnum+"  "+gap);
                			}
            				//System.out.println("gap="+gap);
            			}
            			else if(lineTxt.indexOf("<Hit_num>")!=-1)
            			{
            				hitnum=lineTxt.replace("<Hit_num>","");
            				hitnum=hitnum.replace("</Hit_num>","");
            				hitnum1=hitnum;
            				//System.out.println("gap="+gap);
            			}
            			else if(lineTxt.indexOf("<Hit_id>")!=-1)
            			{
            				chr=lineTxt.replace("<Hit_id>","");
            				chr=chr.replace("</Hit_id>","");
            				chr1=chr;

            				//System.out.println("gap="+gap);
            			}
            			else if(lineTxt.indexOf("<Hsp_num>")!=-1)
            			{
            				hspnum=lineTxt.replace("<Hsp_num>","");
            				hspnum=hspnum.replace("</Hsp_num>","");
            				hspnum1=hspnum;
            				//System.out.println("gap="+gap);
            			}
            			else if(lineTxt.indexOf("<Hsp_qseq>")!=-1)
            			{
            				qseq=lineTxt.replace("<Hsp_qseq>","");
            				qseq=qseq.replace("</Hsp_qseq>","");
            				qseq1=qseq;
            				qseqmap.put(chr+"."+hitnum+"."+hspnum,qseq);
            				//System.out.println("qseq="+qseq);
            			}
            			else if(lineTxt.indexOf("<Hsp_midline>")!=-1)
            			{
            				midline=lineTxt.replace("<Hsp_midline>","");
            				midline=midline.replace("</Hsp_midline>","");
            				midline1=midline;
            				midlinemap.put(chr+"."+hitnum+"."+hspnum,midline1);
            				//System.out.println("midline="+midline);
            			}
            			else if(lineTxt.indexOf("<Hsp_hseq>")!=-1)
            			{
            				hseq=lineTxt.replace("<Hsp_hseq>","");
            				hseq=hseq.replace("</Hsp_hseq>","");
            				hseq1=hseq;
            				hseqmap.put(chr+"."+hitnum+"."+hspnum,hseq);

            				//System.out.println("hseq="+hseq);
            			}
            			else if(lineTxt.indexOf("</Hit>")!=-1)
            			{
//            				System.out.println("queryid="+queryid1);
//                    		System.out.println("programe="+programe1);
//                    		System.out.println("database="+database);
//                    		System.out.println("database1="+database1);
//                    		System.out.println("blastdatabase1="+blastdatabase1);
//                    		System.out.println("blastdatabase="+blastdatabase);
//                    		System.out.println("inputid="+inputid1);
//                    		System.out.println("querylength="+querylength1);
//                    		System.out.println("score="+score1);
//                    		System.out.println("evalue="+evalue1);
//                    		System.out.println("identity="+identity1);
//                    		System.out.println("gap="+gap1);
//                    		System.out.println("qseq=   "+qseq1);
//                    		System.out.println("midline="+midline1);
//                    		System.out.println("hseq=   "+hseq1);
//                    		System.out.println("hitnum="+hitnum1);
//                    		System.out.println("chr=   "+chr1);
//                    		System.out.println("hspnum=   "+hspnum1);
//                    		System.out.println("Key="+chr1+"."+hitnum1+"."+hspnum1);
//                    		System.out.println("trait="+trait);
//                    		System.out.println("queryfrom="+queryfrom1);
//                    		System.out.println("queryto="+queryto1);
//                    		System.out.println("hitfrom="+hitfrom1);
//                    		System.out.println("hitto="+hitto);

            				//if (lineTxt.indexOf("<Hsp_hit-from>")!=-1 && lineTxt.indexOf("<Hsp_hit-to>")!=-1) {
            				//	hitfrom=lineTxt.replace("<Hsp_hit-from>","");
                			//	hitfrom=hitfrom.replace("</Hsp_hit-from>","");
                			//	hitfrom1=hitfrom;
                			//	hitto=lineTxt.replace("<Hsp_hit-to>","");
             				 //   hitto=hitto.replace("</Hsp_hit-to>","");
                 			//	hitto1=hitto;
                 			//	if(chr!=null&&hitnum!=null&&hspnum!=null&&totalscore!=null&&hitfrom!=null&&hitto!=null) {
                 			//		chrmap.put(chr+"."+hitnum+"."+hspnum, chr+"."+hitfrom+"."+hitto);
                 			//	}
                				
            				//}

            				hitfrom=null;
            				hitto=null;
            				queryfrom=null;
            				queryto=null;
            				programe=null;
            				score=null;
            				evalue=null;
            				identity=null;
            				querylength=null;
            				inputid=null;
            				gap=null;
            				qseq=null;
            				hseq=null;
            				midline=null;
            				queryid=null;
            				chr=null;
            				hspnum=null;
            				hitnum=null;
            				totalscore=null;
            			}

                }

            		read.close();
            	}else{
            		System.out.println("找不到指定的文件");
            	}
			} catch (Exception e) {
				System.out.println("读取文件内容出错");
				e.printStackTrace();
			}finally{}


		if(blastdatabase1.indexOf("hzs")!=-1){
			database1 = "HZS";
		}
		else if(blastdatabase1.indexOf("v3.25")!=-1){
			database1 = "V3.25";
		}
		else if(blastdatabase1.indexOf("v4")!=-1){
			database1 = "V4";
		}
		else if(blastdatabase1.indexOf("pan")!=-1){
			database1 = "PAN";
		}
		attribute.put("blastprograme",programe1);
		attribute.put("queryid", queryid1);
		//attribute.put("programe",programe1);
		attribute.put("blastdatabase",blastdatabase1);
		attribute.put("inputid",inputid1);
		attribute.put("trait",trait);
		attribute.put("querylength",querylength1);
		attribute.put("score",score1);
		attribute.put("evalue",evalue1);
		attribute.put("identity",identity1);
		// 添加
		attribute.put("positive",positive1);
		
		attribute.put("gap",gap1);
		attribute.put("qseq",qseq1);
		attribute.put("midline",midline1);
		attribute.put("hseq",hseq1);
		attribute.put("qseqmap",qseqmap);
		attribute.put("hseqmap",hseqmap);
		attribute.put("midlinemap",midlinemap);
		attribute.put("evaluemap",evaluemap);
		attribute.put("scoremap",scoremap);
		attribute.put("totalscoremap",totalscoremap);
		attribute.put("chrmap",chrmap);
		attribute.put("identitymap",identitymap);
		// 添加
		attribute.put("positivemap",positivemap);
		
		attribute.put("gapmap",gapmap);
		attribute.put("queryfrommap", queryfrommap);
		attribute.put("querytomap", querytomap);
		attribute.put("hitfrommap", hitfrommap);
		attribute.put("hittomap", hittomap);
		attribute.put("database",database1);
		return SUCCESS;
	}
}
