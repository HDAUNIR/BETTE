# -*- coding: utf-8 -*-
"""
Created on Wed Oct 25 07:49:01 2017

@author: jose
"""

import pandas as pd

import os

import networkx as nx
import matplotlib.pyplot as plt
from itertools import count
from scipy import stats

from decimal import Decimal

def visualise_networks(input_folder, name_files, columns_nodes, visualisations_folder, columns_edges = ["Source","Target",'Weight','Type']):
    i = 0
    characters = 0
    for name_file in name_files:
        print(name_file)
        file_edges = name_file + "_edges=textunits.csv"
        file_nodes = name_file + "_nodes=characters.csv"
        edges = pd.read_csv(input_folder+file_edges, encoding="utf-8", sep="\t")
        file_edges_name = os.path.splitext(file_edges)[0]
        entities_edges = sorted(list(set(edges["Target"].tolist() + edges["Source"].tolist())))
        nodes = pd.read_csv(input_folder+file_nodes, encoding="utf-8", sep="\t")

        wrong_entities = [entity for entity in entities_edges if entity not in nodes["id"].tolist() ]
        if wrong_entities:
            print("id erróneos: \n ===================\n", wrong_entities,"\n ===================\n")
        else:
            print("todos ids correctos!")
    
        nodes = nodes[nodes['id'].isin(entities_edges)]
        graph = nx.from_pandas_dataframe(df = edges, source = columns_edges[0], target = columns_edges[1], edge_attr = columns_edges[2:] )

    
        d = nx.degree(graph)
        betweenness_centrality = nx.betweenness_centrality(graph)
        eccentricity = nx.eccentricity(graph)
        closeness_centrality = nx.closeness_centrality(graph)
        load_centrality = nx.load_centrality(graph)
        current_flow_betweenness_centrality = nx.current_flow_betweenness_centrality(graph)
        eigenvector_centrality = nx.eigenvector_centrality(graph)
        approximate_current_flow_betweenness_centrality = nx.approximate_current_flow_betweenness_centrality(graph)
        communicability_centrality_exp = nx.communicability_centrality_exp(graph)
        
        attributes = ["label","sex","role","nature","importance"] 
        for attribute in attributes:

            nx.set_node_attributes(graph, attribute, {k:v for (k,v) in zip(nodes["id"], nodes[attribute])})

        nx.write_gexf(graph, path="networks/"+name_file+".gexf")
        nx.write_gml(graph, path="networks/"+name_file+".gml")
        nx.write_graphml(graph, path="networks/"+name_file+".graphml")

        attributes = ["position","pers_mes_characters","pers_mes_sps","pers_mes_rss","pers_mes_scenes"]
        for attribute in attributes:

            nx.set_node_attributes(graph, attribute, {k:v for (k,v) in zip(nodes["id"], nodes[attribute])})

        print("superado")
        metrics = ["degree","betweenness","eccentricity", 'closeness_centrality','load_centrality','current_flow_betweenness_centrality',"eigenvector_centrality"]
        nx.set_node_attributes(graph, 'degree', {k:v for (k,v) in d.items()})
        nx.set_node_attributes(graph, 'betweenness', {k:v for (k,v) in betweenness_centrality.items()})
        nx.set_node_attributes(graph, 'eccentricity', {k:v for (k,v) in eccentricity.items()})
        nx.set_node_attributes(graph, 'closeness_centrality', {k:v for (k,v) in closeness_centrality.items()})
        nx.set_node_attributes(graph, 'load_centrality', {k:v for (k,v) in load_centrality.items()})
        nx.set_node_attributes(graph, 'current_flow_betweenness_centrality', {k:v for (k,v) in current_flow_betweenness_centrality.items()})
        nx.set_node_attributes(graph, 'eigenvector_centrality', {k:v for (k,v) in eigenvector_centrality.items()})
        nx.set_node_attributes(graph, 'approximate_current_flow_betweenness_centrality', {k:v for (k,v) in approximate_current_flow_betweenness_centrality.items()})
        nx.set_node_attributes(graph, 'communicability_centrality_exp', {k:v for (k,v) in communicability_centrality_exp.items()})
    
        nx.set_node_attributes(graph, 'degree-vs', {k:(int(v)*100) for (k,v) in d.items()})

        labels = nx.get_node_attributes(graph,'label')
        
        groups = set(nx.get_node_attributes(graph,'sex').values())
        mapping = dict(zip(sorted(groups),count()))
        nodes = graph.nodes()
        colors = [mapping[graph.node[n]['sex']] for n in nodes]
        
        degree = [[graph.node[n]['degree-vs']] for n in nodes]
    
        print("cantidad nodos: ", len(graph.nodes()))
        

        plt.figure(figsize=((len(graph.nodes())/10)+10,(len(graph.nodes())/10)+10))
        plt.axis('off')
        pos = nx.spring_layout(graph, k = 0.9)
    
        widths = [w['Weight'] for (u, v, w) in graph.edges(data=True)]
        
        nx.draw_networkx(graph, pos, labels = labels, width = widths, font_size=15+(len(graph.nodes())/25), alpha=0.4, edge_color='#87CEFA', node_color=colors, cmap=plt.cm.RdYlBu, style= "solid", node_size = degree)
    
        plt.savefig(visualisations_folder+file_edges_name+'.png', dpi=300)

        attributes_df = pd.DataFrame([i[1] for i in graph.nodes(data=True)], index=[i[0] for i in graph.nodes(data=True)])
        
        attributes_df["importance-nr"] =  attributes_df["importance"]
        
        attributes_df.loc[attributes_df["importance-nr"]== "minor" ,["importance-nr"]] = 3
        attributes_df.loc[attributes_df["importance-nr"]== "secondary" ,["importance-nr"]] = 2
        attributes_df.loc[attributes_df["importance-nr"]== "primary" ,["importance-nr"]] = 1

        attributes_df["is_protagonist"] =  0
        attributes_df.loc[attributes_df["role"]== "protagonist" ,["is_protagonist"]] = 1

        attributes_df["is_lover"] =  0
        attributes_df.loc[attributes_df["role"]== "lover" ,["is_lover"]] = 1

        attributes_df["is_antagonist"] =  0
        attributes_df.loc[attributes_df["role"]== "antagonist" ,["is_antagonist"]] = 1

        attributes_df["is_primary"] =  0
        attributes_df.loc[attributes_df["importance-nr"]== 1 ,["is_primary"]] = 1

        attributes_df["is_minor"] =  0
        attributes_df.loc[attributes_df["importance-nr"]== 3 ,["is_minor"]] = 1

        attributes_df["antagonist"] =  0
        attributes_df.loc[attributes_df["role"]== "antagonist" ,["antagonist"]] = 1

        attributes_df["lover"] =  0
        attributes_df.loc[attributes_df["role"]== "lover" ,["lover"]] = 1
        
        total_characters = attributes_df.shape[0]
        print("total characters: ", total_characters)
        attributes_df["degree-rel"] =  attributes_df["degree"]/total_characters
        attributes_df["betweenness-rel"] =  attributes_df["betweenness"]/total_characters

        attributes_df["position-rel"] =  attributes_df["position"]/total_characters
        attributes_df["work"] =  name_file
        attributes_df["total_characters"] =  total_characters
        
        attributes_df.to_csv("data/"+name_file+"_attributes_nodes=characters.tsv", sep='\t', encoding='utf-8', index=True)
    

        if i == 0:
            attributes_total = attributes_df
        else:
            attributes_total = pd.concat([attributes_df, attributes_total])
        i += 1

        print(attributes_df.shape)
        characters = characters +total_characters

    print(attributes_total.shape)
    print(characters)
    print(i)
    attributes_total.to_csv("data/total_attributes_nodes=characters.tsv", sep='\t', encoding='utf-8', index=True)
    
    
    return graph, attributes_total




