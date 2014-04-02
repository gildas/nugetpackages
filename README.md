nugetpackages
=============
Keeping my NuGet packages for [Chocolatey](http://chocolatey.org) in git.

Creation procedure
------------------

Since I keep forgetting how to do it and I end up going to the Chocolatey wiki pages all the time, let's have this here:

Prerequisites: chocolatey install warmup

```powershell
cd $HOME\nugetpackages
git pull
warmup chocolatey new-stuff
cd new-stuff
gvim new-stuff.nuspec
gvim tools\chocolateyInstall.ps1
git add new-stuff.nuspec tools\chocolateyInstall.ps1 (and all other files we need)
git commit -m "New package: new-stuff"
cpack
cinst new-stuff -source %cd%
git yadda for updated code after the previous test
git push
cpush .\new-stuff.d.d.d.yyyymmdd.nupkg
```

Done!

Notes:
- I should convert to chocolatey3 at some point!
- cinst new-stuff is for testing on the dev machine! NEVER FORGET to do it!
