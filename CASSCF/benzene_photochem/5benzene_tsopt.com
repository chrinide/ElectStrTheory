***, benz CAS ci opt initial geometry
file,2,5benz_opt.wfu  ! copy the benz_ci.wfu 
symmetry,nosym
memory,400,m
orient,noorient

basis=6-31G*

geometry = {
 C          0.7034849854       -0.0198632072        0.9661657338
 C         -0.7504693699        0.0079484950        1.1535176845
 C         -1.5043612662        0.1720338855       -0.0085613227
 C         -0.7321306830        0.1260226041       -1.1692072254
 C          0.7187361664        0.0783004828       -0.9626936547
 C          1.3488373727        0.9081929894        0.0514546287
 H          1.3018044376       -0.6742871010        1.5774032490
 H         -1.1804954482       -0.1530192797        2.1241619444
 H         -2.5740635227        0.2653913240       -0.0122828023
 H         -1.1466394237        0.0643881081       -2.1578020811
 H          1.3272442554       -0.5113903008       -1.6274081728
 H          2.4189598774        1.0144777742        0.0652560185
}


{multi
closed,18
occ,24	                                       	! specify occupied space (6e,6o)
wf,42,1,0                                       ! nelectron,sym,spin
state,1 
CPMCSCF,HESS,1.1,accu=1.0d-5
natorb,print,civector
}

frequencies
{optg,root=2,readhess}

{put,molden, benz_ts.molden}
