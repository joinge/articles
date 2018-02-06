if isunix
   [~, hostname] = system('hostname');
   [~, user]     = system('whoami');
   joinge = strcmp(user(1:end-1),'me') && strcmp(hostname(1:end-1), 'Desktop');       % AMD Desktop with Linux
else
   [~, hostname]  = system('hostname');
   [~, user]      = system('echo %USERNAME%');
   joinge_laptop  = strcmp(user(1:end-1),'Laptop') && strcmp(hostname(1:end-1), 'Laptop'); % Nvidia Laptop with Windows
   joinge_desktop = strcmp(user(1:end-1),'me')     && strcmp(hostname(1:end-1), 'Desktop'); % AMD Desktop with Windows 
   
   joinge = joinge_laptop || joinge_desktop;
end
%slantrange = 100.324018;
%altitude = 22.743674;
slantrange = 104.678520;
altitude = 24.909445;
groundrange = sqrt(slantrange^2 - altitude^2);
burydepth = 0.533-0.27;
angle = 105;
length = 2.6;

h = 0.18; h2 = 0.47; s = h/(altitude-h)*slantrange; slope = (asin(h2/s)-asin(altitude/slantrange))* 180/pi;
%slope = 0

cam_pos = [0 -groundrange altitude];
r_bounds = [(groundrange - 5) (groundrange + 5)];
c = 1500;
fc = 100e3;
fs = 40e3;
d  = 1.2;

% Don't set image size too low or strange things might happen.
% If you experience images with large areas of 1s or 0s then
% this is probably the reason.
image_Nx = 300;
image_Ny = 400;
x_os = 3;
y_os = 2;

screen_Nx = 1200;
screen_Ny = 800;

%objfile = 'data-models/unit_cylinder.dae';
objfile = 'data-models/manta3.dae';
% seafile = '../../tools/vrml-models/cylinder_plane_red.dae';
% objfile = '../../data-models/bench.obj';
seafile = 'data-models/plane.dae';
%objtransform = [0 groundrange -altitude+0.533/2-burydepth  0 0 (angle-90) 0.533 length 0.533];
objtransform = [0 groundrange -altitude  slope 0 0 1 1 1];
seatransform = [0 groundrange -altitude  slope 0 0  2 2 2];
image  = [-5 5 image_Nx (groundrange - 5) (groundrange + 5) image_Ny x_os y_os 1];
screen = [screen_Nx screen_Ny];

%                         theta  phi  fov            ortho
camorientation = [cam_pos  0    63.435   23   r_bounds   1];
sonar = [c fc fs d];

rdim = [sqrt((abs(cam_pos(2))+image(1))^2+cam_pos(3)^2), ...
        sqrt((abs(cam_pos(2))+image(2))^2+cam_pos(3)^2)];
    
if joinge_laptop
   device = [1 0];
else
   device = [0 0];
end

if ispc % Windows
    executable = '.\debug\bin\sim ';
else % Linux
    executable = './debug/bin/sim ';
end

cmd = [executable, ...
...%       ' --batch ', ...
...%       ' --debug ', ...
       ' --objfile ',        objfile, ...
       ' --seafile ',        seafile, ...
       ' --objtransform ',   num2str(objtransform), ...
       ' --seatransform ',   num2str(seatransform), ...
...%        ' --camorientation ', num2str(camorientation), ...
       ' --objmaterial ',    '.8 .2 0 0', ...
       ' --seamaterial ',    '.1 .2 0 0', ...
       ' --image ',          num2str(image), ...
       ' --screen ',         num2str(screen), ...
       ' --mode ',           '0',...
       ' --device ',         num2str(device), ...
       ' --c ',              num2str(c), ...
       ' --fc ',             num2str(fc), ...
       ' --fs ',             num2str(fs), ...
       ' --d ',              num2str(d), ...
       ' --output ',          '1 1'];
                  

if joinge && isunix % Since I'm using experimental GCC
  setenv('LD_LIBRARY_PATH', '/usr/lib64/gcc/x86_64-pc-linux-gnu/4.9.0-alpha20140105/');
end

if 1
   [status,cmdout] = system(cmd)
else
   t = tcpip('127.0.0.1', 331)
   fopen(t)
   fwrite(t, cmd)
end
disp(cmdout);

sim_image_file = fopen('data_dump_image.txt', 'r');
sim_image = fscanf( sim_image_file, '%f' );
sim_image = reshape(sim_image, 3, image_Nx*x_os, image_Ny*y_os);
sim_image = permute(sim_image, [3,2,1]);
sim_depth_map = squeeze(sim_image(:,:,2));
sim_image = squeeze(sim_image(:,:,1));
sim_image(sim_image > 1) = 1;
sim_image(sim_image < 0) = 0;
% sim_image = squeeze(sim_image(:,:,3));
% sim_image = sim_image/max(sim_image(:));
% sim_image = rgb2gray(sim_image);
fclose(sim_image_file);

