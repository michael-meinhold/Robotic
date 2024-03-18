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

## -*- texinfo -*-
## @deftypefn  {} {} quaternion ()
## Create the quaternion
##
## @example
## 0 + 0 * i + 0 * j + 0 * k
## @end example
##
## @deftypefnx {} {} quaternion (@var{x})
## Create a quaternion object representing the Quaternion
##
## @example
## x0 + x1 * i + x2 * j + x3 * k
## @end example
##
## @noindent
## from a vector of complex valued components @var{x}=[x0 x1 x2 x3].
## @end deftypefn
##
## @deftypefnx {} {} quaternion (@var{x0}, @var{x1}, @var{x2}, @var{x3})
## Create a quaternion object representing the Quaternion
##
## @example
## X0 + X1 * i + X2 * j + X3 * k
## @end example
##
## @noindent
## from reals @var{x0}, @var{x1}, @var{x2}, @var{x3}.
## @end deftypefn

function q = quaternion (x)

    if (nargin > 1)
      print_usage ();
    endif

    if (nargin == 0)  # q=quaternion()
     q.re = 0;
     q.im = [x(2), x(3), x(4)];
     q = class (q, "quaternion");
    else
      if (isa (x, "quaternion"))
        q = x;
      elseif ((isreal (x) || iscomplex (x)) && isvector (x))
        q.re = x(1);
        q.im = [x(2), x(3), x(4)];
        q = class (q, "quaternion");
      else
        error ("@quaternion: A must be a real vector");
      endif
    endif

endfunction
