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


function q = plus (p1, p2)
  n = max([degree(p1), degree(p2)]);

  c = [];
  for i = 1:n + 1
    if ((i <= degree(p1) + 1) && (i <= degree(p2) + 1))
      c = [c(:).', p1.coeff(i) + p2.coeff(i)];
    elseif ((i > degree(p1) + 1) && (i <= degree(p2) + 1))
      c = [c(:).', p2.coeff(i)];
    elseif ((i > degree(p2) + 1) && (i <= degree(p1) + 1))
      c = [c(:).', p1.coeff(i)];
    endif
  endfor
  q = quaternionpolynom(c);
endfunction

