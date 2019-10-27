% Clear workspace
clear all;  % clear workspace variables
clc;        % clear command window

% Create symbolic variables
syms phi theta psi      % phi (about x), theta (about y), psi (about z)

% Three individual rotation matrices
Rz = @(t)  [cos(t) -sin(t) 0;   % rotation about z axis
            sin(t) cos(t) 0;
            0 0 1];
Ry = @(t)  [cos(t) 0 sin(t);    % rotation about y axis
            0 1 0;
            -sin(t) 0 cos(t)];
Rx = @(t)  [1 0 0;              % rotation about x axis
            0 cos(t) -sin(t);
            0 sin(t) cos(t)];

% Three-dimensional rotation matrix
RFxyz = Rz(psi)*Ry(theta)*Rx(phi);  % fixed xyz
RFyzx = Rx(psi)*Rz(theta)*Ry(phi);  % fixed yzx
RFzxy = Ry(psi)*Rx(theta)*Rz(phi);  % fixed zxy
RFxzy = Ry(psi)*Rz(theta)*Rx(phi);  % fixed xzy
RFzyx = Rx(psi)*Ry(theta)*Rz(phi);  % fixed zyx
RFyxz = Rz(psi)*Rx(theta)*Ry(phi);  % fixed yxz
RFzxz = Rz(psi)*Rx(theta)*Rz(phi);  % fixed zxz
RFxyx = Rx(psi)*Ry(theta)*Rx(phi);  % fixed xyx
RFyzy = Ry(psi)*Rz(theta)*Ry(phi);  % fixed yzy
RFzyz = Rz(psi)*Ry(theta)*Rz(phi);  % fixed zyz
RFxzx = Rx(psi)*Rz(theta)*Rx(phi);  % fixed xzx
RFyxy = Ry(psi)*Rx(theta)*Ry(phi);  % fixed yxy
RMxyz = Rx(psi)*Ry(theta)*Rz(phi);  % moving xyz
RMyzx = Ry(psi)*Rz(theta)*Rx(phi);  % moving yzx
RMzxy = Rz(psi)*Rx(theta)*Ry(phi);  % moving zxy
RMxzy = Rx(psi)*Rz(theta)*Ry(phi);  % moving xzy
RMzyx = Rz(psi)*Ry(theta)*Rx(phi);  % moving zyx
RMyxz = Ry(psi)*Rx(theta)*Rz(phi);  % moving yxz
RMzxz = Rz(psi)*Rx(theta)*Rz(phi);  % moving zxz
RMxyx = Rx(psi)*Ry(theta)*Rx(phi);  % moving xyx
RMyzy = Ry(psi)*Rz(theta)*Ry(phi);  % moving yzy
RMzyz = Rz(psi)*Ry(theta)*Rz(phi);  % moving zyz
RMxzx = Rx(psi)*Rz(theta)*Rx(phi);  % moving xzx
RMyxy = Ry(psi)*Rx(theta)*Ry(phi);  % moving yxy

