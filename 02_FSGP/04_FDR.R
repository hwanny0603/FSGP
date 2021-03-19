null <- "[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]"
path <- "/mnt/QNAP/sehwanahn/activator_permutation/"

raw <- read.delim("/storage/home/sehwanahn/FSGP/research/result/only_pattern.txt",sep="\t",header=F,stringsAsFactors=F)
final <- c("gene","distance","FSGP","n","count","p_value")

for(i in c(1:dim(raw))){
    gene <- raw[i,1]
    distance <- raw[i,2]
    FSGP <- raw[i,3]
    n <- raw[i,4]
    
    tmp <- read.delim(paste0(path,"n_",n,".txt"),sep="\t",header=F,stringsAsFactors=F)
    tmp <- subset(tmp,V2!=null)
    count <- 0

    if(dim(tmp)[1]>0){
        idx <- which(tmp$V1 <= distance)
        count <- length(idx)
    }
    final <- rbind(final,c(gene,distance,FSGP,n,count,count/10000))

}
final <- as.data.frame(final,stringsAsFactors=F)
colnames(final) <- final[1,]
final <- final[-1,]

fdr <- p.adjust(final$p_value,"BH")
final$FDR <- fdr

bonfer <- p.adjust(final$p_value,"bonferroni")
final$bonferroni <- bonfer

write.table(final,"/storage/home/sehwanahn/FSGP/research/result/FDR.txt",sep="\t",row.names=F,quote=F)
quit("no")
