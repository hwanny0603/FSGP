raw <- read.delim("/storage/home/sehwanahn/FSGP/research/result/FSGP.txt",sep="\t",header=F,stringsAsFactors=F)

sub <- subset(raw,V3!="[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]")
write.table(sub,"/storage/home/sehwanahn/FSGP/research/result/only_pattern.txt",sep="\t",row.names=F,col.names=F,quote=F)
quit("no")
