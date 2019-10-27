# 3D Orientation Representation

This repository contains a Matlab script that symbolically calculates: 
 - three-dimensional rotation matrix
 - derivative of the three-dimensional rotation matrix (velocity rotation matrix)
 - skew-symmetric matrix relating angular velocity vector to the rotation matrix and it's derivative
 - angular velocity vector
 - Jacobian matrix relating Euler angle velocity vector to angular velocity vector
...for all 24 possible Euler angle orderings.  There are 12 possible Euler angle orderings in three dimensions (xyz,yzx,zxy,xzy,zyx,yxz,zxz,xyx,yzy,zyz,xzx,yxy) which can be referenced to the fixed or moving axis system (for a total of 24 valid orderings).  

## Notes on nomenclature
We assume a right-handed cartesian coordinate system
 - `phi` is an Euler rotation about x
 - `theta` is an Euler rotation about y
 - `psi` is an Euler rotation about z
 - `dphi` is the time derivative of phi (phi/dt)
 - `dtheta` is the time derivative of theta (theta/dt)
 - `dpsi` is the time derivative of psi (psi/dt)
 - `dTheta` is the Euler angle vector time derivative [`dphi`;`dtheta`;`dpsi`]

## Maintainers
 - [brennanyama](https://github.com/brennanyama)
