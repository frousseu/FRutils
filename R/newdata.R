

newdata<-function(x,var,fun=mean,n=50){
  ans<-lapply(x,function(i){
    if(is.numeric(i)){
      fun(i,na.rm=FALSE)  
    }else{
      if(is.factor(i) | is.character(i)){
         factor(names(rev(sort(table(i))))[1],levels=levels(i))
      }else{
         NA  
      }
    }
  })
  m<-match(var,names(ans))
  if(is.numeric(ans[[m]])){
    ans[[m]]<-seq(min(x[[m]]),max(x[[m]]),length.out=n)
  }else{
    ans[[m]]<-sort(unique(x[,var]))
  }
  ans<-as.data.frame(ans,stringsAsFactors=FALSE)
  ans
}


