


library(randomForestSRC)

## Optimal dynamic prediction model with one timepoint
load("OneTimeModel.Rdata")
load("Example_OneTime.Rdata")
res2 <- predict(slres,newdata)
res2$predictions$sl
res2$times

## Optimal dynamic prediction model with multiple timepoints
load("MultiTimeModel.Rdata")
load("Example_MultiTime.Rdata")
res2 <- predict(slres,newdata)
res2$predictions$sl
res2$times