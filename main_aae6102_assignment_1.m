% ========================================================================
%                       AAE6102 Assignment 1
%                Author: Hoi Fung NG - 21053478R
% ========================================================================

clc;
clear;
close all;
warning('off', 'all');

%% Settings
ENA_TROPO_ERR_CORR = true; % flag to enable tropospheric error estimation using Saastamoinen model

%% Read given data
% ephemeris: tow, svid, toc, toe, af0, af1, af2, ura, e, sqrta, dn, m0, w, omg0, i0, odot, idot, cus, cuc, cis, cic, crs, crc, iod
eph = importdata(fullfile('Data','eph.dat'));
eph = sortrows(eph,[1, 2]);

% receiver: tow, svid, pr, cycle, phase, cycle slp, snr
rcvr = importdata(fullfile('Data','rcvr.dat'));
rcvr = sortrows(rcvr,[1, 2]);

% select common satellite
[~, ephIdx] = ismember(eph(:,2), rcvr(:,2));
[~, rcvrIdx] = ismember(rcvr(:,2), eph(:,2));
eph = eph(ephIdx, :);
rcvr = rcvr(rcvrIdx, :);

%% Set given information
ini_pos = [-2694685.473; -4293642.366; 3857878.924]; % initial position
v_light = 299792458.0; % speed of light, m/s
wedot = 7.2921151467e-5; % earth's rotation rate, wgs84, r/s
mu = 3.986005e+14; % earth's universal gravitation, wgs84, m^3/s^2
F = -4.442807633e-10; % relativistic correction term
tar_XR = [-2700400; -4292560; 3855270];  % target receiver position

[wlat, wlon, walt] = wgsxyz2lla(tar_XR);
tar_XR_lla = [wlat, wlon, walt]'; % target receiver position

%% Tropospheric constant
% Standard atmosphere - Berg, 1948 (Bernese)
% pressure [mbar]
Pr = 1013.25;
% temperature [K]
Tr = 291.15;
% numerical constants for the algorithm [-] [m] [mbar]
Hr = 50.0;
% temperature at sea-level
temp0 = 15;

