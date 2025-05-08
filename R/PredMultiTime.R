#'
#' @title PredMultiTime
#'
#' @description Predict T2DM risk using data from multiple time points
#'
#' @param once0 Prediction model (model_multitime.Rdata)
#'
#' @param dt_valid Data for prediction, columns include subject ID (SUBJID),
#'  visit ID (VISTOID), group (Drug),
#'  disease status (Diabetes), survival time (SurMonth), Fasting blood glucose,
#'  2.0h postprandial blood glucose and BRI
#'
#' @importFrom fdapace FPCA
#' @importFrom dplyr arrange
#'
#' @return A vector, including C-Index, AUC and brier score.
#'
#' @examples
#' library(fdapace)
#' library(survivalSL)
#' library(dplyr)
#' load('model_multitime.Rdata')
#' load('Example_PredMultiTime.Rdata')
#' PredMultiTime(once0,dt_final2new)
#'
#' @export
#'
#'
PredMultiTime <- function(once0,dt_final2new){

  colnames(dt_final2new) <- c('SUBJID','VISTOID','Drug','SurMonth','Diabetes',
                              'lb_6.lborres1.空腹血糖 ','lb_6.lborres1.餐后2.0h血糖','BRI')

  dt_final2uni <- dt_final2new[,c('SUBJID','Drug','SurMonth','Diabetes')]
  dt_final2uni <- dt_final2uni[!duplicated(dt_final2uni),]

  dt_final2new <- arrange(dt_final2new, SUBJID, VISTOID)
  l1 <- unique(dt_final2new$SUBJID)
  sum(dt_final2uni$SUBJID==l1)

  chosevar <- c('BRI','lb_6.lborres1.空腹血糖','lb_6.lborres1.餐后2.0h血糖')

  fpca_scoreall <- NULL
  for(vvar1 in 1:length(chosevar)){

    vvar <- 5+vvar1
    once <- dt_final2new[,c(1,2,vvar)]
    once <- arrange(once, SUBJID, VISTOID)

    Ly <- list()
    Lt <- list()
    for(i in 1:length(l1)){
      ood <- once[once$SUBJID == l1[i],]
      Lt[[i]] <- ood[!duplicated(ood[,2]),2]
      Ly[[i]] <- ood[!duplicated(ood[,2]),3]

    }

    res_fpca <- FPCA(Ly, Lt, optns = list(methodSelectK='AIC'))
    fpca_score <- predict(res_fpca,Ly,Lt)$scores
    fpca_score <- fpca_score[,1]

    fpca_scoreall <- cbind(fpca_scoreall,fpca_score)
  }
  colnames(fpca_scoreall) <- paste0(chosevar,'_1')
  dt_final2uni <- cbind(dt_final2uni,fpca_scoreall)
  dt_final2uni <- as.data.frame(dt_final2uni)

  res2 <- summary(once0$slres,newdata=dt_final2uni)

  return(res2)
}




