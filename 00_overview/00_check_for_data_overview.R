raw <- read.delim("/storage/home/sehwanahn/FSGP/L1000_phase1/GSE92742_Broad_LINCS_sig_info.txt",sep="\t",header=T,stringsAsFactors=F)
raw <- subset(raw,pert_type=="trt_cp")

pert_ids <- sort(unique(raw$pert_id))
pert_iname <- sort(unique(raw$pert_iname))

cell_ids <- sort(unique(raw$cell_id))
doses <- sort(unique(raw$pert_idose))
times <- sort(unique(raw$pert_itime))

final <- vector()

for(cell in cell_ids){
	tmp <- vector()
	for(pert in pert_ids){
		sub <- subset(raw,cell_id==cell & pert_id==pert)
		tmp <- c(tmp,dim(sub)[1])
	}
	final <- rbind(final,c(cell,tmp))
}
colnames(final) <- c("cell",pert_ids)
write.table(final,"/storage/home/sehwanahn/FSGP/research/data/overview.txt",sep="\t",row.names=F,quote=F)
