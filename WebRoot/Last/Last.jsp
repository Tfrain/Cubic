<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Blastn</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
	<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
<script type="text/javascript"> 

        var blast_example = 
'TTGAGAGTTCTAATAAGAGCAACGGCCAATACCATTAGCGAGTTATTTTTCTGCAATATATGTCAGCAAC\n'+
'CGATCATTTGGTTATGGCTCGTGTCATACAGGATGTATTGGATCCCTTTACACCAACCATTCCACTAAGA\n'+
'ATAACGTACAACAATAGGCTACTTCTGCCAAGTGCTGAGCTAAAGCCATCCGCGGTTGTAAGTAAACCAC\n'+
'GAGTCGATATCGGTGGCAGTGACATGAGGGCTTTCTACACCCTGGTAAGCCAAGCAATTTACAGATAATG\n'+
'ATACCATTTTGGAGAATTTATGCCAATTCATTTGGTATGTTACACATAAAAGTATTATGCACTTTGTAAT\n'+
'GGATTTATCAATATTAGTTTGAACAAATTTAATAAGAACAAAATGCCTAAATCTTGCAGTATATAAACAT\n'+
'GTATATATGCTAACTTGTTTGTCTTCGACTTGAAAAGGTACTGATTGACCCGGATGCCCCAAGTCCAAGC\n'+
'CATCCATCACTAAGGGAGTACTTGCACTGGTAAAAAAAGCGCAATATGTTCCACTTCCTAGATTTGGTTC\n'+
'TTTTTCGCTTTGCCTTATTATGATATTGGTCCACTATTGTGTAGGATGGTGACAGATATTCCAGAAACAA\n'+
'CTAGTGTCAACTTTGGTAAGAATGCATATAGTTATCTGTCATTCCATTGTGTTTCTGCTGAATATAGTAT\n'+
'CTGTGGAGCTTAGGTTGTAGTCTCTTCTTGCTTCTCAGACCTATTGGCTACCATTGAACTGATGCAGATA\n'+
'AGGATGCAATTAATACATGAAATCAGCAACCATAGGCTGAATGCTAGACCAACTTGTTAGGTGAATGCAA\n'+
'TATGGCAGCTTACCGCTTACATGCATAGTAATATCATGAAATCCACTAACTTAGTACCATAACTAAAGAA\n'+
'GCAATCTGGTAGAACTCACTTTCAATCCAGCCCATTACTAGAGACTGGATTATCGATATTAAACACAAAC\n'+
'AAGTATTTAACAGTGTAATAAACTGGTATACGTATGATTCACAGTGCCCCTGTTTGTTCTTTAATTGGTT\n'+
'GGTAACCTTGAGGTGTCAATTTCAGCAGAACTAAGGTTCATTTACAGTTGCCATACTAAAGTTACTCAAG\n'+
'TACACTTTTTAGTTTACATAGTTTTTTCATACTCGATTTTACCTGAGACTTTGAAACCGATATTGGAAAC\n'+
'AAAGCAGCCATTAATTTTGTCAAACAAGAGGAGCTATATTTAAAGGCTTCTCTTTGTCTAAATTGAAAGA\n'+
'ATTAAAAACAATAAATGACGACGCTTCCACATACTTCAGTGCTCCTTGAACTATTCAGTATATAATGTCA\n'+
'GGATGCTCTCGCAGGCCAAGAGCTAATATTTTATGAGAGGCCGGACCCAAGATCTGGCATCCACAGGCTG\n'+
'GTATTTGTGCTGTTCCGTCAACTTGGCAGGGGGACAGTTTTTGCACCAGAAATGCGCCACAACTTCAACT\n'+
'GCAGAAGCTTTGCACGGCAATATCACCTCAGCATTGCCACCGCTACATATTTCAACTGTCAAAGGGAAGG\n'+
'TGGATCCGGCGGAAGAAGGTTTAGGGAAGAGTAGAAACCATAGGCCACTGCATGGTCACACTATAGAAAT\n'+
'ATCATCAATAATGTGCACTATATTGAATCAATGCACCACCTCTATATGCTGAATGTTATGTATCTCAAAC\n'+
'TATGATTGTACTGACTTGAAAGGTTGAGAGCTTAGTCTCTTAGCAGAATATAGCACAATATTACTAGTA \n';
        var primer_example ='TTGAGAGTTCTAATAAGAGC';
        function showExample(){
            var database = $('#blastprograme1');
        if(database.val() === 'blastn'){
            $('#inputtext').val(blast_example);
        }else if(database.val() === 'primer-blast'){
            $('#inputtext').val(primer_example);
        }

        }

        function resetExample(){
            $('#inputtext').val("");
        }
  function check1()
{ 
	var eralue=$("#Eralue").val();//用户名
	var maxtar=$("#maxtar").val();//用户名
 	var percent=$("#percent").val();
 	var database1=$("#Database").val();
 	var blastprograme1=$("#blastprograme1").val();
 	var inputfile1=$("#inputfile1").val();
 	var inputtext1=$("#inputtext").val();
   if(eralue=="" || maxtar=="" ||percent==""||database1=="Choose database")
   {
     alert("Error: Please put in eralue,maxtarget,percent!");
     return false;
   }
   if(inputtext1=="")
   {
     alert("Error: Please put in FASTA sequence!");
     return false;
   }
  return true;
 }	
 </script>
