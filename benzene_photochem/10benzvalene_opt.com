***, subtracted imaginary freq/10 to transition state i tried to add freq/100 before but it failed
file,2,10benzvale.wfu  ! copy the 7benz_opt.wfu to 10benzvale.wfu
symmetry,nosym
memory,400,m
orient,noorient

basis=6-31G*

geometry = {   
C    0.648494724800000   0.048609148500000   0.885723844700000
C    -0.762463021000000  -0.077001274700000   1.150131857200000
C    -1.538092691000000   0.150061902800000  -0.027871561000000
C    -0.723206765300000   0.157268423900000  -1.125610315700000
C     0.732196531400000  -0.102663056100000  -0.815031707200000
C     1.302414293800000   0.965322069300000  -0.110159090100000
H     1.348608179600000  -0.426498595600000   1.544806793500000
H    -1.135586682500000  -0.457459723800000   2.077993290700000
H    -2.579380841100000   0.302932517200000  -0.021566100100000
H    -1.019098934500000   0.452871654800000  -2.120232235500000
H     1.271918586100000  -0.854533298200000  -1.335092478400000
H     2.368249000900000   1.129696006300000  -0.070957298300000
}


{multi						      ! do casscf calculation
closed,18
occ,24		              ! specify occupied space (6e,6o) i.e. 24-18=6 and the HOMO is 21
wf,42,1,0               ! nelectron,sym,spin
state,1                 ! Choose S0 state
natorb,print,civector   ! print the configurations and the natural orbitals
CPMCSCF,GRAD,1.1,accu=1.0d-7,record=5101.1  ! call the grad function on the first state of the first symmetry 1.1
}

{Force
SAMC,5101.1}

{optg}                   ! execute the optimization 

{put,molden,benzvalene.molden}  ! put the final orbitals in a molden file 
