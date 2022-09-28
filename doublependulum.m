clc
angle = input('Enter angle of pendulum: ');
tme = 0.0001; %the Increment used
l = 1; % length of the rod
l2 = 2;
angle2 = 22.56;
angle = angle * (pi/180);
angle2= angle2 * (pi/180);
position = 0;
position2 =0;
runsthrough = 0;
runsthrough2 = 0;
velocity = 0;
velocity2 = 0;
%sets up for the video
%v=VideoWriter('pr6','MPEG-4');
%v.FrameRate = 60;
%open(v);
velocityChange = ((sin(angle)*9.8065)*tme) - ((sin(angle2)*9.8065)*tme); 
velocityChange2 = ((sin(angle)*9.8065)*tme) + ((sin(angle2)*9.8065)*tme); 
lim = 10;
it = 0;



while velocityChange ~= 0                      %runs loop until the velocity change goes from + to - (which will happen at bottom of motion)
    acceleration = (sin(angle) * 9.8065) - (sin(angle2)*9.8065);
    acceleration2 = (sin(angle) * 9.8065) + (sin(angle2)*9.8065);
    
    velocityChange = (acceleration * tme)- (acceleration2*tme);
    velocityChange2 = (acceleration * tme)+ (acceleration2*tme);
    
    velocity = (velocity + velocityChange)-( velocity2 + velocityChange2);
    velocity2 = (velocity + velocityChange)+( velocity2 + velocityChange2);
    
    positionChange =((acceleration/2) * (tme^2) + (velocity * tme)) - ((acceleration2/2) * (tme^2) + (velocity2 * tme));
    
    positionChange2 =((acceleration/2) * (tme^2) + (velocity * tme)) + ((acceleration2/2) * (tme^2) + (velocity2 * tme));
it = it+1;
 remainder = rem(it,2); 

 if remainder == 0   % only plots every other point, so that the simulation is smooth
    angle = (angle-positionChange) - (angle2-positionChange2);
    angle2 = (angle-positionChange) + (angle2-positionChange2);
    
    position = (position + positionChange)-(position2 + positionChange2);
    position = (position + positionChange)+(position2 + positionChange2);
    
   hold on;

    fill([-l-0.2*l l+0.2*l l+0.2*l -l-0.2*l],[-l-0.2*l -l-0.2*l l+0.2*l l+0.2*l],'w'); % clears background
    fill([-l2-0.2*l2 l2+0.2*l2 l2+0.2*l2 -l2-0.2*l2],[-l2-0.2*l2 -l2-0.2*l2 l2+0.2*l2 l2+0.2*l2],'w'); % clears background
    
    plot([0 l*sin(angle)],[0 -l*cos(angle)],'r','LineWidth',1); % plots rod
    plot(l*sin(angle),-l*cos(angle),'Marker','o','MarkerSize',10,'MarkerFaceColor','b','MarkerEdgeColor','b'); % plots bob
    
     plot([l*sin(angle) l2*sin(angle2)],[-l*cos(angle) -l2*cos(angle2)],'r','LineWidth',1); % plots rod
    plot([l*sin(angle) l2*sin(angle2)],[-l*cos(angle) -l2*cos(angle2)],'Marker','o','MarkerSize',8,'MarkerFaceColor','b','MarkerEdgeColor','b'); % plots bob
    
    xlim([-2 2]);
    ylim([-2.5 2.5]);
    xlabel('meters') %x axis
ylabel('meters') % y axis

    title('Pendulum with a 1m rod and 2kg ball');
  frame=getframe(gcf);% create the video 
 % writeVideo(v,frame);
   pause(0.05);

    
 end

   if it == 180
       disp 'done';
       
       break;
   end

    runsthrough = runsthrough + 1;
     
end


%close(v);
disp 'The time of the period is: ';
time =  (runsthrough * tme)/2.68177 %% to get the correct time for one cycle 
disp 'the grpah animation has been saved under pr6.mp4';