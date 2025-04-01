function cm_data=my_map(m)

%Gray = uninjured
%Orange = injured but no feedback
%Pink = feedback below cut x1 feedback above cut
%Green = feedback below cut x2 feedback above cut     [0.8500, 0.3250, 0.0980],
%Blue = feedback below cut x4 feedback above cut
%Red = feedback below cut x8 feedback above cut      [1, 0, 0]
%Black = feedback below cut x10 feedback above cut

cm = [[ 0.5,0.5,0.5],
      [0.75, 0, 0.75],
      [0, 0, 1], 
      [0, 0, 0],
      [0.8500, 0.3250, 0.0980]];



if nargin < 1
    cm_data = cm;
else
    hsv=rgb2hsv(cm);
    cm_data=interp1(linspace(0,1,size(cm,1)),hsv,linspace(0,1,m));
    cm_data=hsv2rgb(cm_data);
  
end
end