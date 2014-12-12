
testbest<-function()
{
  source("rankall.R");
#   print(best("TX","heart attack"));
#   print(best("TX","heart failure"));
#   print(best("MD","heart attack"));
#   print(best("MD","pneumonia"));
#   print(best("BB","heart attack"));
#   print(best("NY","hrt attack"));
#   

  print(head(rankall("heart attack",20),10));
  print(tail(rankall("pneumonia","worst"),3));
  print(tail(rankall("heart failure"),10));





}
