***, S1 sp on cas optimized gs geom
file,2,3benz_s1sp.wfu  ! cp from benz_gs.wfu 
symmetry,nosym
memory,400,m
orient,noorient

basis=6-31G*

geometry = {   
 C          0.6850406177       -0.0923732619        1.2133694854
 C         -0.7102062640       -0.0355508581        1.2018413417
 C         -1.3952107611        0.0577334395       -0.0114793363
 C         -0.6850411560        0.0923725957       -1.2133686774
 C          0.7102064807        0.0355526403       -1.2018403968
 C          1.3952105993       -0.0577330598        0.0114796386
 H          1.2125792106       -0.1629723197        2.1477505229
 H         -1.2571424414       -0.0639384507        2.1272624570
 H         -2.4695610518        0.1029313378       -0.0202796504
 H         -1.2125794831        0.1629699805       -2.1477500008
 H          1.2571423619        0.0639402660       -2.1272616945
 H          2.4695608773       -0.1029312796        0.0202803105
}


{multi						      ! do casscf calculation
closed,18
occ,24		              ! specify occupied space (6e,6o) i.e. 24-18=6 and the HOMO is 21
wf,42,1,0               ! nelectron,sym,spin
state,2;weight,0,1                 ! Choose S0 state
natorb,print,civector   ! print the configurations and the natural orbitals
}

