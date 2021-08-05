setwd("/Users/jannawilloughby/GDrive/Willoughby lab/coal vs fst/migration/")                                                         #set working directory
directory = getwd()
outdir    = paste(directory,"/output/",sep="")                    #directory to save model output  
source(paste(directory, "/source/FunctionSourcer.R", sep = ''))   #source functions and set source directory

repeats = 1                                                       #number of time to repeat simulations
plotit  <<- 1                                                     #toggle population size plotting 0=off, 1=on
species = "krat"                                                  #label

fecundity.V = 10                                                  #fecundity - number of offspring; can be 1, 2, 10, or 100 currently
maturity.V  = 3                                                   #maturity  - number of years to reach sexual maturity
lifespan.V  = 6                                                   #lifespan  - maximum
repro1.V    = 1                                                   #repro1    - can individuals reproduce multiple times in a lifetime? 1 = yes, 0 = no
K.V         = 200                                                 #K         - values for setting total pop size  

#variables
N.V          = K.V                                               #intial population size                                             
gens.V       = 250                                               #number years to simulate plus lifespan                             
r0.V         = 0.1                                               #per capita growth rate                                            
l.V          = 5                                                 #adult density independent mortality (adds variance)               
nloci.V      = 50                                                #number of loci                                                   
countimmat.V = 1                                                 #count immature individuals in Nt? 0 = no, 1 = yes                 
killimmat.V  = 1                                                 #kill immature in adult mortality step? 0 = no, 1 = yes            
adultmort.V  = (1/(lifespan.V-2))                                #proportion of adults that die after reproduction each year

#environmental variables
poorenv.V   = 75                                                 #generation to start removing individuals 
fixedenv.V  = 125                                                #generation to end removing individuals 
lossperct.V = 0.0                                                #proportion of individuals to remove     

#other
nimmigrants.V = 3                                                #number of effective migrants per generation  
propkill.V    = 0.5                                              #proportion to assume die before Nt count

runvars = Replicates(repeats, K.V, N.V, gens.V, r0.V, l.V, nloci.V, countimmat.V, killimmat.V, adultmort.V, fecundity.V, maturity.V, lifespan.V, repro1.V,
                     poorenv.V, fixedenv.V, lossperct.V, nimmigrants.V, 
                     propkill.V, directory, outdir, plotit, species)

remove(repeats, K.V, N.V, gens.V, r0.V, l.V, nloci.V, countimmat.V, killimmat.V, adultmort.V, fecundity.V, maturity.V, lifespan.V, repro1.V,
       poorenv.V, fixedenv.V, lossperct.V, nimmigrants.V,
       propkill.V,directory, outdir, plotit, species)

##run model iterating over parameters in Replicates
for(r in 1:nrow(runvars)){ 
  RunModel(runvars, r)
}
