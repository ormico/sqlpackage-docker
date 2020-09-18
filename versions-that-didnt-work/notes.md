This folder holds copies of several attempts at getting this working. I ended up using the SQL Server base image which is not an optimal solution. 

I'm keeping these examples to refer back to in the future if I attempt to use a different/smaller base image again.

# Globalization problems
I ran into Globalization issues on some of the not working versions. Tried updating `sqlpackage.runtimeconfig.json` and setting `ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false`. I tried setting true and false but couldn't get rid of the error.
* https://github.com/dotnet/core/issues/2186#issuecomment-472559583

# libssl
I also ran into a lot of issues with sqlpackage reporting missing libssl even if a recent version of libssl was installed. I hypothosized that either sqlpackage cannot find the new version or is only looking for an old copy. 

I found that installing `libssl1.0.0` could get past this error but required telling apt-get to look in an older index as it doesn't seem to be listed in the index for more recent versions of Ubuntu.