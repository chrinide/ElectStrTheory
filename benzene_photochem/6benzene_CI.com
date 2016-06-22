***, benz CAS ci opt initial geometry s1benz.xyz has been distorted
file,2,benz_ci.wfu  ! copy the benz_s1.wfu 
symmetry,nosym
memory,400,m
orient,noorient

basis=6-31G*

geometry = {
C        0.7036805630     -0.0952152795      1.2463899210                 
C       -0.7295336938     -0.0362507051      1.2345796181                 
C       -1.4332127513      0.0590036135     -0.0118078877                 
C       -0.7036807362      0.0952153313     -1.2463892571                 
C        0.7295335531      0.0362516245     -1.2345789129                 
C        1.3986667861      0.5800940334      0.0118085581                 
H        1.2301372938     -0.1665640933      2.1788749396                 
H       -1.2753466346     -0.0636083811      2.1582221025                 
H       -2.5054746706      0.1031852323     -0.0206402305                 
H       -1.2301374633      0.1665642285     -2.1788742712                 
H        1.2753464403      0.0636080222     -2.1582214669                 
H        2.4709286947      0.5359121476      0.0206408870                 
}


{multi
closed,18
occ,24	                                       	! specify occupied space (6e,6o)
wf,42,1,0                                       ! nelectron,sym,spin
state,2					                                ! do state-averaged CAS because Delta E is small
CPMCSCF,NACM,1.1,2.1,accu=1.0d-7,record=5100.1  ! calculate the non-adiabatic coupling
CPMCSCF,GRAD,1.1,accu=1.0d-7,record=5101.1      ! calculate the grad on state 1 and 2
CPMCSCF,GRAD,2.1,accu=1.0d-7,record=5102.1
natorb,print,civector
}

{Force
SAMC,5100.1
CONICAL,6100.1}
 
{Force
SAMC,5101.1
CONICAL,6100.1}
 
{Force
SAMC,5102.1
CONICAL,6100.1}

optg,startcmd=multi 

{put,molden,benz_ci_cas.molden}
