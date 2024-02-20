
# Transcription factor analysis
docker run -it --rm -v /scenic/:/scenicdata aertslab/pyscenic_scanpy:0.12.1_1.9.1 \
pyscenic grn \
--num_workers 20 \
--seed 123 \
--output /scenicdata/sce_sample.tsv \
--method grnboost2 \
/scenicdata/sce_sample.loom \
/scenicdata/allTFs_hg38.txt


docker run -it --rm -v /scenic/:/scenicdata aertslab/pyscenic_scanpy:0.12.1_1.9.1 \
pyscenic ctx \
/scenicdata/sce_sample.tsv \
/scenicdata/hg38_10kbp_up_10kbp_down_full_tx_v10_clust.genes_vs_motifs.rankings.feather /scenicdata/hg38_500bp_up_100bp_down_full_tx_v10_clust.genes_vs_motifs.rankings.feather \
--annotations_fname /scenicdata/motifs-v10nr_clust-nr.hgnc-m0.001-o0.0.tbl \
--expression_mtx_fname /scenicdata/sce_sample.loom \
--mode "dask_multiprocessing" \
--output /scenicdata/reg.csv \
--num_workers 20 \
--mask_dropouts


docker run -it --rm -v /scenic/:/scenicdata aertslab/pyscenic_scanpy:0.12.1_1.9.1 \
pyscenic  aucell \
/scenicdata/sce_sample.loom \
/scenicdata/reg.csv \
--output /scenicdata/sce_sample_afterSCENIC.loom \
--num_workers 20


