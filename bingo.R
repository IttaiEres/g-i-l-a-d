require(gplots)

# Change file name at will: 
word.list = as.matrix(read.table("bingo_words_y.txt"))
word.list <- gsub("\\n", "\n", word.list, fixed=T)
nw = dim(word.list)[1]
numbers.m <- matrix (1,nrow=5, ncol=5)

# To control the number of cards printed, change the number in the loop. 
for (i in 1:5){
    words.ind = sample(1:nw,24)
    words = c(word.list[words.ind[1:12],],"FDR",word.list[words.ind[13:24],])
    words.m = matrix(words,nrow=5,ncol=5)
    #Insert heatmap here
    pdf(paste("Bingo_Card_",i,".pdf", sep=""))   
    heatmap.2 (numbers.m, Rowv=NA, Colv=NA, col =colorRampPalette(c("white","white"))(5), scale="none", dendrogram="none", trace="none", density.info="none", key=F, cellnote=words.m, notecol="black", na.color="grey90",colsep=c(1,2,3,4,5), rowsep=c(1,2,3,4,5), sepcolor="black", sepwidth=c(0.02,0.02), labRow=F, labCol=F, main="G-I-L-A-D", lwid=c(0.2,1), lhei=c(0.2,1))
    dev.off()
}
