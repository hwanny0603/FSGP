raw <- read.delim("/storage/home/sehwanahn/FSGP/L1000_phase2/GSE70138_Broad_LINCS_sig_info_2017-03-06.txt",sep="\t",header=T,stringsAsFactors=F)
cells <- read.delim("/storage/home/sehwanahn/FSGP/research_phase2/etc/cell_id.txt",sep="\t",header=,F,stringsAsFactors=F)
perts <- read.delim("/storage/home/sehwanahn/FSGP/research_phase2/etc/activator.txt",sep="\t",header=F,stringsAsFactors=F)

raw <- subset(raw,pert_type=="trt_cp")

idx <- which(raw$pert_iname %in% perts$V2 & raw$cell_id %in% cells$V1)
raw <- raw[idx,]
write.table(raw,"/storage/home/sehwanahn/FSGP/research_phase2/etc/sig_ids_from_pert_name.txt",sep="\t",row.names=F,quote=F)


quit("no")
