import xml.etree.ElementTree as ET
import argparse
from bokeh.core.properties import value
from bokeh.resources import Resources
from bokeh.models import OpenURL, TapTool, CustomJS
import os
import sys
from bokeh.plotting import figure
from bokeh.io import save, output_file, show
from bokeh.io.state import State
from bokeh.embed import components
from bokeh.layouts import gridplot
import numpy as np
import pandas as pd
import pymysql as mysql
import math
from urllib import parse

def getTracks(c, start, end):
    f = int(start / 100000)
    to = int((end / 100000) + 1)
    chr = c
    res = chr + "_" + str(f * 100000) + "_" + str((f + 1) * 100000)
    for i in range(f + 1, to):
        res = res + "," + chr + "_" + str(i * 100000) + "_" + str((i + 1) * 100000)
    return res

color_dict = {"CW": "#FF0000", "ED": "#87CEEB", "EL": "#6B8E23", "ELW": "#71C671", "KNPR": "#FF1493", "KWPE": "#7A7A7A", "LBT": "#218868", "PH": "#FFFF00", "LNAE": "#C7C7C7",
        "DTA":"#6A5ACD","DTS":"#DC143C","DTT":"#9400D3","EH":"#F08080","ELL":"#7FFF00","ERN":"#B03060","EW":"#00FF7F","LNBE":"#0000AA","TBN":"#191970","TL":"#228B22"
         ,"KNPE":"#DEB887",
              }

# to add new column, just add here
column_dict = {
    'chr':1,
    'pos':2,
    'trait':3,
    'snp':4,
    'p':5,
    'annotation':6
}

