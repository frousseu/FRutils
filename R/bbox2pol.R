bbox2pol<-function(
	
	x,
	ex=NULL
	
){
	
	bb<-bbox(x)
	if(!is.null(ex)){
		bb<-bb+matrix(c(-ex,ex,-ex,ex),nrow=2,byrow=TRUE)
	}
	m<-matrix(c(c(bb[1,1],bb[2,1]),c(bb[1,1],bb[2,2]),c(bb[1,2],bb[2,2]),c(bb[1,2],bb[2,1])),ncol=2,byrow=TRUE)
	rbind(m,m[1,]) %>% 
		Polygon %>% 
		list %>% 
		Polygons(ID=1) %>% 
		list %>% 
		SpatialPolygons(proj4string=CRS(proj4string(x)))
	
}