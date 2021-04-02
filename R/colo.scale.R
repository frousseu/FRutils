colo.scale<-function(

	x,
	cols=c("white","yellow","tomato3","darkred"),
	center=FALSE,
	rescale01=FALSE,
	breaks=NULL

){
	
	w<-which(is.na(x))
	if(any(w)){
		y<-x[-w]
	}else{
		y<-x
	}
	
	re<-function(a){
		if(any(w)){
			ans<-rep(NA,length(x))
			ans[which(!is.na(x))]<-a
			ans
		}else{
			a
		}
	}
	
	if(!is.null(breaks)){
		stopifnot((length(cols)+1)==length(breaks))
		return(re(cols[as.numeric(cut(y,breaks=breaks))]))
	}
	
	if(length(y)==1){
		colop<-colorRampPalette(cols)
		return(re(colop(y)))
	}  
	if(class(y)=="character"){
		colop<-colorRampPalette(cols)
		color<-colop(length(unique(y)))
		return(re(color[match(y,unique(y))]))
	}else{  
		if(all(y>=0 & y<=1) && rescale01){
			color<-rgb(colorRamp(cols)(y),maxColorValue=256)
			return(re(color))
		}else{
			if(center){
				m<-which.max(c(abs(min(y)),max(y)))     
				sca<-0.5/ifelse(m==1,abs(min(y)),max(y))     
				xx<-sca*y+0.5
				color<-rgb(colorRamp(cols)(xx),maxColorValue=256) 
				return(re(color))
			}else{
				color<-rgb(colorRamp(cols)((y-min(y))/(max(y)-min(y))),maxColorValue=256) 
				return(re(color))
			}
		}
	}
	
}