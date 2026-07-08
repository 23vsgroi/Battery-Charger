clear
f = 50000;
VLL = 16:155;
VO = 20:0.5:29;
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

Is = 24*D;
Ism=max(Is,[],2)
fgen = (0.63*VLL) + 0.50;
Vr=VLL*0.01;
C=Ism'./(6*(Vr.*fgen));
Worst_C = max(C)
