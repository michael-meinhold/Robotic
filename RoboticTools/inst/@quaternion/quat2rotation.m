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


function R = quat2rotation (Q)
  E = scalarmul(Q,1/norm(Q));
  a = re(E);
  v = im(E);
  b = v(1);
  c = v(2);
  d = v(3);
  R = [a^2+b^2-c^2-d^2,2*(b*c-a*d),2*(b*d+a*c);2*(b*c+a*d),a^2-b^2+c^2-d^2,2*(c*d-a*b);2*(b*d-a*c),2*(c*d+a*b),a^2-b^2-c^2+d^2];
endfunction
