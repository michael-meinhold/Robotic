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

function F = factorize (p)
  ff = quatpoly2complex(conjugate(p) * p);
  z = roots(flip(ff));
  z2 = [];
  factors = [];

  for i = 1:length(z)
    if (not(iscomplex(z(i))))
      error("@quaternionpolynom: @factorize: quaternion polynom has real zeros.")
    endif
  endfor

  while (length(z) > 0)
    l = z(abs(z-conj(z(1))) < 1E-6);

    if (length(l) == 0)
      error("@quaternionpolynom: @factorize: zeros must be pairs of complex numbers.")
    elseif (length(l) > 1)
      error("@quaternionpolynom: @factorize: quaternion polynom has a complex zero with multiplicity > 1.")
    endif

    z2 = [z2(:).', z(1)];
    z(z == z(1)) = [];
    z(z == l(1)) = [];
  endwhile

  quadraticfactors = [];
  for i = 1:length(z2)
    qf = complex2quatpoly([abs(z2(i))^2, -2 * real(z2(i)), 1]);
    quadraticfactors = [quadraticfactors(:).', qf];
  endfor

  for i = 1:length(quadraticfactors)
    [q, r] = div(p, quadraticfactors(i));
    a = quaternionpolynom([inverse(coeff(r)(2)) * coeff(r)(1), quaternion([1,0,0,0])]);
    [q1, r1] = div(p, a);
    n = degree(q1);

    if (n > 1)
       factors2 = factorize(q1);
       for j = 1:factorial(n)
         factors = [factors(:).', factors2(n*(j-1)+1:n*j), a];
       endfor
     elseif (n == 1)
       factors = [factors(:).', q1, a];
     else
       factors = [q1, factors(:).'];
    endif
  endfor
  F = factors;
endfunction

