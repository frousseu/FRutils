kde2pol<-function(
	
	k,
	proj4string,
	levels=c(50,95),
	cut=TRUE
	
	){
	
	if(missing(prj)){
		stop("Missing \"prj\" argument")
	}
	co<-with(k,contourLines(x=eval.points[[1]],y=eval.points[[2]],z=estimate,levels=cont[paste0(levels,"%")]))
	val<-sapply(co,function(x){x$level})
	co<-lapply(unique(val),function(x){co[val==x]})
	poly<-lapply(co,function(j){
		poly<-lapply(j,function(i){
			x<-data.frame(i$x,i$y)
			x<-rbind(x,x[1,]) 
			x<-SpatialPolygons(list(Polygons(list(Polygon(x)),ID=1)))
		})
		poly<-lapply(seq_along(poly),function(i){
			spChFIDs(poly[[i]], as.character(i))
		})
		poly<-do.call("rbind",poly)
		proj4string(poly)<-CRS(prj)###############
		poly
	})
	if(cut && !is.projected(poly[[1]])){
		stop("When cut is TRUE, k needs to be projected")
	}
	for(i in rev(seq_along(poly))){
		if(i==1 | !cut){ #make sure a single polygon for each contour
			poly[[i]]<-gUnaryUnion(poly[[i]])
		}else{	
			poly[[i]]<-gSymdifference(poly[[i]],poly[[i-1]],byid=FALSE) # keep non overlapping parts
		}
		id<-paste0("k",gsub("%","",levels[i]))
		res<-SpatialPolygonsDataFrame(poly[[i]],data=data.frame(id=id,stringsAsFactors=FALSE),match.ID=FALSE)
		poly[[i]]<-spChFIDs(res,id) # give unique ID
		cat(length(poly)-i+1,"of",length(poly),"\n")
	}
	poly<-do.call("rbind",poly)
	poly
	
}