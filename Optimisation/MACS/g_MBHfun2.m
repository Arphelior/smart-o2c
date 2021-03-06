function g=g_MBHfun2(x,func,lambda,z,zstar,arg)
% This Source Code Form is subject to the terms of the Mozilla Public
% License, v. 2.0. If a copy of the MPL was not distributed with this
% file, You can obtain one at http://mozilla.org/MPL/2.0/. */
%
%-----------Copyright (C) 2016 University of Strathclyde-------------
%
%
%

f=func(x,arg{:});

%g=lambda*((f-z).^2)';
%f2 = (f-z)./((zstar-z));

% in case zstar==z we have a Nan... to avoid it, i don't normalise in that
% case (also because in the single objective case zstar always equals z)

f2 = (f-z)./(((zstar-z).*((zstar-z)~=0))+((zstar-z)==0));

% trick to keep the sign :D
[~,index]= max(lambda.*abs(f2));
g = lambda(index)*f2(index);

%g = f(index);

return
