# T2DMPred
Dynamic prediction model: Predict T2DM risk using data from one/multiple time points


***Toy Example***  
`library(randomForestSRC)`  

`## Optimal dynamic prediction model with one timepoint`  
`load("OneTimeModel.Rdata")`  
`load("Example_OneTime.Rdata")`  
`res2 <- predict(slres,newdata)`  
`res2$predictions$sl`  
`res2$times`  

`## Optimal dynamic prediction model with multiple timepoints`  
`load("MultiTimeModel.Rdata")`  
`load("Example_MultiTime.Rdata")`  
`res2 <- predict(slres,newdata)`  
`res2$predictions$sl`  
`res2$times`  

Please contact houlei@bicmr.pku.edu.cn for any questions.
