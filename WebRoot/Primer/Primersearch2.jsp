<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>General Primer Design</title>
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
        var database_example = 
'TTGAGAGTTCTAATAAGAGCAACGGCCAATACCATTAGCGAGTTATTTTTCTGCAATATATGTCAGCAAC'+
'CGATCATTTGGTTATGGCTCGTGTCATACAGGATGTATTGGATCCCTTTACACCAACCATTCCACTAAGA'+
'ATAACGTACAACAATAGGCTACTTCTGCCAAGTGCTGAGCTAAAGCCATCCGCGGTTGTAAGTAAACCAC'+
'GAGTCGATATCGGTGGCAGTGACATGAGGGCTTTCTACACCCTGGTAAGCCAAGCAATTTACAGATAATG'+
'ATACCATTTTGGAGAATTTATGCCAATTCATTTGGTATGTTACACATAAAAGTATTATGCACTTTGTAAT'+
'GGATTTATCAATATTAGTTTGAACAAATTTAATAAGAACAAAATGCCTAAATCTTGCAGTATATAAACAT'+
'GTATATATGCTAACTTGTTTGTCTTCGACTTGAAAAGGTACTGATTGACCCGGATGCCCCAAGTCCAAGC'+
'CATCCATCACTAAGGGAGTACTTGCACTGGTAAAAAAAGCGCAATATGTTCCACTTCCTAGATTTGGTTC'+
'TTTTTCGCTTTGCCTTATTATGATATTGGTCCACTATTGTGTAGGATGGTGACAGATATTCCAGAAACAA'+
'CTAGTGTCAACTTTGGTAAGAATGCATATAGTTATCTGTCATTCCATTGTGTTTCTGCTGAATATAGTAT'+
'CTGTGGAGCTTAGGTTGTAGTCTCTTCTTGCTTCTCAGACCTATTGGCTACCATTGAACTGATGCAGATA'+
'AGGATGCAATTAATACATGAAATCAGCAACCATAGGCTGAATGCTAGACCAACTTGTTAGGTGAATGCAA'+
'TATGGCAGCTTACCGCTTACATGCATAGTAATATCATGAAATCCACTAACTTAGTACCATAACTAAAGAA'+
'GCAATCTGGTAGAACTCACTTTCAATCCAGCCCATTACTAGAGACTGGATTATCGATATTAAACACAAAC'+
'AAGTATTTAACAGTGTAATAAACTGGTATACGTATGATTCACAGTGCCCCTGTTTGTTCTTTAATTGGTT'+
'GGTAACCTTGAGGTGTCAATTTCAGCAGAACTAAGGTTCATTTACAGTTGCCATACTAAAGTTACTCAAG'+
'TACACTTTTTAGTTTACATAGTTTTTTCATACTCGATTTTACCTGAGACTTTGAAACCGATATTGGAAAC'+
'AAAGCAGCCATTAATTTTGTCAAACAAGAGGAGCTATATTTAAAGGCTTCTCTTTGTCTAAATTGAAAGA'+
'ATTAAAAACAATAAATGACGACGCTTCCACATACTTCAGTGCTCCTTGAACTATTCAGTATATAATGTCA'+
'GGATGCTCTCGCAGGCCAAGAGCTAATATTTTATGAGAGGCCGGACCCAAGATCTGGCATCCACAGGCTG'+
'GTATTTGTGCTGTTCCGTCAACTTGGCAGGGGGACAGTTTTTGCACCAGAAATGCGCCACAACTTCAACT'+
'GCAGAAGCTTTGCACGGCAATATCACCTCAGCATTGCCACCGCTACATATTTCAACTGTCAAAGGGAAGG'+
'TGGATCCGGCGGAAGAAGGTTTAGGGAAGAGTAGAAACCATAGGCCACTGCATGGTCACACTATAGAAAT'+
'ATCATCAATAATGTGCACTATATTGAATCAATGCACCACCTCTATATGCTGAATGTTATGTATCTCAAAC'+
'TATGATTGTACTGACTTGAAAGGTTGAGAGCTTAGTCTCTTAGCAGAATATAGCACAATATTACTAGTA';
        function showExample(){
            $('#inputtext').val(database_example);
        }

        function resetExample(){
            $('#inputtext').val("");
        }
    </script>
	
