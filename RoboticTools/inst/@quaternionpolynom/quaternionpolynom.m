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

function p = quaternionpolynom (c)

if (isa(c, "quaternion") && isvector(c))
  d = 1;
  for i = 1:length(c)
    if (not(norm(c(i)) == 0))
      d = i;
    endif
  endfor

  c1 = c(1:d);
  p.coeff = c1;
  p = class (p, "quaternionpolynom");
 else
  error("@quaternionpolynom: list of quaternions required.")
 endif
endfunction


