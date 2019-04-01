/**
 *
 */
/**
 * @author xinwang
 *
 */
package jbrowse;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.ServletActionContext;

import com.db.magic.Dbase;
import com.opensymphony.xwork2.ActionSupport;

public class jbrowse extends ActionSupport{
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
	private String geneid;
    private String vcfTracks;

	public String execute(){
        if(geneid != null){
            System.out.println("your geneid is " +geneid);

            String sql = "select chr,start,end from  zmb73_annotation_combined where ID = '"+geneid+"'";
            PrintWriter writer = null;
            Dbase d = new Dbase();
            String  result  = d.jbtest(sql);
            System.out.println(result);
            try {
                writer = ServletActionContext.getResponse().getWriter();
                writer.write(result);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            d.Close();
        }else if(vcfTracks != null){
            File file = new File(getWebRoot() + "/JBrowse/data/tracks.conf");

            System.out.println(getWebRoot() + "/JBrowse/data/tracks.conf");
			try {
				 if(! file.exists()){
		                file.createNewFile();
		            }
				//in = new BufferedReader(
						//new InputStreamReader(
							//new FileInputStream(file)
							//)
						//);
				//StringBuilder content = new StringBuilder("");
				//String line;
				//while((line = in.readLine()) != null){
					//content.append(line + "\n");
				//}
                //in.close();
				BufferedWriter out = new BufferedWriter(
	                    new OutputStreamWriter(
	                        new FileOutputStream(file, false)
	                        )
	                    );
                String[] tracks = vcfTracks.split(",");
                for (String chr  : tracks) {
                String content =
"[ tracks . " + chr + "]\n"
+"hooks.modify = function( track, feature, div ) { div.style.backgroundColor = track.config.variantIsHeterozygous(feature) ? 'red' : 'blue'; }\n"
+"key = " + chr +"\n"
+"# multiline callbacks can be defined in tracks.conf format files\n"
+"variantIsHeterozygous = function( feature ) {\n"
    +"/* javascript comments inside callback should use this format, not double slash format */\n"
    +"var genotypes = feature.get('genotypes');\n"
    +"for( var sampleName in genotypes ) {\n"
        +"try {\n"
            +"var gtString = genotypes[sampleName].GT.values[0];\n"
            +"if( ! /^1([\\|\\/]1)*$/.test( gtString) && ! /^0([\\|\\/]0)*$/.test( gtString ) )\n"
                +"return true;\n"
        +"} catch(e) {}\n"
    +"}\n"
    +"return false;\n"
    +"/* note: the body of the function including the closing brackets should be spaced away from the left-most column\n"
        +"there should also not be empty lines */\n"
  +"}\n"
+"storeClass = JBrowse/Store/SeqFeature/VCFTabix\n"
+"urlTemplate =vcffiles/" + chr + ".vcf.gz\n"
+"type = JBrowse/View/Track/CanvasVariants\n"
+"metadata.category = VCF\n"
+"metadata.Description = Heterozygous variants are shown in red, homozygous variants in blue.\n";
				//Pattern p = Pattern.compile("chr\\d+_\\d+_\\d+");
                //System.out.println(content.toString());
				//Matcher matcher = p.matcher(content.toString());
	            out.write(content);
                System.out.println(content);
	            out.flush();
                }
                out.close();
            } catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

        }
		return null;
	}



	public String getGeneid() {
		return geneid;
	}

	public void setGeneid(String geneid) {
		this.geneid = geneid;
	}

    public String getVcfTracks(){
        return vcfTracks;
    }

    public void setVcfTracks(String vcfTracks){
        this.vcfTracks = vcfTracks;
    }
}
