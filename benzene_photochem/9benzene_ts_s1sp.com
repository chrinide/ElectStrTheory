***, S1 sp on cas optimized ts geom
file,2,9benz_tss1sp.wfu  ! cp from 7benz_opt.wfu 
symmetry,nosym
memory,400,m
orient,noorient

basis=6-31G*

geometry = {   
 C          0.6443417248        0.0499751485        0.8872228447
 C         -0.7531310210       -0.0711042747        1.1545458572
 C         -1.5232986910        0.1372209028       -0.0286295610
 C         -0.7199117653        0.1584394239       -1.1296693157
 C          0.7295425314       -0.1118510561       -0.8202137072
 C          1.3038932938        0.9644170693       -0.1109320901
 H          1.3494901796       -0.4296485956        1.5441647935
 H         -1.1347536825       -0.4415647238        2.0859022907
 H         -2.5813238411        0.3210895172       -0.0401161001
 H         -1.0216479345        0.4557486548       -2.1168972355
 H          1.2696125861       -0.8775302982       -1.3579384784
 H          2.3680940009        1.1230040063       -0.0674352983
}


{multi						      ! do casscf calculation
closed,18
occ,24		              ! specify occupied space (6e,6o) i.e. 24-18=6 and the HOMO is 21
wf,42,1,0               ! nelectron,sym,spin
state,2;weight,0,1                 ! Choose S0 state
natorb,print,civector   ! print the configurations and the natural orbitals
}