%% Main program
% 1. Calculate satellite ECEF position vector
XS = nan(size(eph,1), 3); % matrix storing satellite ECEF position
dtS = nan(size(eph,1), 1); % array storing satellite clock offset
for i = 1:size(eph,1)
    % assign requried variables 
    pr      =   rcvr(i, 3);
    t       =   eph(i, 1) - pr/v_light; % calculate the transmission time
    svid    =   eph(i, 2);
    toc     =   eph(i, 3);
    toe     =   eph(i, 4);
    af0     =   eph(i, 5);
    af1     =   eph(i, 6);
    af2     =   eph(i, 7);
    e       =   eph(i, 9);
    sqrta   =   eph(i, 10);
    dn      =   eph(i, 11);
    m0      =   eph(i, 12);
    omega   =   eph(i, 13);
    omg0 	=   eph(i, 14);
    i0      =   eph(i, 15);
    odot    =   eph(i, 16);
    idot    =   eph(i, 17);
    cus     =   eph(i, 18);
    cuc     =   eph(i, 19);
    cis     =   eph(i, 20);
    cic     =   eph(i, 21);
    crs     =   eph(i, 22);
    crc     =   eph(i, 23);    
     
    % satellite clokck offset calculation
    dt_sv = af0 + af1 * (t - toc) + af2 * (t - toc).^2;
    dtS(i,1) = dt_sv;
    
    % satellite ECEF position calculation
    a = sqrta^2;   % 1. semimajor axis
    
    n = sqrt(mu / a^3) + dn;   % 2. corrected mean motion (rad/sec)
    
    t_k = t - toe;   % 3. time from ephemeris epoch
    if t_k > 302400  % half week compensation
        t_k = t_k - 604800;
    end
    if t_k < -302400  % half week compensation
        t_k = t_k + 604800;
    end
    
    M_k = m0 + n*(t_k);   % 4. mean anomaly
    
    % 5. eccentric anomaly, Kepler's equation (solve by iterations)
    max_iter = 12; % set maximum number of iterations
    iter = 0;
    E_k = M_k;
    E_k0 = E_k;
    while iter < max_iter || abs(E_k-E_k0)>1e-12
        E_k0 = E_k;
        E_k = E_k - (E_k - e * sin(E_k) - M_k) / (1 - e * cos(E_k));
        % fprintf('dE_k: %e\n', abs(E_k0-E_k));
        iter = iter + 1;
    end
    
    % relativistic correction,
    % one more loop to refine transmission time and satellite delay
    dtr = F * e * sqrta * sin(E_k);
    dtS(i,1) = dtS(i,1) + dtr;
    
    
    f_k = atan2(sqrt(1 - e^2) * sin(E_k), cos(E_k) - e);   % 6. true anomaly
    
    phi_k = f_k + omega;   % 7. argument of latitude
    
    du_k = cuc * cos(2 * phi_k) + cus * sin(2 * phi_k);   % 8. argument of latitude correction
    dr_k = crc * cos(2 * phi_k) + crs * sin(2 * phi_k);   % 9. radius correction
    di_k = cic * cos(2 * phi_k) + cis * sin(2 * phi_k);   % 10. inclination correction
    
    u_k = phi_k + du_k;   % 11. corrected argument of latitude
    r_k = a * (1 - e * cos(E_k)) + dr_k;   % 12. corrected radius
    i_k = i0 + di_k + idot * t_k;   % 13. corrected inclination 
    
    omg_k = omg0 + (odot - wedot) * t_k - wedot * toe; % 14. corrected longitude of node
    
    x_p = r_k * cos(u_k);   % 15. in-plane x position
    y_p = r_k * sin(u_k);   % 16. in-plane y position
    
    x_s = x_p * cos(omg_k) - y_p * cos(i_k) * sin(omg_k);   % ECEF x-coordinate
    y_s = x_p * sin(omg_k) + y_p * cos(i_k) * cos(omg_k);   % ECEF y-coordinate
    z_s = y_p * sin(i_k);   % ECEF z-coordinate
    
    % earth rotation correction
    % rotation angle
    omegatau = wedot * pr / v_light;
    % rotation matrix
    R3 = [ cos(omegatau)    sin(omegatau)   0;
          -sin(omegatau)    cos(omegatau)   0;
           0                0               1];
	XS_rot = R3 * [x_s, y_s, z_s]';
    
    %XS(i, :) = [x_s, y_s, z_s];  % store corresponding satellite position
    XS(i, :) = XS_rot';  % store corresponding satellite position
end

% least squares to estimate receiver location 
XR = ini_pos;  % initial LS solution: ECEF position, meters
dtR = 0;  % initial LS solution: receiver clock offset, second
[wlat, wlon, walt] = wgsxyz2lla(XR); % initial LS solution: LLA position, deg,deg,meter
x = [XR; dtR]; % solution; 1-3: position in ECEF, meters; 4: receiver clock offset, second;
iter = 0;  % iteration counter
posErr = norm(XR-tar_XR); % positioning error to given target position

