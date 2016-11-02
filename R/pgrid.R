




pgrid<-function(n=10,cex=0.5){
	usr<-par("usr")
 x<-seq(usr[1],usr[2],length.out=n)
 y<-seq(usr[3],usr[4],length.out=n)
 d<-expand.grid(x,y)
 points(d[,1],d[,2],cex=0.1)
 text(d[,1],d[,2],labels=paste0(paste0("x",format(d[,1],digits=2,nsmall=0,scientific=FALSE)),"\n",paste0("y",format(d[,2],digits=2,nsmall=0,scientific=FALSE))),cex=cex,adj=c(0,-0.5))
}









