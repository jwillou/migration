Replicates = function(repeats, K.V, N.V, gens.V, r0.V, l.V, nloci.V, 
                      countimmat.V, killimmat.V, adultmort.V, fecundity.V, maturity.V, lifespan.V, repro1.V,
                      poorenv.V, fixedenv.V, lossperct.V, nimmigrants.V, 
                      propkill.V, directory, outdir, plotit, species) {  
  
  replicates = expand.grid(K.V, N.V, gens.V, r0.V, l.V, nloci.V, 
                           countimmat.V, killimmat.V, adultmort.V, fecundity.V, maturity.V, lifespan.V, repro1.V,
                           poorenv.V, fixedenv.V, lossperct.V, nimmigrants.V, 
                           propkill.V, directory, outdir, plotit, species)
  colnames(replicates) = c("K", "N", "gens", "r0", "l", "nloci", 
                           "countimmat", "killimmat", "adultmort", "fecundity", "maturity", "lifespan", "repro1",
                           "poorenv", "fixedenv", "lossperct", "nimmigrants", 
                           "propkill", "directory", "outdir", "plotit", "species")
 
  reps = NULL
  for(r in 1:repeats){
    reps = rbind(reps, replicates)
  }
  replicates = reps
  return(replicates)
}  
