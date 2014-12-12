rankall<-function(outcome, num="best"){
  
  x<-read.csv("outcome-of-care-measures.csv",colClasses="character");
  for(i in c(11,17,23)){
    x[,i]<-suppressWarnings(as.numeric(x[,i]));
  }
    
  if(!is.element(outcome,c("heart attack","heart failure","pneumonia"))){
    stop("invalid outcome");
  }
  col<-switch(outcome,"heart attack"=11,"heart failure"=17, "pneumonia"=23);
  
  states<-unique(x$State);
  states<-states[order(states)];
  for(i in 1:length(states)){
    statedata<-subset(x,x[,7]==states[i]);
    statedata<-statedata[!is.na(statedata[,col]),]
    statedata[,col]<-as.numeric(statedata[,col]);
    #statedata<-na.omit(statedata);
    statenames<-statedata[,][,2];
    sid<-order(statedata[,col],statenames);
    resnames<-statenames[sid];
    
    if(num>nrow(statedata)){
      res=NA;
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
    
    if(i==1){
      if(is.na(res)){
       dataframe<-data.frame(hospital="<NA>",state=states[i]); 
      }
      else{
      dataframe<-data.frame(hospital=resnames[res],state=states[i]);
      }
    }
    if(i>1){
      if(is.na(res)){
        dataframe<-rbind(dataframe,data.frame(hospital="<NA>",state=sates[i]));
      }
      else{
      dataframe<-rbind(dataframe,data.frame(hospital=resnames[res],state=states[i]));
      }
    }
  
  }
  
  dataframe
  
}

