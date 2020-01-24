
    % clear all
    
    %clearvars
    %clearvars -GLOBAL
    %close all
    
    % set(0,'DefaultFigureWindowStyle','docked')
    global C

    addpath ../geom2d/geom2d

    C.q_0 = 1.60217653e-19;             % electron charge
    C.hb = 1.054571596e-34;             % Dirac constant
    C.h = C.hb * 2 * pi;                % Planck constant
    C.m_0 = 9.10938215e-31;             % electron mass
    C.kb = 1.3806504e-23;               % Boltzmann constant
    C.eps_0 = 8.854187817e-12;          % vacuum permittivity
    C.mu_0 = 1.2566370614e-6;           % vacuum permeability
    C.c = 299792458;                    % speed of light
    C.g = 9.80665;                      %metres (32.1740 ft) per s²

    nTime = 100;
    %nTraj = 10;
    nSims = 100;
    vi=0;
    x0=0;
    v0=0;
    V_vec = zeros(1, 1);
    T_vec = zeros(1, 1);
    X_vec = zeros(1, 1);
    D_vec = zeros(1, 1);
    for n = 1 : nSims

       t = 1 + n ;
       ti = n ;
       vi = v0 + (C.q_0 / C.m_0) / (t-ti);
       T_vec(n) = t;
       V_vec(n) = vi;
       D=D+vi*t;
       X_vec(n) = D;
       D_vec(n)=(X_vec(n)/T_vec(n));
       figure(1)
       subplot(2, 1,1)
       plot(T_vec,V_vec)
       grid on
       title ('Vel vs. Time')
       xlabel 'Time'
       ylabel 'Velocity'
       subplot(2,1,2)
       plot(T_vec, X_vec)
       grid on
       title (['Distance vs. Time ',num2str(D_vec(n))]);
       xlabel 'Time'
       ylabel 'Distance'
  
                                %new velovity equals old velocity
       ti=t;                          %new start time equals old end time
       I=abs(rand(1,1)); 
       if(I < 0.05)
           vi=0;
       end 
       v0=vi;

    end
    