def test_correlation(attributes_total, ground_truths, variables):
    i = 1
    len(variables)/2
    for ground_truth in ground_truths:
        plt.figure(figsize=(15,15))

        for variable in variables:
            if variable == "position" or variable == "position-rel":
                attributes_total = attributes_total[attributes_total['position'] != 0]
            print(attributes_total.shape)
            print(variable)
            corr_spearmanr = stats.spearmanr(attributes_total[ground_truth], attributes_total[variable])
            corr_pearsonr = stats.pearsonr(attributes_total["importance-nr"], attributes_total[variable])
            if variable in ["eccentricity","importance-nr"]:
                test ="Spearman"
                print(test, corr_spearmanr)
                corr_r = corr_spearmanr
            else:
                test ="Pearson"
                print(test, corr_pearsonr)
                corr_r = corr_pearsonr
            plt.subplot(len(variables)/3,3,i)
            plt.scatter(attributes_total[ground_truth],attributes_total[variable])

            if ground_truth == "importance-nr":
                plt.xticks((1,2,3), ("primary","secondary","minor"))
            plt.ylabel(variable)
            plt.xlabel(ground_truth)
            plt.title(variable+"\n "+test+" = "+str(float(Decimal(corr_r[0]).quantize(Decimal('0.01')))) )
            plt.subplots_adjust(bottom=-6)
            plt.subplots_adjust(top=4)
            i += 1
        plt.tight_layout()
        plt.savefig("visualisations/corr_"+ground_truth+"_"+test+".png", dpi=300 )
        plt.show()


