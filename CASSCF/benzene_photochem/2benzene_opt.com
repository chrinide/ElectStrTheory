***, benz CAS(6e,6o) geometry optimization
file,3,benz_gs.wfu  ! save orbs must include the -W option in the molpro command
symmetry,nosym
memory,400,m
orient,noorient

basis=6-31G*

geometry = {   
  C      0.68493363     -0.09266689      1.21328817
  C     -0.71008099     -0.03513263      1.20178436
  C     -1.39497190      0.05736966     -0.01149031
  C     -0.68493266      0.09266872     -1.21328768
  C      0.71008429      0.03513214     -1.20178194
  C      1.39497341     -0.05736936      0.01148981
  H      1.21798913     -0.16516814      2.15709917
  H     -1.26274841     -0.06280306      2.13663863
  H     -2.48040547      0.10193005     -0.02043533
  H     -1.21798686      0.16517430     -2.15709867
  H      1.26273800      0.06279719     -2.13664483
  H      2.48040682     -0.10193095      0.02044262
}

{HF}                    ! do hartree fock calculation

{multi						      ! do casscf calculation
closed,18
occ,24		              ! specify occupied space (6e,6o) i.e. 24-18=6 and the HOMO is 21
start,2100.2            ! start with the HF orbitals (default)
orbital,2140.2          ! save the CASSCF orbitals in 2140.2 (default) 
rotate,17.1,19.1        ! rotate the HF orbitals to get the pi orbitals in the active space
rotate,30.1,24.1   
wf,42,1,0               ! nelectron,sym,spin
state,1                 ! Choose S0 state
natorb,print,civector   ! print the configurations and the natural orbitals
CPMCSCF,GRAD,1.1,accu=1.0d-7,record=5101.1  ! call the grad function on the first state of the first symmetry 1.1
}

{Force
SAMC,5101.1}

{optg}                   ! execute the optimization 

{put,molden,benz_gs_cas.molden}  ! put the final orbitals in a molden file 
