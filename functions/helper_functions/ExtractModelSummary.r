ExtractModelSummary <- function(dat, var1, var2 = NULL) {
    # This function has the purpose to extract the important parameters from the
    # model(s). If var2 is given, it means that there is the need to make the
    # model run on the same variable grouped by different rows.
    # 
    # ARGS
    # - dat   [data table] is the data we are giving to the model
    # - var1  [character]  is the column name of the variable we want to put
    #                      in the model in correlation to log(avgGDPpc)
    # - var2  [character]  is the column name of the variable that we want to
    #                      group by. Default is NULL and means that only one
    #                      model is produced
    # RETURN
    # - dt    [data table] a data table with the statistical values of interest.
    #                      If var2 is not NULL, the number of rows of this data 
    #                      table is the same number as the unique values in the
    #                      column given by var2
    
    if (!is.null(var2)) {
        mod <- dlply(dat, var2, function(dt) 
            lm(log(avgGDPpc) ~ eval(as.name(var1)), data = dt))
        dt <- data.table(formula     = character(), 
                         correlation = character(), 
                         r2          = double(), 
                         pvalue      = character(), 
                         preference  = character())
        # For each model, save a data table containing the statistical values
        # of interest
        for (i in 1:length(mod)) {
            # Reassign the correct name of the variable
            names(mod[[i]]$coefficients)[2] <- var1
            formula <- sprintf("y == %.2f % +.2f * x",
                               round(coef(mod[[i]])[1], 5), 
                               round(coef(mod[[i]])[2], 5))
            r <- cor(x = log(dat[eval(as.name(var2)) == names(mod)[i], 
                                 avgGDPpc]), 
                     y = dat[eval(as.name(var2)) == names(mod)[i], 
                             eval(as.name(var1))])
            correlation <- sprintf("correlation = %.5f", r)
            r2 <- sprintf("R^2 = %.5f", r^2)
            p_value <- summary(mod[[i]])$coefficients[,"Pr(>|t|)"][2]
            pvalue <- ifelse(p_value < 0.0001, 
                             "p < 0.0001", 
                             sprintf("p = %.4f", p_value))
            # Save the data
            dt_tmp <- data.table(formula     = formula, 
                                 correlation = correlation, 
                                 r2          = r2, 
                                 pvalue      = pvalue, 
                                 preference  = names(mod)[i], 
                                 stringsAsFactors = FALSE)
            dt <- rbind(dt, dt_tmp)
        }
        
    } else {
        mod <- lm(log(avgGDPpc) ~ eval(as.name(var1)), data = dat)
        # Reassign the correct name of the variable
        names(mod$coefficients)[2] <- var1
        formula <- sprintf("y == %.2f % +.2f * x",
                           round(coef(mod)[1], 5), 
                           round(coef(mod)[2], 5))
        r <- cor(x = log(dat$avgGDPpc), 
                 y = dat[, eval(as.name(var1))])
        correlation <- sprintf("correlation = %.5f", r)
        r2 <- sprintf("R^2 = %.5f", r^2)
        p_value <- summary(mod)$coefficients[,"Pr(>|t|)"][2]
        pvalue <- ifelse(p_value < 0.0001, 
                         "p < 0.0001", 
                         sprintf("p = %.4f", p_value))
        # Save the data
        dt <- data.table(formula     = formula, 
                         correlation = correlation, 
                         r2          = r2, 
                         pvalue      = pvalue, 
                         stringsAsFactors = FALSE)
    }
    
    return(dt)
}