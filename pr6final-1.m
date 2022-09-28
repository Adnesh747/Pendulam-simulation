clc
angle = input('Enter angle of pendulum: ');
tme = 0.015; %the Increment used
l = 1; % length of the rod
angle = angle * (pi/180);
position = 0;
runsthrough = 0;
velocity = 0;
%sets up for the video
v=VideoWriter('pr6','MPEG-4');
v.FrameRate = 60;
open(v);
velocityChange = (sin(angle)*9.8065)*tme; 
lim = 10;
it = 0;



while velocityChange ~= 0                      %runs loop until the velocity change goes from + to - (which will happen at bottom of motion)
    acceleration = sin(angle) * 9.8065;
    velocityChange = acceleration * tme;
    velocity = velocity + velocityChange;
    positionChange =(acceleration/2) * (tme^2) + (velocity * tme);
it = it+1;
 remainder = rem(it,2); 

 if remainder == 0   % only plots every other point, so that the simulation is smooth
    angle = angle-positionChange;
    position = position + positionChange;
    
   hold on;

    fill([-l-0.2*l l+0.2*l l+0.2*l -l-0.2*l],[-l-0.2*l -l-0.2*l l+0.2*l l+0.2*l],'w'); % clears background
    plot([0 l*sin(angle)],[0 -l*cos(angle)],'r','LineWidth',1); % plots rod
    plot(l*sin(angle),-l*cos(angle),'Marker','o','MarkerSize',10,'MarkerFaceColor','b','MarkerEdgeColor','b'); % plots bob
    
    xlim([-l-0.2*l l+0.2*l]);
    ylim([-l-0.2*l l+0.2*l]);
    xlabel('meters') %x axis
ylabel('meters') % y axis
txt = {'Time',(runsthrough * tme)}; % displays the period on the graph
text(0,0.75,txt)
    title('Pendulum with a 1m rod and 2kg ball');
  frame=getframe(gcf);% create the video 
  writeVideo(v,frame);
   

    
 end

   if it == 360
       disp 'done';
       
       break;
   end

    runsthrough = runsthrough + 1;
     
end


close(v);
disp 'The time of the period is: ';
time =  (runsthrough * tme)/2.68177 %% to get the correct time for one cycle 
disp 'the grpah animation has been saved under pr6.mp4';



% answer to the questions
%the reason that we chose to go with Mattew's groups code was simply beause
%he had the most accurate value for the period. Infact the only part of his
%code that wouldn't work was if the angle was above 70 degrees. We were
%able to fix that in the code aswell. 

%In order to stop overlaying the frams we added a clear command code that
%is labeled above.