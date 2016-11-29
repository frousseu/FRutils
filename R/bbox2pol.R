bbox2pol<-function(
	
	x,
	ex=NULL,
	proj4string=""
	
){
	
	if(missing(x)){
		 bb<-matrix(par("usr"),ncol=2,byrow=TRUE)
		 prj<-proj4string
	}else{
		 if(inherits(x,"Spatial")){
			  bb<-bbox(x)
			  prj<-proj4string(x)
		 }else{
			  bb<-matrix(x,ncol=2,byrow=TRUE)
			  prj<-proj4string
		 }
	}
	
	
	if(!is.null(ex)){
		bb<-bb+matrix(c(-ex,ex,-ex,ex),nrow=2,byrow=TRUE)
	}
	m<-matrix(c(c(bb[1,1],bb[2,1]),c(bb[1,1],bb[2,2]),c(bb[1,2],bb[2,2]),c(bb[1,2],bb[2,1])),ncol=2,byrow=TRUE)
	rbind(m,m[1,]) %>% 
		Polygon %>% 
		list %>% 
		Polygons(ID=1) %>% 
		list %>% 
		SpatialPolygons ->
		ans
	
	proj4string(ans)<-prj
	
	ans
	
}