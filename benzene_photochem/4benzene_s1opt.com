***, benz CAS s1 opt
file,2,benz_s1.wfu   ! copy the file benz_gs.wfu to benz_s1.wfu else include the HF and rotate directives
symmetry,nosym
memory,400,m
orient,noorient

basis=6-31G*

geometry = {
 C          0.6850406177       -0.0923732620        1.2133694854
 C         -0.7102062640       -0.0355508581        1.2018413417
 C         -1.3952107611        0.0577334397       -0.0114793363
 C         -0.6850411560        0.0923725955       -1.2133686774
 C          0.7102064807        0.0355526405       -1.2018403968
 C          1.3952105993       -0.0577330598        0.0114796386
 H          1.2125792105       -0.1629723200        2.1477505229
 H         -1.2571424414       -0.0639384507        2.1272624570
 H         -2.4695610518        0.1029313383       -0.0202796504
 H         -1.2125794832        0.1629699797       -2.1477500008
 H          1.2571423619        0.0639402667       -2.1272616944
 H          2.4695608773       -0.1029312797        0.0202803105
}


{multi
closed,18
occ,24	                                     	! specify occupied space (6e,6o)
wf,42,1,0                                     ! nelectron,sym,spin
STATE,2;WEIGHT,0,1;                           ! not doing state averaged CAS
CPMCSCF,GRAD,2.1,accu=1.0d-7,record=5101.1    ! now grad is on second state
natorb,print,civector
}

{Force
SAMC,5101.1}

{optg}

{put,molden,s1benz_cas.molden}
