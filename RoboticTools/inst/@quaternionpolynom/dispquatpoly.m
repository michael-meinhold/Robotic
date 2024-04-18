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


function s = dispquatpoly (p)
  n = length(p.coeff);
  s = [""];

  for i = 1:n
    c = p.coeff(i);
    q0 = re(c);
    q1 = im(c)(1);
    q2 = im(c)(2);
    q3 = im(c)(3);

    if (q1 == 0)
      q1 = 0;
    endif
    if (q2 == 0)
      q2 = 0;
    endif
    if (q3 == 0)
      q3 = 0;
    endif

    v1 = "+";
    v2 = "+";
    v3 = "+";

    if (q1 < 0)
      v1 = "";
    endif
    if (q2 < 0)
      v2 = "";
    endif
    if (q3 < 0)
      v3 = "";
    endif

    if ( not(i == n) )
      s = [s, "(", num2str(q0) , v1, num2str(q1), "*i", v2, num2str(q2), "*j", v3, num2str(q3), "*k)*X^", num2str(i-1), "+"];
    else
      s = [s, "(", num2str(q0) , v1, num2str(q1), "*i", v2, num2str(q2), "*j", v3, num2str(q3), "*k)*X^", num2str(i-1)];
    endif

  endfor
  s;
endfunction
