clear all
clc
close all
%% Load the Data in
gene_counts = readtable('gene_count_matrix_sample_37.csv');
gene_positions = readtable('Sample37_with_GeneLength.csv');
%
%% Take only the unique
[C,IA,IC] = unique(gene_counts.Group_1);
gene_counts = gene_counts(IA,:);
[C,IA,IC] = unique(gene_positions.external_gene_name);
gene_positions = gene_positions(IA,:);

%% Extract the Columns needed from the data
gene_counts = gene_counts(:,[2 3]);
gene_positions = gene_positions(:,[4 5]);
gene_positions = renamevars(gene_positions,{'V4'},{'Gene_Length'});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sort the data
gene_counts = sortrows(gene_counts(:,:));
gene_positions = sortrows(gene_positions(:,:));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Index the data
idx = ismember(gene_counts.Group_1,gene_positions.external_gene_name);

gene_counts = gene_counts(idx>0,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
idx = ismember(gene_counts.Group_1,gene_positions.external_gene_name);
gene_positions = gene_positions(idx>0,:);

gene_counts = sortrows(gene_counts);
gene_positions = sortrows(gene_positions);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gene_counts = gene_counts(:,2);
gene_counts = renamevars(gene_counts,{'x'},{'Gene_Counts'});
gene_counts = table2cell(gene_counts);
gene_positions.Counts = gene_counts;

%% Find Intersect between RNA-Seq and Biomart
addpath E:\_iReprogramApps\DGC\data_lite
load('Fibroblast.mat');
genes = Fibroblast.Properties.RowNames;
[C,H,IB] = intersect(gene_positions.external_gene_name,genes);
idx = ismember(genes,gene_positions.external_gene_name);
gene = genes(idx>0,:);
%% Find missing Genes
missing_genes = setdiff(genes,gene_positions.external_gene_name);
missing_genes = genes(idx==0,:);

idx = ismember(gene_positions.external_gene_name,gene);
gene_common = gene_positions(idx>0,:);

writecell(missing_genes,'missing_genes_sample37');


writetable(gene_common,'Sample37_genecount_matrix_length.csv');
