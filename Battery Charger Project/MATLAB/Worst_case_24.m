clear
Io=24;
CRm=0.30;
VRm=0.01;
f = 50000;
VLL = 33:155;
VO = 20:0.5:29.2;
Dmax = 0.9;
D = VO./(VLL');
row = size(D,1);
col = size(D,2);

%Removes impossible operating points where duty cycle > Dmax
for i = 1:row
    for j = 1:col
        if D(i,j) > Dmax
            D(i,j) = 0;
        end
    end
end

Is = Io*D;
Ism=max(Is,[],2);
Ismi=Ism';
fgen = (0.63*VLL) + 0.50;
Vr=VLL*VRm;
C=Ism'./(6*(Vr.*fgen));
Cm = max(C)
%graph
figure;

yyaxis left
plot(VLL, C, 'b-', 'LineWidth', 2);
ylabel('Capacitance (F)');

yyaxis right
plot(VLL, fgen, 'r--', 'LineWidth', 2);
ylabel('Frequency (Hz)');   % or (kHz) if fgen is in kHz

xlabel('V_{LL} (V)');
title('Capacitance and Generated Frequency vs V_{LL} (24V)');
legend('Capacitance', 'f_{gen}', 'Location', 'best');
grid on;