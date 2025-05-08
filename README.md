# T2DMPred
Dynamic prediction model: Predict T2DM risk using data from one/multiple time point

***Installation***  
`devtools::install_github("hhoulei/T2DMPred")`  

***Toy Example***  
`library(T2DMPred)` 

`library(survivalSL)`  
`load('model_onetime.Rdata')`  
`load('Example_PredOneTime.Rdata')`  
`PredOneTime(once0,dt_valid)`  

`library(fdapace)`  
`library(survivalSL)`  
`library(dplyr)`  
`load('model_multitime.Rdata')`  
`load('Example_PredMultiTime.Rdata')`  
`PredMultiTime(once0,dt_final2new)`  
`# you can use your own dataset instead of Example_PredOneTime.Rdata or Example_PredMultiTime.Rdata to predict the T2DM risk`  

Please contact houlei@bicmr.pku.edu.cn for any questions. We will continue to update this R package and reduce the problems that may be encountered during its installation.
