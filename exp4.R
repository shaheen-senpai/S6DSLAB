palindrome <- function(x){
  string_split <- strsplit(as.character(x), NULL)[[1]]
  #print(string_split)
  reversed_string = paste(rev(string_split),collapse='')
  #print(reversed_string)
  #print(as.character(x))

  if(as.character(x) == reversed_string) return(x)
  else return(FALSE)
  
} 
v <- list(c('mam','nope','wow'),c(121,123,454),c('yay',121,'yes',325))
print(v)
for (i in v){
  ans <- lapply(i, palindrome)
  print(ans)
}