% sim_depth_map_file = fopen('data_dump_depth.txt', 'r');
% sim_depth_map = fscanf( sim_depth_map_file, '%f' );
% sim_depth_map = reshape(sim_depth_map, image_Nx, image_Ny);
% sim_depth_map = permute(sim_depth_map, [2,1]);
% sim_depth_map = sim_depth_map/2;

% fclose(sim_depth_map_file);

real_sonar_image_file = fopen('data_dump_sonar_image.txt', 'r');
real_sonar_image = fscanf( real_sonar_image_file, '%f' );
real_sonar_image = reshape(real_sonar_image, image_Nx, image_Ny);
real_sonar_image = permute(real_sonar_image, [2,1]);
% real_sonar_image = permute(real_sonar_image, [2,1]);
% sonar_image = sonar_image(:,:,1:3);
% sim_image(sim_image > 1) = 1;
% sim_image(sim_image < 0) = 0;

% Convert to intensity
% sim_image = norm(sim_image(1,:,:), sim_image(1,:,:), sim_image(1,:,:));

figure();
if joinge_desktop
%    dims = get(gcf,'Position');
%    set(gcf,'Position', [2000,300,dims(3),dims(4)])
   if isunix
      set(gcf,'Position', [2000,300,1200,1200])
   else
      set(gcf,'Position', [-1200,0,1200,1000])
   end
end
subplot(2,2,1), imshow( sim_image, [] );
title('Rendered image, intensities');
xlabel('Along track'); ylabel('Range');
axis fill
set(gca,'YDir','normal');
subplot(2,2,2), imshow( sim_depth_map, [] );
title('Rendered image, depth map');
xlabel('Along track'); ylabel('Range');
set(gca,'YDir','normal');
% axis fill
% Direct scattering:
%
% for each range line
%    - find minimum and range (from depth map)
%    - add intensities for same range up
% sim_image = rgb2gray(sim_image);
r_max = max(sim_depth_map(:));
r_min = min(sim_depth_map(:));

dr = (r_max-r_min)/image_Ny;

sonar_image = zeros( image_Ny, size(sim_image,2) );
r = r_min;
for image_y = 1:image_Ny
    mask = sim_depth_map>=r & sim_depth_map<r+dr & sim_image ~= 1;
    I = sim_image .* mask;
    sonar_image(image_y, :) = sum(I,1);
    r = r + dr;
end

% A = -sum(r_bounds)/diff(r_bounds);
% B = -2.0*prod(r_bounds)/diff(r_bounds);
% dr = diff(r_bounds)/Nr;
% % zn_bounds = (-A*r_bounds + B)./(-r_bounds);
% if image(3) == 0
%     linearized_sonar_image = zeros( Nr, size(sim_image,2) );
%     r = r_bounds(1);
%     [y x] = ndgrid( 1:Nr, 1:Nx );
%     for ri = 1:Nr
%         zn = (-A*r + B)/r;
%         linearized_sonar_image(ri,:) = interp2( x, y, sonar_image, 1:Nx, (zn+1)*Nr/2 );
%         r = r + dr;
%     end
% end

% sonar_image = 10*log10(sonar_image);
subplot(2,2,3);
r = [r_min, r_max];
r = image(4:5)*sin(atan( objtransform(2) / -objtransform(3)))+1;
r = sqrt(image(4:5).^2 + seatransform(3)^2);
% imshow( 20*log10(sonar_image), []);
imagesc( [image(1),image(2)], r, 10*log10(sonar_image) );
title('Matlab sonar image');
xlabel('Along track'); ylabel('Range');
set(gca,'YDir','normal');
% axis equal

% subplot(2,2,4);
% % imshow( 20*log10(sonar_image), []);
% imagesc( [1,Nx], r_bounds, linearized_sonar_image);
% title('Linearized "sonar" image');
% xlabel('Along track'); ylabel('Range');
% set(gca,'YDir','normal');
% % axis equal

% set(findall(gca,'-property','FontSize'),'FontSize',16) 

subplot(2,2,4), imagesc( [image(1),image(2)], r, 10*log10(real_sonar_image) );
title('Rendered sonar image, intensities');
xlabel('Along track'); ylabel('Range');
% axis fill
set(gca,'YDir','normal');

med = median(median(real_sonar_image));
out.im = real_sonar_image;
out.segm = (real_sonar_image > 1.01*med) - (real_sonar_image < 0.99*med);
out.res.x = diff(image(1:2))/size(real_sonar_image,2);
out.res.y = diff(r)/size(real_sonar_image,1);
out.alignType = 1;
out.x = image(1);
out.y = r(1);

filename = [ 'c_Manta_cid_2_range_' num2str(slantrange) '_alt_' num2str(altitude) '_a_' num2str(angle) '_b_' num2str(burydepth) '.mat'];
path = 'C:\arbeid\GitHub\ffi-simulator9-v0.5\templates';
save(fullfile(path,filename),'-struct','out');


