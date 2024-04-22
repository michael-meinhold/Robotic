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


function v = getaxis2 (Q, eps)
  if (nargin == 1)
    eps = 1.0E-09;
  endif

  n = sqrt(norm(Q));
  if (abs(1.0 - n) >= eps)
    error("@getaxis2: quaternion is not a unit quaternion / versor");
  endif

  m = norm(im(Q));
  if (m <= eps)
    error("@getaxis2: vector part of quaternion is zero");
  endif

  v = im(Q)*1/m;
endfunction
