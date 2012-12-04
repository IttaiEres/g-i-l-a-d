require(gplots)

word.list = as.matrix(read.table("bingo_words.txt"))
nw = dim(word.list)[1]
numbers.m <- matrix (1,nrow=5, ncol=5)
for (i in 1:5){
    words.ind = sample(1:nw,24)
    words = c(word.list[words.ind[1:12],],"FDR",word.list[words.ind[13:24],])
    words.m = matrix(words,nrow=5,ncol=5)
    #Insert heatmap here
    png(paste("Bingo_Card_",i,".png", sep=""))   
    heatmap.2 (numbers.m, Rowv=NA, Colv=NA, col =colorRampPalette(c("white","white"))(5), scale="none", dendrogram="none", trace="none", density.info="none", key=F, cellnote=words.m, notecol="black", na.color="grey90",colsep=c(1,2,3,4,5), rowsep=c(1,2,3,4,5), sepcolor="black", sepwidth=c(0.02,0.02), labRow=F, labCol=F, main="GILAD LAB MEETING B-I-N-G-O")
    dev.off()
}