def test_values_role(attributes_total, ground_truths_roles, variables):
    i = 1
    for ground_truth_role in ground_truths_roles:
        plt.figure(figsize=(15,15))
        for variable in variables:
            if variable == "position" or variable == "position-rel":
                attributes_total = attributes_total[attributes_total['position'] != 0]
            chracteres_non_role = attributes_total.loc[attributes_total[ground_truth_role] == 1]
            chracteres_role = attributes_total.loc[attributes_total[ground_truth_role] == 0]
            print(variable)
            ttest = stats.ttest_ind(chracteres_non_role[variable],chracteres_role[variable])
            if ttest[1] < 0.001:
                pvalue = "p value < 0.001"
            else:
                pvalue = "p value > 0.001"
                
            plt.subplot(len(variables)/3,3,i)
            plt.boxplot([chracteres_role[variable], chracteres_non_role[variable]])
            print(ttest)
            plt.ylabel(variable)
            plt.xlabel(ground_truth_role)
            plt.xticks((1,2), ("False","True"))
            plt.title(variable)#+"\n "+pvalue) 
            plt.subplots_adjust(bottom=-1)
            plt.subplots_adjust(top=1)
            i += 1

    plt.tight_layout()
    plt.savefig("visualisations/boxplots_"+ground_truth_role+".png", dpi=300)
    plt.show()



            
def make_boxplot_importance(attributes_total, variables, test):
    i = 1
    plt.figure(figsize=(15,15))
    for variable in variables:
        if variable == "position" or variable == "position-rel":
            attributes_total = attributes_total[attributes_total['position'] != 0]
        chracteres_primary = attributes_total.loc[attributes_total["importance-nr"] == 1]
        chracteres_secondary = attributes_total.loc[attributes_total["importance-nr"] == 2]
        chracteres_minor = attributes_total.loc[attributes_total["importance-nr"] == 3]

        corr_spearmanr = stats.spearmanr(attributes_total["importance-nr"], attributes_total[variable])
        corr_pearsonr = stats.pearsonr(attributes_total["importance-nr"], attributes_total[variable])



        if test == "Spearman":
            print(test, corr_spearmanr)
            corr_r = corr_spearmanr
        elif test == "Pearson":
            print(test, corr_pearsonr)
            corr_r = corr_pearsonr
        else:
            print("Test no identificado")


        plt.subplot(len(variables)/3,3,i)
        plt.boxplot([chracteres_primary[variable], chracteres_secondary[variable], chracteres_minor[variable]])
        plt.ylabel(variable)
        plt.xlabel("Importance")
        plt.xticks((1,2,3), ("primary","secondary","minor"))
        plt.title("Boxplot of "+variable+"\n "+test+" = "+str(float(Decimal(corr_r[0]).quantize(Decimal('0.01')))) )
        plt.subplots_adjust(bottom=-1)
        plt.subplots_adjust(top=1)
        i += 1

    plt.tight_layout()
    plt.savefig("visualisations/boxplots_importance.png", dpi=300)
    plt.show()