% Derivative of the three-dimensional rotation matrix
syms dphi dtheta dpsi
dRFxyz = diff(RFxyz,phi)*dphi+diff(RFxyz,theta)*dtheta+diff(RFxyz,psi)*dpsi;    % fixed xyz
dRFyzx = diff(RFyzx,phi)*dphi+diff(RFyzx,theta)*dtheta+diff(RFyzx,psi)*dpsi;    % fixed yzx
dRFzxy = diff(RFzxy,phi)*dphi+diff(RFzxy,theta)*dtheta+diff(RFzxy,psi)*dpsi;    % fixed zxy
dRFxzy = diff(RFxzy,phi)*dphi+diff(RFxzy,theta)*dtheta+diff(RFxzy,psi)*dpsi;    % fixed xzy
dRFzyx = diff(RFzyx,phi)*dphi+diff(RFzyx,theta)*dtheta+diff(RFzyx,psi)*dpsi;    % fixed zyx
dRFyxz = diff(RFyxz,phi)*dphi+diff(RFyxz,theta)*dtheta+diff(RFyxz,psi)*dpsi;    % fixed yxz
dRFzxz = diff(RFzxz,phi)*dphi+diff(RFzxz,theta)*dtheta+diff(RFzxz,psi)*dpsi;    % fixed zxz
dRFxyx = diff(RFxyx,phi)*dphi+diff(RFxyx,theta)*dtheta+diff(RFxyx,psi)*dpsi;    % fixed xyx
dRFyzy = diff(RFyzy,phi)*dphi+diff(RFyzy,theta)*dtheta+diff(RFyzy,psi)*dpsi;    % fixed yzy
dRFzyz = diff(RFzyz,phi)*dphi+diff(RFzyz,theta)*dtheta+diff(RFzyz,psi)*dpsi;    % fixed zyz
dRFxzx = diff(RFxzx,phi)*dphi+diff(RFxzx,theta)*dtheta+diff(RFxzx,psi)*dpsi;    % fixed xzx
dRFyxy = diff(RFyxy,phi)*dphi+diff(RFyxy,theta)*dtheta+diff(RFyxy,psi)*dpsi;    % fixed yxy
dRMxyz = diff(RMxyz,phi)*dphi+diff(RMxyz,theta)*dtheta+diff(RMxyz,psi)*dpsi;    % moving xyz
dRMyzx = diff(RMyzx,phi)*dphi+diff(RMyzx,theta)*dtheta+diff(RMyzx,psi)*dpsi;    % moving yzx
dRMzxy = diff(RMzxy,phi)*dphi+diff(RMzxy,theta)*dtheta+diff(RMzxy,psi)*dpsi;    % moving zxy
dRMxzy = diff(RMxzy,phi)*dphi+diff(RMxzy,theta)*dtheta+diff(RMxzy,psi)*dpsi;    % moving xzy
dRMzyx = diff(RMzyx,phi)*dphi+diff(RMzyx,theta)*dtheta+diff(RMzyx,psi)*dpsi;    % moving zyx
dRMyxz = diff(RMyxz,phi)*dphi+diff(RMyxz,theta)*dtheta+diff(RMyxz,psi)*dpsi;    % moving yxz
dRMzxz = diff(RMzxz,phi)*dphi+diff(RMzxz,theta)*dtheta+diff(RMzxz,psi)*dpsi;    % moving zxz
dRMxyx = diff(RMxyx,phi)*dphi+diff(RMxyx,theta)*dtheta+diff(RMxyx,psi)*dpsi;    % moving xyx
dRMyzy = diff(RMyzy,phi)*dphi+diff(RMyzy,theta)*dtheta+diff(RMyzy,psi)*dpsi;    % moving yzy
dRMzyz = diff(RMzyz,phi)*dphi+diff(RMzyz,theta)*dtheta+diff(RMzyz,psi)*dpsi;    % moving zyz
dRMxzx = diff(RMxzx,phi)*dphi+diff(RMxzx,theta)*dtheta+diff(RMxzx,psi)*dpsi;    % moving xzx
dRMyxy = diff(RMyxy,phi)*dphi+diff(RMyxy,theta)*dtheta+diff(RMyxy,psi)*dpsi;    % moving yxy

% Skew-symmetric matrix representing angular velocity
SFxyz = dRFxyz/RFxyz;  % fixed xyz
SFyzx = dRFyzx/RFyzx;  % fixed yzx
SFzxy = dRFzxy/RFzxy;  % fixed zxy
SFxzy = dRFxzy/RFxzy;  % fixed xzy
SFzyx = dRFzyx/RFzyx;  % fixed zyx
SFyxz = dRFyxz/RFyxz;  % fixed yxz
SFzxz = dRFzxz/RFzxz;  % fixed zxz
SFxyx = dRFxyx/RFxyx;  % fixed xyx
SFyzy = dRFyzy/RFyzy;  % fixed yzy
SFzyz = dRFzyz/RFzyz;  % fixed zyz
SFxzx = dRFxzx/RFxzx;  % fixed xzx
SFyxy = dRFyxy/RFyxy;  % fixed yxy
SMxyz = dRMxyz/RMxyz;  % moving xyz
SMyzx = dRMyzx/RMyzx;  % moving yzx
SMzxy = dRMzxy/RMzxy;  % moving zxy
SMxzy = dRMxzy/RMxzy;  % moving xzy
SMzyx = dRMzyx/RMzyx;  % moving zyx
SMyxz = dRMyxz/RMyxz;  % moving yxz
SMzxz = dRMzxz/RMzxz;  % moving zxz
SMxyx = dRMxyx/RMxyx;  % moving xyx
SMyzy = dRMyzy/RMyzy;  % moving yzy
SMzyz = dRMzyz/RMzyz;  % moving zyz
SMxzx = dRMxzx/RMxzx;  % moving xzx
SMyxy = dRMyxy/RMyxy;  % moving yxy

