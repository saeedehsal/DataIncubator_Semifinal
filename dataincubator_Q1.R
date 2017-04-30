# this function returns the mean and SD for the payment
#inuts are the number of experiments and number of coins
payment <- function(n_exp, N){
        payments_vec <- rep(0,n_exp)
        for (j in 1:n_exp)
        {
                a <- seq(1,N,1)
                random_order <- sample(a,N)
                payment <- random_order[1]
                for (i in 2:length(a)){
                        payment <- payment + abs(random_order[i]-random_order[i-1]) 
                }
                payments_vec[j] <- payment
        }
        mean_total_payment <- mean(payments_vec)
        sd_payment <- sd(payments_vec)
        results <- cbind(mean_total_payment, sd_payment)
        sprintf("%.10f",results)
}

#this function returns the probability that the payment is more than some value
#inputs are the number of experiments, number of coins and the threshold value
#to compare the payment against
success <- function(n_exp,N, threshold){
        success_vec <- rep(0,n_exp)
        for (j in 1:n_exp)
        {
                a <- seq(1,N,1)
                random_order <- sample(a,N)
                payment <- random_order[1]
                for (i in 2:length(a)){
                        payment <- payment + abs(random_order[i]-random_order[i-1]) 
                }
                if (payment >=threshold) {
                        success_vec [j] <- 1
                }
        }
        success <- sum(success_vec)/n_exp
        sprintf("%.10f",success)
}




