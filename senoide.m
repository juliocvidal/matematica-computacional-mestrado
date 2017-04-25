% senoide corrompida por um ruido branco de 4%
% de -2pi at? 2pi 

x=-2*pi:0.1:2*pi;

percentualRuido=input('Amplitude percentual do ruido?');

funcao = sin(x);
amplitude = (max(funcao) - min(funcao))/2;

percentualRuido =  amplitude*percentualRuido/100;

ruido=rand(size(x))*2*percentualRuido - percentualRuido;

y=ruido + funcao;
plot(x,y);

%h = 2*pi*0.04