</head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    
    <div class="container" style="height:900px;">
            <div class="describe">
                <h3>General Primer Design</h3><!-- lv 7-11 change h4->h3 -->
                <span class="input-group">You can input your sequences directly to pick PCR-primers or develop molecular markers. Here we use Primer3 as a backend engine.</span>
             
           
            </div>
          
                        <div class="btn example" onclick="showExample()" style="padding:2px 2px;font-size:15;width:80px;">example</div>
                        <div class="btn example" onclick="resetExample()" style="padding:2px 2px;font-size:15;width:80px;">reset</div>
               
             <form action="primer2" method="post">
                
				  <div class="inputs" style="height: 150px;margin-top:0px;">
            		<div  style="height:300px;padding:5px;">
                        <textarea class="form-control" rows="9" name="inputtex" id="inputtext"  style="resize:none; height: 250px"></textarea>
<!--                         <div class="" style="float:left;width:30%;margin:5px;">
                    	
                    </div> -->
           		 </div>
                          
           		
                <div class="leftp2" style="height: 350px;">
                                <h3>Parameter Selection</h3><!-- lv 7-11 change 套用的primersearch2 -->
                                <div class="col-md-4 col-xs-4">
                                    <div class="input-group input-lg">
                            <span class="input-group-addon">Optimal primer size:</span><input class="form-control" type="text" name="opsize" id="opsize1" value="20"/>
                      	</div>
                                </div>
                                <div class="col-md-4 col-xs-4">
                                    <div class="input-group input-lg">
                            <span class="input-group-addon">Max primer size:</span><input class="form-control" type="text" name="maxsize" id="maxsize1" value="27"/>
                    	</div>
                                </div>
                                <div class="col-md-4 col-xs-4">
                                    <div class="input-group input-lg">
                            <span class="input-group-addon">Min primer size:</span><input class="form-control" type="text" name="minsize" id="maxsize1" value="18"/>
                                    </div>
                                </div>
                        <div class="col-md-4 col-xs-4">
                            <div class="input-group input-lg">
                            <span class="input-group-addon">Optimal primer TM:</span><input class="form-control" class="form-control" type="text" name="opttm" id="opttm1" value="60.0"/>
                        </div>
                        </div>
                        <div class="col-md-4 col-xs-4">
                            <div class="input-group input-lg">
                            <span class="input-group-addon">Max primer TM:</span><input class="form-control" type="text" name="maxtm" id="maxtm1" value="63.0"/>
                    	</div>
                        </div>
                        <div class="col-md-4 col-xs-4">
                            <div class="input-group input-lg">
                            <span class="input-group-addon">Min primer TM:</span><input class="form-control" type="text" name="mintm" id="mintm1" value="57.0"/>
                            </div>
                        </div>
                        <div class="col-md-4 col-xs-4">
                            <div class="input-group input-lg">
                            <span class="input-group-addon">Optimal GC percent:</span><input class="form-control" type="text" name="optgc" id="optgc1" value="50.0"/>
                            </div>
                        </div><div class="col-md-4 col-xs-4">
                            <div class="input-group input-lg">
                            <span class="input-group-addon">Max GC percent:</span><input class="form-control" type="text" name="maxgc" id="maxgc1" value="80.0"/>
                    	</div>
                        </div>
                        <div class="col-md-4 col-xs-4">
                            <div class="input-group input-lg">
                            <span class="input-group-addon">Min GC percent:</span><input class="form-control" type="text" name="mingc" id="mingc1" value="20.0"/>
                            </div>
                        </div>
                        
                        <div class="col-md-4 col-xs-4">
                            <div class="input-group input-lg">
                            <span class="input-group-addon">Default product:</span><input class="form-control" type="text" name="defaultproduct" id="defaultproduct" value="100-300"/>
                      	</div>
                        </div>
                        <div class="col-md-4 col-xs-4">
                            <div class="input-group input-lg">
                            <span class="input-group-addon">Max Poly-X:</span><input class="form-control" type="text" name="maxployx" id="maxployx1" value="5"/>
                    	</div>
                        </div>
                        <div class="col-md-4 col-xs-4">
                            <div class="input-group input-lg">
                            <span class="input-group-addon">Max Self Any:</span><input class="form-control" type="text" name="selfany" id="selfany1" value="8"/>
                            </div>
                        </div>
                        
                </div>
            </div>
						<div class="col-md-2 col-md-offset-5">
							<!-- lv 7-11 change new -->
							<button class="btn" id="next1">Submit</button>
						</div>
                </form>
                
        </div>
    
    
    
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
