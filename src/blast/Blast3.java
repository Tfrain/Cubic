package blast;

import java.util.Map;
import java.util.Properties;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.finder.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.Map.Entry;
import java.util.regex.*;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.*;
import java.io.Reader;

public class Blast3 extends ActionSupport{
	/**
	 *
	 */
	Properties p = new Properties();
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
	        path = path.replaceAll("%20", " ");
	     }
	     return path;
	}

	private static final long serialVersionUID = 1L;
	Map<String, Object> attribute = ActionContext.getContext().getSession();
	String fornum,forseq,forstart,forin,forN,forgc,forTm,forany,forend,forlity,inputtex;
	String intnum,intseq,intstart,intin,intN,intgc,intTm,intany,intend,intlity;
	String revnum,revseq,revstart,revin,revN,revgc,revTm,revany,revend,revlity;
	String chromosome,database,sposition,eposition,opsize,maxsize,minsize,opttm,maxtm,mintm,optgc,maxgc,mingc,defaultproduct,maxployx,selfany;

    Map<String, String> fornummap=new HashMap<String, String>();

    Map<String, String> intnummap=new HashMap<String, String>();

    Map<String, String> revnummap=new HashMap<String, String>();

    Map<String, String> revlitymap=new HashMap<String, String>();
    Map<String, String[]> formap=new HashMap<String, String[]>();
    Map<String, String[]> intmap=new HashMap<String, String[]>();
    Map<String, String[]> revmap=new HashMap<String, String[]>();
    public String getChromosome() {
		return chromosome;
	}

	public void setChromosome(String chromosome) {
		this.chromosome= chromosome;
	}

	public String getDatabase() {
		return database;
	}

	public void setDatabase(String database) {
		this.database= database;
	}
	public String getSposition() {
		return sposition;
	}

	public void setSposition(String sposition) {
		this.sposition= sposition;
	}

	public String getEposition() {
		return eposition;
	}

	public void setEposition(String eposition) {
		this.eposition= eposition;
	}
	public String getOpsize() {
		return opsize;
	}

	public void setOpsize(String opsize) {
		this.opsize= opsize;
	}
	public String getMaxsize() {
		return maxsize;
	}

	public void setMaxsize(String maxsize) {
		this.maxsize= maxsize;
	}

	public String getMinsize() {
		return minsize;
	}

	public void setMinsize(String minsize) {
		this.minsize= minsize;
	}

	public String getOpttm() {
		return opttm;
	}

	public void setOpttm(String opttm) {
		this.opttm= opttm;
	}

	public String getMaxtm() {
		return maxtm;
	}

	public void setMaxtm(String maxtm) {
		this.maxtm= maxtm;
	}

	public String getMintm() {
		return mintm;
	}

	public void setMintm(String mintm) {
		this.mintm= mintm;
	}

	public String getOptgc() {
		return optgc;
	}

	public void setOptgc(String optgc) {
		this.optgc= optgc;
	}

	public String getMaxgc() {
		return maxgc;
	}

	public void setMaxgc(String maxgc) {
		this.maxgc= maxgc;
	}

	public String getMingc() {
		return mingc;
	}

	public void setMingc(String mingc) {
		this.mingc= mingc;
	}

	public String getDefaultproduct() {
		return defaultproduct;
	}

	public void setDefaultproduct(String defaultproduct) {
		this.defaultproduct= defaultproduct;
	}

	public String getmaxployx() {
		return maxployx;
	}

	public void setMaxployx(String maxployx) {
		this.maxployx= maxployx;
	}

	public String getSelfany() {
		return selfany;
	}

	public void setSelfany(String selfany) {
		this.selfany= selfany;
	}
	public String getInputtex(){
		return  inputtex;
	}
	public void setInputtex(String inputtex){
		this.inputtex = inputtex;
	}


	LocalDateTime localdatetime=LocalDateTime.now();//�½�һ��LocalDateTime�����ȡʱ��
	DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss");
	String localTime = df.format(localdatetime);
	String name = localTime;
	public String execute(){
		try{

			 String filePath=getWebRoot();
			 String textpath=filePath+"file/primerexample.input";//parameter.input·��
			 textpath=textpath.substring(1);
			 textpath=textpath.replaceAll("\\/","\\\\");
			 System.out.println(textpath);
			 File writer = new File(textpath);

			 if(writer.exists())
			 {
				 OutputStream out=null;

				 out=new FileOutputStream(writer);
				 byte b[] = ("PRIMER_SEQUENCE_ID="+name+"\r\n").getBytes();
				 out.write(b);
                 Pattern p = Pattern.compile("[^ATGCatgc]");
                 Matcher matcher = p.matcher(inputtex);
                 inputtex = matcher.replaceAll("");
				 b=("SEQUENCE="+inputtex+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_OPT_SIZE="+opsize+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_MAX_SIZE="+maxsize+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_MIN_SIZE="+minsize+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_OPT_TM="+opttm+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_MIN_TM="+mintm+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_MAX_TM="+maxtm+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_MIN_GC="+mingc+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_OPT_GC_PERCENT="+optgc+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_MAX_GC="+maxgc+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_MAX_POLY_X="+maxployx+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_SELF_ANY="+selfany+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_FILE_FLAG="+"1"+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_PICK_INTERNAL_OLIGO="+"1"+"\r\n").getBytes();
				 out.write(b);
				 b=("PRIMER_DEFAULT_PRODUCT="+defaultproduct+"\r\n=").getBytes();
				 out.write(b);
				 out.close();
				 //System.out.println("д���ļ����ݳɹ�");
			 }

		}catch (Exception e) {
			System.out.println("д���ļ����ݳ���");
			e.printStackTrace();
		}
		finally{}
		try {
			 // ��ȡ�����ļ�pro.properties
		    p.load(Test.class.getClassLoader().getResourceAsStream("pro.properties"));
		    // ��ȡ�����ļ��е��������
		    String primer3_core_path = p.getProperty("path_primer3_core");
			Runtime rt1 = Runtime.getRuntime();
			 String filePath=getWebRoot();
			 filePath=filePath+"file/primerexample.input";//parameter.input·��
			 filePath = filePath.substring(1,filePath.length());
			 filePath = filePath.replaceAll("\\/","\\\\");
           Runtime rt3 = Runtime.getRuntime();
           Process pr3 = rt3.exec("cmd /c "+"cd "+primer3_core_path+" < "+filePath); // cmd /c calc
           //Process pr3 = rt3.exec("cmd /c "+"cd C:\\Users\\xinwang\\Desktop\\work\\primer & primer3_core.exe <"+filePath+"p3.input"); // cmd /c calc

           //System.out.println("cmd /c "+"cd E: & cd E:\\Magic\\primer3 & primer3_core.exe <"+filePath+"p3.input");
           //cmd /c "+"F: & cd F:\\primer\\src & primer3_core.exe
           System.out.println("cmd /c "+"cd "+primer3_core_path+" < "+filePath);
           BufferedReader input3 = new BufferedReader(new InputStreamReader(pr3.getInputStream(), "GBK"));
           String line = null;

           while ((line = input3.readLine()) != null) {
           	byte[] line1=line.getBytes();
               System.out.println(line);
           }
           int exitVal = pr3.waitFor();
           //System.out.println("Exited with error code " + exitVal+":"+"cmd /c "+"blastn  -evalue "+inputeralue+" -perc_identity "+inputmaxtarget+" -max_target_seqs "+inputpercent+" -outfmt 5 "+" -query D:\\Blast+\\blast\\test1.fasta"+" -out D:\\Blast+\\blast\\blast.txt -db "+"D:\\Blast+\\blast\\hzs\\HZ_H.genome");
       }catch (IOException e) {
           //System.out.println(e.toString());
           e.printStackTrace();
       }catch (Exception e) {
           //System.out.println(e.toString());
           e.printStackTrace();
       }
		finally{}

		try {
		    p.load(Test.class.getClassLoader().getResourceAsStream("pro.properties"));
		    // ��ȡ�����ļ��е��������
		    String primerexample_path = p.getProperty("path_primerexample");
			String filePath=getWebRoot();
            filePath = filePath+"file/";
            filePath = filePath.substring(1);
            filePath = filePath.replaceAll("\\/","\\\\");
            Runtime rt1 = Runtime.getRuntime();
            Process pr1 = rt1.exec("cmd /c "+"copy/y "+primerexample_path+name+".for "+filePath); // cmd /c calc
            //Process pr1 = rt1.exec("cmd /c "+"copy C:\\Users\\xinwang\\Desktop\\work\\primer\\primerexample.for "+filePath); // cmd /c calc

            System.out.println("cmd /c "+"copy/y "+primerexample_path+name+".for "+filePath);
            //System.out.println("copy C:\\Users\\xinwang\\Desktop\\work\\primer\\primerexample.for "+filePath);

            int exitVal = pr1.waitFor();
            //System.out.println("Exited with error code " + exitVal+":"+"cmd /c "+"blastn  -evalue "+inputeralue+" -perc_identity "+inputmaxtarget+" -max_target_seqs "+inputpercent+" -outfmt 5 "+" -query D:\\Blast+\\blast\\test1.fasta"+" -out D:\\Blast+\\blast\\blast.txt -db "+"D:\\Blast+\\blast\\hzs\\HZ_H.genome");
        } catch (Exception e) {
            //System.out.println(e.toString());
            e.printStackTrace();
        }
		finally{}
		try {
		    p.load(Test.class.getClassLoader().getResourceAsStream("pro.properties"));
		    // ��ȡ�����ļ��е��������
		    String primerexample_path = p.getProperty("path_primerexample");
			String filePath=getWebRoot();
            filePath = filePath+"file/";
            filePath = filePath.substring(1);
            filePath = filePath.replaceAll("\\/","\\\\");
            Runtime rt1 = Runtime.getRuntime();
            //Process pr1 = rt1.exec("cmd /c "+"copy/y C:\\Users\\xinwang\\Desktop\\work\\primer\\primerexample.int "+filePath); // cmd /c calc
            Process pr1 = rt1.exec("cmd /c "+"copy/y "+primerexample_path+name+".int "+filePath); // cmd /c calc
            System.out.println("cmd /c "+"copy/y "+primerexample_path+name+".int "+filePath);


            int exitVal = pr1.waitFor();
            //System.out.println("Exited with error code " + exitVal+":"+"cmd /c "+"blastn  -evalue "+inputeralue+" -perc_identity "+inputmaxtarget+" -max_target_seqs "+inputpercent+" -outfmt 5 "+" -query D:\\Blast+\\blast\\test1.fasta"+" -out D:\\Blast+\\blast\\blast.txt -db "+"D:\\Blast+\\blast\\hzs\\HZ_H.genome");
        } catch (Exception e) {
            //System.out.println(e.toString());
            e.printStackTrace();
        }
		finally{}
		try {
		    p.load(Test.class.getClassLoader().getResourceAsStream("pro.properties"));
		    // ��ȡ�����ļ��е��������
		    String primerexample_path = p.getProperty("path_primerexample");
            Runtime rt1 = Runtime.getRuntime();
            String filePath=getWebRoot();
            filePath = filePath+"file/";
            filePath = filePath.substring(1);
            filePath = filePath.replaceAll("\\/","\\\\");
            //Process pr1 = rt1.exec("cmd /c "+"copy C:\\Users\\xinwang\\Desktop\\work\\primer\\primerexample.rev "+filePath); // cmd /c calc
            Process pr1 = rt1.exec("cmd /c "+"copy/y "+primerexample_path+name+".rev "+filePath); // cmd /c calc

            System.out.println("cmd /c "+"copy/y "+primerexample_path+name+".rev "+filePath);

            int exitVal = pr1.waitFor();
            //System.out.println("Exited with error code " + exitVal+":"+"cmd /c "+"blastn  -evalue "+inputeralue+" -perc_identity "+inputmaxtarget+" -max_target_seqs "+inputpercent+" -outfmt 5 "+" -query D:\\Blast+\\blast\\test1.fasta"+" -out D:\\Blast+\\blast\\blast.txt -db "+"D:\\Blast+\\blast\\hzs\\HZ_H.genome");
        } catch (Exception e) {
            //System.out.println(e.toString());
            e.printStackTrace();
        }
		finally{}
		try {
            String encoding="GBK";
            String filePath=getWebRoot();
            filePath = filePath+"file/"+name+".for";//for��·��
            filePath = filePath.substring(1,filePath.length());
            System.out.println(filePath);
            File file=new File(filePath);
            	if(file.isFile() && file.exists()){ //�ж��ļ��Ƿ����
            		InputStreamReader read = new InputStreamReader(
            		new FileInputStream(file),encoding);//���ǵ������ʽ
            		BufferedReader bufferedReader = new BufferedReader(read);
            		String lineTxt = null;
            		int sum=0;
            		while((lineTxt = bufferedReader.readLine()) != null){
            			sum++;
            			if(sum<4)
            				continue;

            			lineTxt=lineTxt.trim();
            			String[] str=lineTxt.split("\\s+");
            			fornum=str[0];
            			forseq=str[1];
            			forstart=str[2];
            			forin=str[3];
            			forN=str[4];
            			forgc=str[5];
            			forTm=str[6];
            			forany=str[7];
            			forend=str[8];
            			forlity=str[9];
            			fornummap.put(fornum,fornum);

            			formap.put(fornum,str);

//            			System.out.println(""+lineTxt);
//            			System.out.print("fornum="+fornum);
//            			System.out.print("forseq="+forseq);
//            			System.out.print("forstart="+forstart);
//            			System.out.print("forin="+forin);
//            			System.out.print("forN="+forN);
//            			System.out.print("forgc="+forgc);
//            			System.out.print("forTm="+forTm);
//            			System.out.print("forany="+forany);
//            			System.out.print("forend="+forend);
//            			System.out.println("forlity="+forlity);
                }

            		read.close();
            	}else{
            		System.out.println("�Ҳ���ָ�����ļ�");
            	}
			} catch (Exception e) {
				System.out.println("��ȡ�ļ����ݳ���");
				e.printStackTrace();
			}
		finally{}
		try {
            String encoding="GBK";

            String filePath=getWebRoot();
            filePath = filePath+"file/"+name+".int";//int�ļ�·��
            filePath = filePath.substring(1,filePath.length());
            File file=new File(filePath);
            	if(file.isFile() && file.exists()){ //�ж��ļ��Ƿ����
            		InputStreamReader read = new InputStreamReader(
            		new FileInputStream(file),encoding);//���ǵ������ʽ
            		BufferedReader bufferedReader = new BufferedReader(read);
            		String lineTxt = null;
            		int sum=0;
            		while((lineTxt = bufferedReader.readLine()) != null){
            			sum++;
            			if(sum<4)
            				continue;

            			lineTxt=lineTxt.trim();
            			String[] str=lineTxt.split("\\s+");

            			intnum=str[0];
            			intseq=str[1];
            			intstart=str[2];
            			intin=str[3];
            			intN=str[4];
            			intgc=str[5];
            			intTm=str[6];
            			intany=str[7];
            			intend=str[8];
            			intlity=str[9];
            			intmap.put(intnum,str);
            			intnummap.put(intnum,intnum);

//            			System.out.println(""+lineTxt);
//            			System.out.print("intnum="+intnum);
//            			System.out.print("intseq="+intseq);
//            			System.out.print("intstart="+intstart);
//            			System.out.print("intin="+intin);
//            			System.out.print("intN="+intN);
//            			System.out.print("intgc="+intgc);
//            			System.out.print("intTm="+intTm);
//            			System.out.print("intany="+intany);
//            			System.out.print("intend="+intend);
//            			System.out.println("intlity="+intlity);
                }

            		read.close();
            	}else{
            		System.out.println("�Ҳ���ָ�����ļ�");
            	}
			} catch (Exception e) {
				System.out.println("��ȡ�ļ����ݳ���");
				e.printStackTrace();
			}
		finally{}
		try {
            String encoding="GBK";

            String filePath=getWebRoot();
            filePath = filePath+"file/"+name+".rev";//rev�ļ�·��
            filePath = filePath.substring(1,filePath.length());
            File file=new File(filePath);
            	if(file.isFile() && file.exists()){ //�ж��ļ��Ƿ����
            		InputStreamReader read = new InputStreamReader(
            		new FileInputStream(file),encoding);//���ǵ������ʽ
            		BufferedReader bufferedReader = new BufferedReader(read);
            		String lineTxt = null;
            		int sum=0;
            		while((lineTxt = bufferedReader.readLine()) != null){
            			sum++;
            			if(sum<4)
            				continue;

            			lineTxt=lineTxt.trim();
            			String[] str=lineTxt.split("\\s+");
            			revnum=str[0];
            			revseq=str[1];
            			revstart=str[2];
            			revin=str[3];
            			revN=str[4];
            			revgc=str[5];
            			revTm=str[6];
            			revany=str[7];
            			revend=str[8];
            			revlity=str[9];
            			revmap.put(revnum,str);
            			revnummap.put(revnum,revnum);
//
//            			System.out.print("revnum="+revnum);
//            			System.out.print("revseq="+revseq);
//            			System.out.print("revstart="+revstart);
//            			System.out.print("revin="+revin);
//            			System.out.print("revN="+revN);
//            			System.out.print("revgc="+revgc);
//            			System.out.print("revTm="+revTm);
//            			System.out.print("revany="+revany);
//            			System.out.print("revend="+revend);
//            			System.out.println("revlity="+revlity);
                }
            		read.close();
            	}else{
            		System.out.println("�Ҳ���ָ�����ļ�");
            	}
			} catch (Exception e) {
				System.out.println("��ȡ�ļ����ݳ���");
				e.printStackTrace();
			}
		finally{}

		attribute.put("fornummap", fornummap);

		attribute.put("intnummap", intnummap);

		attribute.put("revnummap", revnummap);

		attribute.put("formap",formap);
		attribute.put("intmap",intmap);
		attribute.put("revmap",revmap);
		return SUCCESS;
	}
}


