## Copyright (C) 2024   Michael Meinhold
##
##This file is part of robotictools.
##
##    robotictools is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    robotictools is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with robotictools.  If not, see <http://www.gnu.org/licenses/>.

function M = plotmotion (symA,syma,t,t1,t2,n)

list=linspace(t1,t2,n);

figure
axis equal
hold on

for i=1:length(list)
  t=list(i);
  U = eval(syma);
  T = eval(symA);
  plot3(U(1),U(2),U(3),'marker','o','color','k','markerfacecolor','k','markersize',5);
  quiver3(U(1),U(2),U(3),T(1,1),T(2,1),T(3,1),'r','showarrowhead','off','LineWidth',2);
  quiver3(U(1),U(2),U(3),T(1,2),T(2,2),T(3,2),'b','showarrowhead','off','LineWidth',2);
  quiver3(U(1),U(2),U(3),T(1,3),T(2,3),T(3,3),'c','showarrowhead','off','LineWidth',2);
  pause(0.1)
end

endfunction
