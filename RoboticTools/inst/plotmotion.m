## Copyright (C) 2024   Michael Meinhold
##
##    This file is part of robotictools.
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

# usage: plotmotion (symA,syma,t,t1,t2,n)
#
# This function generates a sequence of
# poses of the moving frame of an contineous one-parameter
# spatial motion.
#
# Therefor the package 'symbolic' is needed.
# Run 'pkg install symbolic-3.2.1.tar.gz' to install package,
# afterwards run 'pkg load symbolic'.
#
# Inputs of the function 'plotmotion' are the pair consisting of an
# orthogonal matrix 'symA' and a translation vector 'syma',
# both depending of a symbolic parameter 't'. The spatial motion
# of the moving frame is visualised within the interval 't1<t<t2'
# by 'n' steps.

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