% Angular velocity vector
WFxyz = [SFxyz(3,2);SFxyz(1,3);SFxyz(2,1)];     % fixed xyz
WFyzx = [SFyzx(3,2);SFyzx(1,3);SFyzx(2,1)];     % fixed yzx
WFzxy = [SFzxy(3,2);SFzxy(1,3);SFzxy(2,1)];     % fixed zxy
WFxzy = [SFxzy(3,2);SFxzy(1,3);SFxzy(2,1)];     % fixed xzy
WFzyx = [SFzyx(3,2);SFzyx(1,3);SFzyx(2,1)];     % fixed zyx
WFyxz = [SFyxz(3,2);SFyxz(1,3);SFyxz(2,1)];     % fixed yxz
WFzxz = [SFzxz(3,2);SFzxz(1,3);SFzxz(2,1)];     % fixed zxz
WFxyx = [SFxyx(3,2);SFxyx(1,3);SFxyx(2,1)];     % fixed xyx
WFyzy = [SFyzy(3,2);SFyzy(1,3);SFyzy(2,1)];     % fixed yzy
WFzyz = [SFzyz(3,2);SFzyz(1,3);SFzyz(2,1)];     % fixed zyz
WFxzx = [SFxzx(3,2);SFxzx(1,3);SFxzx(2,1)];     % fixed xzx
WFyxy = [SFyxy(3,2);SFyxy(1,3);SFyxy(2,1)];     % fixed yxy
WMxyz = [SMxyz(3,2);SMxyz(1,3);SMxyz(2,1)];     % moving xyz
WMyzx = [SMyzx(3,2);SMyzx(1,3);SMyzx(2,1)];     % moving yzx
WMzxy = [SMzxy(3,2);SMzxy(1,3);SMzxy(2,1)];     % moving zxy
WMxzy = [SMxzy(3,2);SMxzy(1,3);SMxzy(2,1)];     % moving xzy
WMzyx = [SMzyx(3,2);SMzyx(1,3);SMzyx(2,1)];     % moving zyx
WMyxz = [SMyxz(3,2);SMyxz(1,3);SMyxz(2,1)];     % moving yxz
WMzxz = [SMzxz(3,2);SMzxz(1,3);SMzxz(2,1)];     % moving zxz
WMxyx = [SMxyx(3,2);SMxyx(1,3);SMxyx(2,1)];     % moving xyx
WMyzy = [SMyzy(3,2);SMyzy(1,3);SMyzy(2,1)];     % moving yzy
WMzyz = [SMzyz(3,2);SMzyz(1,3);SMzyz(2,1)];     % moving zyz
WMxzx = [SMxzx(3,2);SMxzx(1,3);SMxzx(2,1)];     % moving xzx
WMyxy = [SMyxy(3,2);SMyxy(1,3);SMyxy(2,1)];     % moving yxy

% Euler angular velocity vector (note that this is sometimes defined
% differently)
dTheta = [dphi;dtheta;dpsi];

% Jacobian relating Euler angle velocity vector to angular velocity vector
EFxyz = jacobian(WFxyz,dTheta);     % fixed xyz
EFyzx = jacobian(WFyzx,dTheta);     % fixed yzx
EFzxy = jacobian(WFzxy,dTheta);     % fixed zxy
EFxzy = jacobian(WFxzy,dTheta);     % fixed xzy
EFzyx = jacobian(WFzyx,dTheta);     % fixed zyx
EFyxz = jacobian(WFyxz,dTheta);     % fixed yxz
EFzxz = jacobian(WFzxz,dTheta);     % fixed zxz
EFxyx = jacobian(WFxyx,dTheta);     % fixed xyx
EFyzy = jacobian(WFyzy,dTheta);     % fixed yzy
EFzyz = jacobian(WFzyz,dTheta);     % fixed zyz
EFxzx = jacobian(WFxzx,dTheta);     % fixed xzx
EFyxy = jacobian(WFyxy,dTheta);     % fixed yxy
EMxyz = jacobian(WMxyz,dTheta);     % moving xyz
EMyzx = jacobian(WMyzx,dTheta);     % moving yzx
EMzxy = jacobian(WMzxy,dTheta);     % moving zxy
EMxzy = jacobian(WMxzy,dTheta);     % moving xzy
EMzyx = jacobian(WMzyx,dTheta);     % moving zyx
EMyxz = jacobian(WMyxz,dTheta);     % moving yxz
EMzxz = jacobian(WMzxz,dTheta);     % moving zxz
EMxyx = jacobian(WMxyx,dTheta);     % moving xyx
EMyzy = jacobian(WMyzy,dTheta);     % moving yzy
EMzyz = jacobian(WMzyz,dTheta);     % moving zyz
EMxzx = jacobian(WMxzx,dTheta);     % moving xzx
EMyxy = jacobian(WMyxy,dTheta);     % moving yxy

% Angle-axis rotation matrix representation
syms kx ky kz
RK =...
    [kx*kx*(1-cos(theta))+cos(theta) kx*ky*(1-cos(theta))-kz*sin(theta) kx*kz*(1-cos(theta))+ky*sin(theta);...
    kx*ky*(1-cos(theta))+kz*sin(theta) ky*ky*(1-cos(theta))+cos(theta) ky*kz*(1-cos(theta))-kx*sin(theta);...
    kx*kz*(1-cos(theta))-ky*sin(theta) ky*kz*(1-cos(theta))+kx*sin(theta) kz*kz*(1-cos(theta))+cos(theta)];   

% Display stuff (for example)
RFxyz = simplify(RFxyz)
dRFxyz = simplify(dRFxyz)
SFxyz = simplify(SFxyz)
WFxyz = simplify(WFxyz)
EFxyz = simplify(EFxyz)