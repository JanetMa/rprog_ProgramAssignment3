rankhospital<-function(state,outcome,num="best"){
  x<-read.csv("outcome-of-care-measures.csv",colClasses="character");
  for(i in c(11,17,23)){
    x[,i]<-suppressWarnings(as.numeric(x[,i]));
  }

  if(!is.element(state,unique(x$State))){
    stop("invalid state");
  }
  if(!is.element(outcome,c("heart attack","heart failure","pneumonia"))){
    stop("invalid outcome");
  }
  col<-switch(outcome,"heart attack"=11,"heart failure"=17, "pneumonia"=23)
  statedata<-subset(x,x[,7]==state)
  statedata<-statedata[!is.na(statedata[,col]),]
  if(num>nrow(statedata)){
    res=NA; return;
  }
  
  if(num=="best"){
    res=1;
  }
  if(num=="worst"){
    res=nrow(statedata);
  }
  if(is.numeric(num)){
    res=num;
  }
  
  
  statedata[,col]<-as.numeric(statedata[,col]);
  #statedata<-na.omit(statedata);
  statenames<-statedata[,][,2];
  sid<-order(statedata[,col],statenames);

  resnames<-statenames[sid];
  
  hospital<-resnames[res];
  hospital
  
}

