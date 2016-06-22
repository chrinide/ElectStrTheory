***, S1 sp on cas optimized benzvalene geom
file,2,11benzvale_s1sp.wfu  ! cp from 10benzvale.wfu 
symmetry,nosym
memory,400,m
orient,noorient

basis=6-31G*

geometry = {   
 C          0.6620629332       -0.2029591847        0.8036554122
 C         -0.7979337417       -0.1533360754        1.1866308138
 C         -1.4464956004        0.2398941241        0.0792805434
 C         -0.3761584326        0.4347739722       -0.9681457616
 C          0.7598038898       -0.5196000382       -0.7054772986
 C          0.9363390642        0.8326267405       -0.2559717565
 H          1.4403110073       -0.5106598273        1.4788943689
 H         -1.1991999999       -0.3992656319        2.1497946216
 H         -2.4962733321        0.4037641450       -0.0631523750
 H         -0.5815049634        0.7752250748       -1.9672561553
 H          1.3295205864       -1.1995471464       -1.3072245308
 H          1.6835809703        1.5876896216       -0.3988928823
}


{multi						      ! do casscf calculation
closed,18
occ,24		              ! specify occupied space (6e,6o) i.e. 24-18=6 and the HOMO is 21
wf,42,1,0               ! nelectron,sym,spin
state,2;weight,0,1                 ! Choose S0 state
natorb,print,civector   ! print the configurations and the natural orbitals
}

