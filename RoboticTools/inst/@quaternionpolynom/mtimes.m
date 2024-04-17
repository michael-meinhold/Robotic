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


function q = mtimes (p1, p2)
  n1 = degree(p1) + 1;
  n2 = degree(p2) + 1;
  n = n1 + n2;
  c1 = [];
  c2 = [];
  c = [];

  for i = 1:n
    if (i <= n1)
      c1 = [c1(:).', p1.coeff(i)];
    else
      c1 = [c1(:).', quaternion([0,0,0,0])];
    endif
    if (i <= n2)
      c2 = [c2(:).', p2.coeff(i)];
    else
      c2 = [c2(:).', quaternion([0,0,0,0])];
    endif
  endfor

  for k = 1:n
    d = quaternion([0,0,0,0]);
    for i = 1:k
      d = d + c1(i) * c2(k-i+1);
    endfor
    c = [c(:).', d];
  endfor

  q = quaternionpolynom(c);
endfunction
