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
 
## Example output
If you're interested in the symbolic formulation of the fixed-xyz angles, then change lines 162 to 166 to:

```
RFxyz = simplify(RFxyz)
dRFxyz = simplify(dRFxyz)
SFxyz = simplify(SFxyz)
WFxyz = simplify(WFxyz)
EFxyz = simplify(EFxyz)
```
The output for this is: 

```
RFxyz =
 
[ cos(psi)*cos(theta), cos(psi)*sin(phi)*sin(theta) - cos(phi)*sin(psi), sin(phi)*sin(psi) + cos(phi)*cos(psi)*sin(theta)]
[ cos(theta)*sin(psi), cos(phi)*cos(psi) + sin(phi)*sin(psi)*sin(theta), cos(phi)*sin(psi)*sin(theta) - cos(psi)*sin(phi)]
[         -sin(theta),                              cos(theta)*sin(phi),                              cos(phi)*cos(theta)]
 
 
dRFxyz =
 
[ - dpsi*cos(theta)*sin(psi) - dtheta*cos(psi)*sin(theta), dphi*(sin(phi)*sin(psi) + cos(phi)*cos(psi)*sin(theta)) - dpsi*(cos(phi)*cos(psi) + sin(phi)*sin(psi)*sin(theta)) + dtheta*cos(psi)*cos(theta)*sin(phi), dphi*(cos(phi)*sin(psi) - cos(psi)*sin(phi)*sin(theta)) + dpsi*(cos(psi)*sin(phi) - cos(phi)*sin(psi)*sin(theta)) + dtheta*cos(phi)*cos(psi)*cos(theta)]
[   dpsi*cos(psi)*cos(theta) - dtheta*sin(psi)*sin(theta), dtheta*cos(theta)*sin(phi)*sin(psi) - dpsi*(cos(phi)*sin(psi) - cos(psi)*sin(phi)*sin(theta)) - dphi*(cos(psi)*sin(phi) - cos(phi)*sin(psi)*sin(theta)), dpsi*(sin(phi)*sin(psi) + cos(phi)*cos(psi)*sin(theta)) - dphi*(cos(phi)*cos(psi) + sin(phi)*sin(psi)*sin(theta)) + dtheta*cos(phi)*cos(theta)*sin(psi)]
[                                      -dtheta*cos(theta),                                                                                                   dphi*cos(phi)*cos(theta) - dtheta*sin(phi)*sin(theta),                                                                                                 - dphi*cos(theta)*sin(phi) - dtheta*cos(phi)*sin(theta)]
 
 
SFxyz =
 
[                                            0,                     dphi*sin(theta) - dpsi, dtheta*cos(psi) + dphi*cos(theta)*sin(psi)]
[                       dpsi - dphi*sin(theta),                                          0, dtheta*sin(psi) - dphi*cos(psi)*cos(theta)]
[ - dtheta*cos(psi) - dphi*cos(theta)*sin(psi), dphi*cos(psi)*cos(theta) - dtheta*sin(psi),                                          0]
 
 
WFxyz =
 
 dphi*cos(psi)*cos(theta) - dtheta*sin(psi)
 dtheta*cos(psi) + dphi*cos(theta)*sin(psi)
                     dpsi - dphi*sin(theta)
 
 
EFxyz =
 
[ cos(psi)*cos(theta), -sin(psi), 0]
[ cos(theta)*sin(psi),  cos(psi), 0]
[         -sin(theta),         0, 1]
```

## Maintainers
 - [brennanyama](https://github.com/brennanyama)
