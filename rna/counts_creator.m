T = readtable('gene_expected_count_annot.csv');
missing_genes = setdiff(genes,T1.external_gene_name);
common_genes = intersect(genes,T.external_gene_name);
idx = ismember(genes,T.external_gene_name);
T = T(idx>0,:);
missing_genes = setdiff(T.external_gene_name,genes);
sample_36 = T(:,[3 5]);
[values, ~, ids] = unique(sample_36(:, [1]), 'rows');  %get unique id for rows with identical column 1 and 3
out = splitapply(@(rows) sum(rows, 1), sample_36, ids);  %sum rows with identical id

sample_36 = T(:,[1 2 3 4 31]);
sample_37 = T(:,[1 2 3 4 32]);
sample_78 = T(:,[1 2 3 4 69]);
sample_79 = T(:,[1 2 3 4 70]);
sample_81 = T(:,[1 2 3 4 73]);
sample_83 = T(:,[1 2 3 4 74]);

writetable(sample_36,'sample36.csv');
writetable(sample_37,'sample37.csv');
writetable(sample_78,'sample78.csv');
writetable(sample_79,'sample79.csv');
writetable(sample_81,'sample81.csv');
writetable(sample_83,'sample83.csv');
%%
sample36 = sample_36(:,[3 5]);
sample36 = renamevars(sample36,{'Sample_36'},{'Counts'});
%%
sample37 = sample_37(:,[3 5]);
sample37 = renamevars(sample37,{'Sample_37'},{'Counts'});
%%
sample78 = sample_78(:,[3 5]);
sample78 = renamevars(sample78,{'Sample_78'},{'Counts'});
%%
sample79 = sample_79(:,[3 5]);
sample79 = renamevars(sample79,{'Sample_79'},{'Counts'});
%%
sample81 = sample_81(:,[3 5]);
sample81 = renamevars(sample81,{'Sample_81'},{'Counts'});
%%
sample83 = sample_83(:,[3 5]);
sample83 = renamevars(sample83,{'Sample_83'},{'Counts'});

%%
writetable(sample36,'sample36_preprocessed.csv');
writetable(sample37,'sample37_preprocessed.csv');
writetable(sample78,'sample78_preprocessed.csv');
writetable(sample79,'sample79_preprocessed.csv');
writetable(sample81,'sample81_preprocessed.csv');
writetable(sample83,'sample83_preprocessed.csv');