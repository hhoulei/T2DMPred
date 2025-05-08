#'
#' @title PredOneTime
#'
#' @description Predict T2DM risk using data from one time point
#'
#' @param once0 Prediction model (model_onetime.Rdata)
#'
#' @param dt_valid Data for prediction, columns include subject ID (SUBJID), group (Drug),
#'  disease status (Diabetes), survival time (SurMonth), Fasting blood glucose,
#'  2.0h postprandial blood glucose and triglyceride.
#'
#'
#' @return A vector, including C-Index, AUC and brier score.
#'
#' @examples
#' library(survivalSL)
#' load('model_onetime.Rdata')
#' load('Example_PredOneTime.Rdata')
#' PredOneTime(once0,dt_valid)
#'
#' @export
#'

PredOneTime <- function(once0,dt_valid){

  colnames(dt_valid) <- c('SUBJID',
                          'Drug',
                          'Diabetes',
                          'SurMonth',
                          'lb_6.lborres1.空腹血糖',
                          'lb_6.lborres1.餐后2.0h血糖',
                          'lb_9.lborres1.甘油三酯')

  #res2 <- summary(once0$slres,newdata=once0$dt_final4_test)

  res3 <- summary(once0$slres,newdata=dt_valid)

  return(res3)
}







