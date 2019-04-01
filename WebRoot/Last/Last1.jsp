<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    
    <div class="container" style="height:650px;">
            <div class="describe">
                <h4>TOOLS ONE</h4>
                <br/>
                <p>I need all the help I can get to look my best these days and if I can get that help while stuffing my face,you can be sure I'm adding the following beauty-full foods to my weekly shopping cart.</p>
            </div>
            <div class="inputs">
                <div class="left">
                    <div style="height:100px;">
                        <div class="" style="float:left;width:45%;margin:5px;">
                            <h4>Paaszas</h4>
                            <select name="" class="form-control">
                                <option value="">blastn2</option>
                                <option value="">blastn1</option>
                            </select>
                        </div>
                        <div class="" style="float:left;width:45%;margin:5px;">
                            <h4>Paaszas</h4>
                            <select name="" class="form-control">
                                <option value="">blastn2</option>
                                <option value="">blastn1</option>
                            </select>
                        </div>
                    </div>
                    <div class="" style="height:180px;padding:5px;padding-right:7%;">
                        <h4>Please ………………TOOLS ONEAA ：</h4>
                        <textarea class="form-control" rows="5"></textarea>
                    </div>
                    <div class="" style="padding-top:5px;">
                        <h4>Or load from desk：</h4>
                        <button class="btn">Load from desk</button>
                    </div>
                </div>
                <div class="right">
                    <h4>Parameter selection</h4>
                    <table class="table last-table">
                        <tr>
                            <td>Paaszas</td>
                            <td colspan="3">
                                <select name="" class="form-control">
                                    <option value="">blastn2</option>
                                    <option value="">blastn2</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Paaszas</td>
                            <td>
                                <select name="" class="form-control">
                                    <option value="">blastn2</option>
                                    <option value="">blastn2</option>
                                </select>
                            </td>
                            <td>Paaszas</td>
                            <td>
                                <input name="" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <td>Paaszas</td>
                            <td>
                                <select name="" class="form-control">
                                    <option value="">blastn2</option>
                                    <option value="">blastn2</option>
                                </select>
                            </td>
                            <td>Paaszas</td>
                            <td>
                                <input name="" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <td>Paaszas</td>
                            <td>
                                <select name="" class="form-control">
                                    <option value="">blastn2</option>
                                    <option value="">blastn2</option>
                                </select>
                            </td>
                            <td>Paaszas</td>
                            <td>
                                <input name="" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <td>Paaszas</td>
                            <td>
                                <select name="" class="form-control">
                                    <option value="">blastn2</option>
                                    <option value="">blastn2</option>
                                </select>
                            </td>
                            <td>Paaszas</td>
                            <td>
                                <input name="" class="form-control">
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="btn-part">
                    <button class="btn">Clear</button>
                    <button class="btn">Search</button>
                </div>
            </div>
        </div>
    
    
    
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