<script type="text/javascript"> 
  function checkdata()
{ 
	var blastprograme1=$("#blastprograme1").val();//用户名
	if(blastprograme1=="primer-blast")
    {
		document.getElementById("Eralue").value="0.1";
    }
	if(blastprograme1=="blastn")
    {
		document.getElementById("Eralue").value="0.00001";
    }
  return true;
 }	
 </script>
  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    
    <div class="container" style="height:600px;"><!--lv 7-11-11：16 change  850->600-->
            <div class="describe">
                <h3>BLASTN/Primer-BLASTN</h3>
                <h4>You can use BLASTN program comparing nucleotide sequence to our databases and calculates the statistical significance. If you query sequence is less than 50 bp, please use Primer-BLASTN. Here we use Basic Local Alignment Search Tool (BLAST) as a backend engine.</h4>
                 </div>
            <div class="inputs">
             <form action="blast" method="post" onsubmit="return check1()">
             <%--<form action="blast" method="post">--%>
                <div class="left-panel">
                    <div style="height:10%;">
                        <div class="col-md-6 col-xs-6">
                        <div class="input-group input-lg"><!-- lv 7-11-10：01 change -->
                            <span class="input-group-addon">BLAST programe:</span><!-- lv 7-11-10：49 change -->
                            <select name="blastprograme" id="blastprograme1" class="form-control"  onchange="checkdata()">
                                <option value="blastn">blastn</option>
                                <option value="primer-blast">primer-blast</option>
                            </select>
                        </div>
                        </div>
                        <div class="col-md-6 col-xs-6">
                        <div class="input-group input-lg"><!-- lv 7-11-10：01 change -->
                            <span class="input-group-addon">Database:</span><!-- lv 7-11-10：49 change -->
                            <select  class="form-control" name="database" id="Database" > 
                                <option style="width:150px" value="HZS">HZS</option>
                                <option style="width:150px" value="V3.25">V3.25</option>
                                <option style="width:150px" value="V4">V4</option>
                            </select>
                        </div>
                        </div>
                    </div>
                    <div class="background" style="height:260px;padding:5px;padding-right:7%;clear:both"><!-- lv 7-11-10：01 change class=""->class="background" 180px->280px-->
                        <span style="padding-left:8px;display:inline-block;height:30px;line-height:30px;"><h4>Enter FASTA sequence</h4></span><!-- lv 7-11-10：49 change -->
                        <div class="btn example" onclick="showExample()" style="padding:2px 2px;font-size:15;width:80px;">example</div>
                        <div class="btn example" onclick="resetExample()" style="padding:2px 2px;font-size:15;width:80px;">reset</div>
                        <textarea style="resize:none" class="form-control" rows="8" name="inputtext" id="inputtext" type="text" onblur='javascript:$("#auto")'></textarea><!-- lv 7-11-10：49 change rows8->12-->
                    </div>
                    <div style="padding-top:5px;"><!-- lv 7-11-10：01 change class=""->class="background"-->
                        <span style="padding-left:8px;display:inline-block;height:30px;line-height:30px;margin-top:10px;"><h4>Or input file</h4></span><!-- lv 7-11-10：49 change -->
                        <input type="file"  type="text" onblur='javascript:$("#auto")' id="inputfile1" name="inputfile"/>
                    </div>
                </div>
				<div class="right-panel">
					<h4>Parameter selection</h4>
					<div class="col-md-8 col-xs-8">
						<div class="input-group input-lg">
							<span class="input-group-addon">Evalue:</span>
						<!-- lv 7-11 change 200->300 45->55 -->
						<input id="Eralue" class="form-control" type="text"
							name="inputeralue" 
							onblur='javascript:$("#auto")' value="0.00001" />
					</div>
					</div>
					<div class="col-md-8 col-xs-8">
						<div class="input-group input-lg">
							<span class="input-group-addon">Percent Identity:</span>
							<!-- lv 7-11 change 200->300 41->51 -->
							<input id="percent" type="text" class="form-control"
								name="inputpercent" 
								onblur='javascript:$("#auto")' value="5" />
						</div>
						</div>
						<div class="col-md-8 col-xs-8">
							<div class="input-group input-lg">
								<span class="input-group-addon">Max target seqences:</span>
								<!-- lv 7-11 change 200->300 41->51 -->
								<input id="maxtar" type="text" class="form-control"
									name="inputmaxtarget" 
									onblur='javascript:$("#auto")' value="50" />
							</div>
							</div>
						</div>
                <div class="btns">
                <button class="btn" id="next1">Submit</button></form>
                </div>
                
          		
                

            </div>
        </div>
    
    
    
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