dryRunTbl = [iter, nan, nan, nan, nan, nan, XR', dtR, dtR*v_light, wlat, wlon, walt, nan]; % dryrun table to trace variable change
fprintf('=== Iter #%d (initial) ===\n', iter);
fprintf('Initial position: ECEF(m): %.3fm, %.3fm, %.3fm (WGS84 LLA: %.9f�X, %.9f�X, %.3fm)\n', XR, wlat, wlon, walt);
fprintf('Total position error: %.3fm\n', posErr);

while 1
    % Tropospheric error (saastamoinen model), resolve the tropospheric error each iteration
    if ENA_TROPO_ERR_CORR
        humi = 1.0;
        [wlat, wlon, walt] = wgsxyz2lla(XR);
        tropo_err = zeros(size(XS, 1), 1);
        for i = 1:size(XS, 1)
            enu = wgsxyz2enu(XS(i,:)', wlat, wlon, walt);
            el = asin(enu(3)/sqrt(enu(1)^2 + enu(2)^2));
            if walt < 0
                hgt = 0;
            else
                hgt = walt;
            end
            pres = Pr * (1 - 2.2557e-5 * hgt)^5.2568;
            temp = temp0 - 6.5e-3 * hgt + 273.16;
            e = 6.108 * humi * exp((17.15 * temp - 4684.0) / (temp - 38.45));
            
            % saastamoninen model
            z = pi / 2.0 - el;
            trph = 0.0022768 * pres / (1.0-0.00266*cos(2.0 * wlat) - 0.00028 * hgt / 1e3) / cos(z);
            trpw = 0.002277 * (1255.0 / temp + 0.05) * e / cos(z);
            tropo_err(i, 1) = trph + trpw;
        end
    end
    % Tropospheric error (saastamoinen model)
    
    pr = rcvr(:, 3); % extract measured pseudorange
    
    dist = sqrt(sum((XS - XR').^2, 2)); % geometric distance
    b = dist + v_light .* (dtR - dtS) + tropo_err; % approx pseudorange
    
    H = [[XR' - XS]./dist, ones(size(XS, 1),1).*v_light];  % design matrix
    
    dx = inv(H' * H) * H' * (pr - b); % LS solution
    
    residual = pr - (b + H*dx); % calculate residual
    residualSE = residual' * residual; % residual, squared error
    
    % update solution
    x = x + dx; % update solution (All)
    XR = XR + dx(1:3); % update ECEF position
    [wlat, wlon, walt] = wgsxyz2lla(XR); % convert updated position to wgs84 LLA
    dtR = dtR + dx(4); % update receiver clock offset, second
    posErr = norm(XR-tar_XR); % positioning error to given target position
    
    iter = iter + 1; % update iteration counter
    
    dryRunTbl = [dryRunTbl; iter, dx', residualSE, XR', dtR, dtR*v_light, wlat, wlon, walt, posErr];
    fprintf('=== Iter #%d ===\n', iter);
    fprintf('�Gx: %.3fm, %.3fm, %.3fm, %.7fs (%.3fm)\n', dx, dx(4)*v_light);
    fprintf('Updated position: ECEF(m): %.3fm, %.3fm, %.3fm (WGS84 LLA: %.9f�X, %.9f�X, %.3fm)\n', XR, wlat, wlon, walt);
    fprintf('Updated receiver clock offset: %.7fs (%.3fm)\n', dtR, dtR*v_light);
    fprintf('Total position error: %.3fm\n', posErr);
    fprintf('LS residual, squared error: %.3fm^2\n', residualSE);
    
    if norm(dx(1:3)) < 1e-4 || ...  % check delta position solution smaller than threshold
            iter > 12  % check iteration number
       break; 
    end
end

% LS summary
fprintf('\n============= Summary =============\n');
fprintf('Init. position ECEF: %.3fm, %.3fm, %.3fm -> Final. position ECEF: %.3fm, %.3fm, %.3fm\n', ini_pos, XR);
fprintf('Target position ECEF: %.3fm, %.3fm, %.3fm, positioning error: %.3fm\n', tar_XR, norm([tar_XR-XR]));
fprintf('Receiver clock offset: %.7fs, %.3fm\n', dtR, dtR*v_light);

% plot position figure
figure; 
hold on;
axis equal;
set(gca, 'FontSize', 12);
pltObj(1,1) = plot(dryRunTbl(1,13), dryRunTbl(1,12), 'o', 'MarkerFaceColor', 'm', 'MarkerEdgeColor', 'k', 'MarkerSize', 12);
pltObj(2,1) = plot(dryRunTbl(2:end,13), dryRunTbl(2:end,12), 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12);
pltObj(3,1) = plot(tar_XR_lla(2), tar_XR_lla(1), 'p', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'k', 'MarkerSize', 12);
xlabel('Longitude (deg)'); ylabel('Latitude (deg)');
legend(pltObj, {'Initial position'; 'LS estimated position'; 'Given reference position'});











