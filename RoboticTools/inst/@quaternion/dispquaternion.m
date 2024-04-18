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


function s = dispquaternion (p)
  s = [""];

  re = re(p);
  im = im(p);

  if (im(1) == 0)
    im(1) = 0;
  endif
  if (im(2) == 0)
    im(2) = 0;
  endif
  if (im(3) == 0)
    im(3) = 0;
  endif

  if (im(1) < 0)
    v1 = "";
  else
    v1 = "+";
  endif
  if (im(2) < 0)
    v2 = "";
  else
    v2 = "+";
  endif
  if (im(3) < 0)
    v3 = "";
  else
    v3 = "+";
  endif

  s = [s, num2str(re), v1, num2str(im(1)), "*i", v2, num2str(im(2)), "*j", v3, num2str(im(3)), "*k"];
  s;
endfunction
