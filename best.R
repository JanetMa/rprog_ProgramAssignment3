best<-function(state,outcome){
  ##Read outcome data
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
  statedata[,col]<-as.numeric(statedata[,col]);
  statedata<-na.omit(statedata);
  min_val<-min(statedata[,col])
  hospitals<-statedata[statedata[,col]==min_val,][,2]
  hospitals
    

}