      %Ingradients
  L=1-0;      %Total length 0<x<1
  T=0.06-0;   %Total Time 0<t<0.06
  alpha=1;    %Diffusivity constant
  dx=0.05;     %Spatial step
  dt=0.001;     %time step
  d=(alpha*dt)/(dx^2);  %Convergence constant
  N=L/dx +1;%Space nodes
  M=T/dt +1;%Space nodes
  x=zeros(N,1);
  t=zeros(M,1);
  for i=1:N
    x(i)=0+(i-1)*dx;
  end
  for j=1:M
    t(j)=0+(j-1)*dt;
  end
  U=zeros(M,N);
  U(:,1)=0; %Left Boundry condition
  U(:,N)=0; %Rigth Boundry condition
  U(1,2:N-1)=sin(pi*x(2:N-1)); %Initial condition
  for k=1:M-1
    fprintf('   t      x        U\n ')
    for i=2:N-1
      U(k+1,i)= d*U(k,i+1) + (1-2*d)*U(k,i) + d*U(k,i-1);
      fprintf(' %.4f  %.4f  %.4f\n',t(k+1),x(i),U(k+1,i));
    endfor
  endfor
U
figure(1)
plot(x,U(M,:))
title('x vs U at t=0.06')
xlabel('x')
ylabel('Temprature')
figure(2)
plot(t,U(:,(N+1)/2))
title('t vs U at x=0.5')
xlabel('time')
ylabel('Temprature')


