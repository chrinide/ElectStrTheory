***, benz CAS S0 calculation on s1 optimized benzene
file,2,6benz_s0sp.wfu   ! copy benz_s1.wfu
symmetry,nosym
memory,400,m
orient,noorient

basis=6-31G*

geometry = {
 C          0.7036805631       -0.0952152795        1.2463899211
 C         -0.7295336938       -0.0362507053        1.2345796181
 C         -1.4332127513        0.0590036138       -0.0118078877
 C         -0.7036807362        0.0952153310       -1.2463892572
 C          0.7295335531        0.0362516247       -1.2345789130
 C          1.4332125906       -0.0590033386        0.0118085581
 H          1.2301372938       -0.1665640934        2.1788749397
 H         -1.2753466348       -0.0636083816        2.1582221023
 H         -2.5054746705        0.1031852335       -0.0206402303
 H         -1.2301374634        0.1665642273       -2.1788742713
 H          1.2753464402        0.0636080227       -2.1582214669
 H          2.5054744992       -0.1031852244        0.0206408870
}


{multi
closed,18
occ,24	                                     	! specify occupied space (6e,6o)
wf,42,1,0                                     ! nelectron,sym,spin
STATE,1                       
natorb,print,civector
}

{put,molden,s1benz_cas.molden}
