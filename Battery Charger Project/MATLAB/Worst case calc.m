f = 50000;
VLL = 16:155;
VO = 20:0.5:29;
D = VO./(VLL');
Is = 24*D;
fgen = (0.63*VLL) + 0.50;
Vr=VLL*0.01;
Ism=max(Is,[],2)