my_dict = {'x':[],
           'y':[],
           'color':[]}

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='draw graph')
    parser.add_argument('start', type=int, help='the start of the region')
    parser.add_argument('end', type=int, help='the end of the region')
    parser.add_argument('chr', type=str, help='the chr name')
    parser.add_argument('trait', type=str, help='all the traits')
    # parser.add_argument('path', type=str, help='the output path of the html file')
    args = parser.parse_args()
    start = str(args.start)
    end = str(args.end)
    chr = args.chr
    trait = args.trait
    # path = str(args.path)
    # print(path)
    db = mysql.connect("localhost", "root", "nick35789624", "magic")
    cursor = db.cursor()
    # cursor.execute("select * from magic_all_sig_snp where pos BETWEEN "
    #                + start + " and " + end)
    # cursor.execute("select * from magic_all_sig_snp , sig_snp_annotation "
    #               + "where magic_all_sig_snp.id = ")
    sql = "select magic_all_sig_snp.* , sig_snp_annotation.annotation " \
          + " from magic_all_sig_snp , sig_snp_annotation " \
          +" where magic_all_sig_snp.id = sig_snp_annotation.id " \
          + " and pos between " + start + " and " + end \
          + " and chr = " + chr + " and ( " + trait + "')"
    cursor.execute(sql
    )
    print(sql)
    data = cursor.fetchall()
    start = int(start)
    end = int(end)
    print(len(data))
    if len(data) != 0:
        length = len(data)
        minp = 10000;
        maxp = -10000;
        # fromkey will make all the keys point to a object
        for k in column_dict.keys():
            my_dict.update({k:[]})
        print(my_dict)
        for i in range(length):
            my_dict['x'].append(int(data[i][column_dict['pos']]))
            try:
                tmp = - math.log10(float(data[i][column_dict['p']]))
            except Exception as e:
                print("p value is " , float(data[i][column_dict['p']]))
            my_dict['y'].append(tmp)
            my_dict['color'].append(color_dict[data[i][column_dict['trait']]])
            if tmp > maxp:
                maxp = tmp
            if tmp < minp:
                minp = tmp
            for k in column_dict.keys():
                if k == 'chr':
                    my_dict[k].append('chr' + str(data[i][column_dict[k]]))
                else:
                    my_dict[k].append(data[i][column_dict[k]])

        # my_dict.update({'chrn':[], 's':[], 'e':[], 'ps':[], 'pe':[]})
        my_dict.update({'param':[]})
        for i in range(length):
            # s = "1%3A123..1231412&tracks=chr1_67195493_67197493%2CDNA&highlight="
            s = "http://modem.hzau.edu.cn/Magic/JBrowse/jbrowse.jsp?"
            urldict = {}
            urldict['loc'] = data[i][column_dict['chr']] + ":" + str(start) + ".." + str(end)
            snp = data[i][column_dict['snp']]
            snp = snp[snp.find('_') + 1:]
            urldict['tracks'] = getTracks(my_dict['chr'][i], int(snp), int(snp)) + ",GFF3,DNA"
            # s = s + "%3A";
            # s  = s + str(start)
            # s = s + ".."
            # s = s + str(end)
            # s = s + "%26tracks="
            # # s = s + my_dict['chr'][i]
            # # s = s + '_'
            # # s = s + str(int(snp) - 1000)
            # # s = s + '_'
            # # s = s + str(int(snp) + 1000)
            # s = s + getTracks(my_dict['chr'][i], int(snp), int(snp))
            # s = s + "%2CGFF3%2CDNA%26highlight="
            s = s + parse.urlencode(urldict)
            my_dict['param'].append(s)
            # print("param:" , s)
        # print(s)
        my_dict.update({'label':[]})
        for i in range(length):
            my_dict['label'].append(my_dict['trait'][i])

        tooltips = []
        for k in column_dict.keys():
            tooltips.append((k, '@' + k))

        radius = (end - start ) / 400
        vertical = (maxp - minp) / 200
        TOOLS = "crosshair, pan, wheel_zoom, box_zoom, reset, box_select, lasso_select, hover, tap"
        p = figure(tools=TOOLS, x_range=(start - radius * 5, end + radius * 50),
                y_range=(minp - vertical * 5, maxp + vertical * 5),tooltips=tooltips,
                    x_axis_label='pos', y_axis_label='-log(p)', plot_width=1100,plot_height=500)
        p.circle(x='x', y='y', fill_color='color',line_color='color', source=my_dict, size=10, legend='label')
        taptool = p.select(type=TapTool)
        # taptool.callback = OpenURL(url = "http://localhost:8080/Magic/JBrowse/jbrowse.jsp?loc=1%3A123..1231412&tracks=chr1_67195493_67197493%2CDNA&highlight=");
        taptool.callback = OpenURL(url = "@param");
        # my_dict.update({'start':start,'end':end})
        # taptool.callback = CustomJS(args=dict(source=my_dict),code="""
        #     var data = source.data;
        #     var s = data['start'];
        #     var e = data['end'];
        #     var c = data['chr'];
        #     var snp = data['snp'];
        #     alert(snp + s + e + c);
        #     var chrn = c.substring(2);
        #     var p = parseInt(snp.substring(snp.indexOf("_") + 1));
        #     windown.location.href ="http://localhost:8080/Magic/JBrowse/jbrowse.jsp?loc=" + chrn + "%3A" + start + ".." + end + "&tracks=" + chr + "_" + (p - 1000) + "_" + (p + 1000) + "%2CDNA&highlight=";
        #     """)
        # print(save(gridplot((p,), plot_width=1400,plot_height=600), resources=output_file("chrome.html" , "chrome", mode="relative", root_dir=path)))
        output_file("chrome.html" , "chrome")
        save_path = save(p)
        print(save_path)
        # show(p)
        # http://localhost:8080/Magic/JBrowse/jbrowse.jsp?loc=1%3A123..1231412&tracks=chr1_67195493_67197493%2CDNA&highlight=
        # html = open(save_path)
        # print(path + "chrome.html")
        # f = open(path + "chrome.html", 'w')
        # print(html.read())
        # line = html.readline()
        # while len(line) > 0:
        #     f.write(f)
        #     line = html.readline()
        #
        # f.write(html.read())
        # f.close()
        # html.close()
