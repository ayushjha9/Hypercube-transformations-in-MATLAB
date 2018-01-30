%CSE 4280 -  Dr Ribeiro - AYUSH JHA - Assignment 1 ~

function asst1()

pts = [ 0.0  0.0  0.0;    
        0.0  0.0  1.0;    
        0.0  1.0  0.0;    
        0.0  1.0  1.0;    
        1.0  0.0  0.0;    
        1.0  0.0  1.0;    
        1.0  1.0  0.0;    
        1.0  1.0  1.0 ]'  
    
h = figure;
set(gcf, 'color','black');
set(gcf, 'Position', [0, 0, 100, 100])
axis([-1.5 1.5 -1.5 1.5 -1.5 1.5]);

S_tilde = [ 0.5 0.1 0.1 0.1
    0.1 0.5 0.1 0.1
    0.1 0.1 0.5 0.1
    0.1 0.1 0.1 0.5];
 
  pts_tilde = [ pts; ones(1,size(pts,2)) ]
  c = S_tilde * pts_tilde
  theta = 0
while theta <= 2*pi
    theta = theta + pi/120
    if theta  >= 2 * pi
        theta = 0
    end

    T_tilde = [ 1.0 0.0 0.0 0.0;
            0.0 1.0 0.0 0.0;
            0.0 0.0 1.0 0.0;
            0.0 0.0 0.0 1.0 ];
     A = [cos(theta) sin(theta) 0.0 0.0;
     -sin(theta) cos(theta) 0.0 0.0;
     0.0 0.0 1.0 0.0;
     0.0 0.0 0.0 1.0]
 

 pts_prime  = T_tilde * pts_tilde;
 
 rotation1 = A * c


rotation = A  * pts_prime;

showCube(rotation,'g', rotation1, 'b')

end


function showCube(x, c, y, d)
hold on;

idx1 = [ 1 5 7 3 1 ];
e1 = plot3(x(1,idx1),x(2,idx1),x(3,idx1),'Color',c, 'Marker','o','LineWidth',2);
e2 = plot3(y(1,idx1),y(2,idx1),y(3,idx1),'Color',d, 'Marker','o','LineWidth',2);

idx2 = [ 2 6 8 4 2 ];
f1 = plot3(x(1,idx2),x(2,idx2),x(3,idx2),'Color',c, 'Marker','o','LineWidth',2);
f2 = plot3(y(1,idx2),y(2,idx2),y(3,idx2),'Color',d, 'Marker','o','LineWidth',2);

% Link the two squares
a1 = plot3(x(1,1:2),x(2,1:2),x(3,1:2),'Color',c, 'Marker','o','LineWidth',2);
b1 = plot3(x(1,5:6),x(2,5:6),x(3,5:6),'Color',c, 'Marker','o','LineWidth',2);
c1 = plot3(x(1,7:8),x(2,7:8),x(3,7:8),'Color',c, 'Marker','o','LineWidth',2);
d1 = plot3(x(1,3:4),x(2,3:4),x(3,3:4),'Color',c, 'Marker','o','LineWidth',2);

a2 = plot3(y(1,1:2),y(2,1:2),y(3,1:2),'Color',d, 'Marker','o','LineWidth',2);
b2 = plot3(y(1,5:6),y(2,5:6),y(3,5:6),'Color',d, 'Marker','o','LineWidth',2);
c2 = plot3(y(1,7:8),y(2,7:8),y(3,7:8),'Color',d, 'Marker','o','LineWidth',2);
d2 = plot3(y(1,3:4),y(2,3:4),y(3,3:4),'Color',d, 'Marker','o','LineWidth',2);



pause(0.1)
delete(a1);
delete(b1);
delete(c1);
delete(d1);
delete(e1);
delete(f1);
delete(a2);
delete(b2);
delete(c2);
delete(d2);
delete(e2);
delete(f2);

return