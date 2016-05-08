
rm(list = ls()); # Clear all the data in the environment

# Fibonacci function
fibonacci <- function(n=-1)
{
  if(n < 2) # First 2 values of the succession: 0 y 1
  {
    result <- n;
  }
  else if (n >= 2) # Calculate the following values (> 1) of the succession by recursivity
  {
    result <- fibonacci(n-1) + fibonacci(n-2); # Recursive call to itself
  }
  else # Manage invalid input arguments of the function
  {
    printf("Invalid or empty n input, expected an unsigned integer: fibonacci(n)");
    result <- -1; # Error result
  }
  
  return(result);
}

# Plot the first 7 values of the Fibonacci succession
x <- seq(0,7,1);
y <- lapply(x,fibonacci);
plot(x, y, type="o", col="red", main="Fibonacci Succession (n = 7)", xlab="N", ylab="Value", axes=FALSE);
axis(1, las=1, at=1*0:7);
axis(2, las=1, at=1*0:13);
box()