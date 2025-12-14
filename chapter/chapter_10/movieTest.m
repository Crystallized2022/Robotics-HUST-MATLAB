obj = VideoWriter('My Animation');
open(obj)
x =linspace(0,5,50);
y = x.^2;
axis([0 5 0 25])
hold on
for ii = 1:length(x)
    plot(x(1:ii),y(1:ii),'r')
    M(ii) = getframe;
    pause(0.01)
end
writeVideo(obj,M)
close(obj)