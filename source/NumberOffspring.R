NumberOffspring = function(Nt, K, r0, g, l, adultmort, agestage, poorenv, fixedenv, lossperct, population){
  if(g >= poorenv & g <= fixedenv){
    K = K - (K * lossperct)
  }
  
  # calculate popsize based on pre-reproduction census
  Ntt = Nt*(1+r0*(1-(Nt/K))) #logistic
  
  # add DI variance
  Nt1 = round(rnorm(1, Ntt, l), 0)
  
  # determine number of offspring to produce 
  adultmortnumber = Nt - round(Nt*adultmort, 0)
  totaloffspring  = Nt1 - adultmortnumber                                 #number that will die due to adult mortality

  return(totaloffspring)
}
