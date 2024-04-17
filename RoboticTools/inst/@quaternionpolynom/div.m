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

function [q, r] = div (f, g)
  degf = degree(f);
  degg = degree(g);

  if (degg > degf)
    q = quaternionpolynom(quaternion([0,0,0,0]));
    r = f;
  else
    q = quaternionpolynom([quaternion([0,0,0,0])]);
    f1 = f;
    while (degree(f1) >= degg )
      c = lc(f1) * inverse(lc(g));
      cp = [c];
      for j = 1:degree(f1) - degree(g)
        cp = [quaternion([0,0,0,0]), cp(:).'];
      endfor
      p = quaternionpolynom(cp);
      q = q + p;
      f1 = f1 - (p * g);
    endwhile

    r = f1;
  endif
endfunction

