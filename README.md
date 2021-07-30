# SwissEph Perl module

version 2.10.01

## Introduction

The README is used to introduce the module and provide instructions on
how to install the module, any machine dependencies it may have (for
example C compilers and installed libraries) and any other information
that should be provided before the module is installed.

## Documentation

Documentation is contained in file lib/SwissEph.pm in Perl's pod format.

It can be accessed with: 

perldoc lib/SwissEph.pm

or, once the module is installed,  with

perldoc -m SwissEph

## Installation

### On Linux, with dynamical library libswe.so

The default iinstallation expects a dynamical library libswe.so to be installed,
which has to be at leastof the same release version as the Perl module.

You should download the source code from its Github repo https://github.com/aloistr/swisseph
or from the download directory  https://www.astro.com/ftp/swisseph/
Download  swe_unix_src_2.10.tar.gz or whatever the latest version is, or the one you want to use.

There will be a src directory in the unpacked files. Go there and run
  make libswe.so
to build the shared library.  Copy this file to /usr/local/lib64/swe 

Usually, this will also require that you create a file (as root)
  /etc/ld.so.conf.d/swisseph.conf
with the content line
  /usr/local/lib64/swe

Now run ldconfig(8) (as root) in order to generate the
symbolic links required.

Now you can install the Perl module for the Swiss Ephemeris.
Type the following:
```
perl Makefile.PL
make
make test
make install	(requires root)
```

### On Linux, with statically linked Swiss Ephemeris libary

There exists the option to link statically with the library libswe.a wich you
build on your system. Proceed as above regarding downloading and compiling Swiss Ephemeris source code.

Instead of 'make libswe.so' say 'make libswe.a'

Now you need to know the full path to the built library libswe.a, for example /home/myself/sweph/src/libswe.a

Run Makefile.PL with these arguments:

```
perl Makefile.PL LIBS='' MYEXTLIB='/home/myself/sweph/src/libswe.a'
make
make test
make install	(requires root)
```


### On Windows:

Before installing this module, you have to install the following things
on your computer:

- the Swiss Ephemeris DLL swedll32.dll. If haven't done this yet,
  download the Swiss Ephemeris from the download area at 
  https://www.astro.com/swisseph and unpack it.

- Visual C++ Express Edition, which can be downloaded for free from the
  http://www.microsoft.com/express/download/.

After that you can install the Perl module. In the current directory 
(where you read this README file), open the file Makefile.PL and
fix the LIBS parameter. It must contain the directory to the Swiss Ephemeris
DLL. After that run:

```
perl Makefile.PL
nmake
nmake test
nmake install
```


## COPYRIGHT AND LICENCE

Copyright (C) 2021 Astrodienst, Zurich, Switzerland.

The Perl module SwissEphe is work derived from the original release of the Astrodienst Swiss Ephemeris library.
To use it, the licensing conditions imposed by Astrodienst for Swiss Ephemeris must
be fulfilled. A copy of the license file is found in https://www.astro.com/ftp/swisseph/LICENSE.

Please note: since Swiss Ephemeris release 2.10.01 the GPL license has been
replaced with the AGPL license, as one of the options in Astrodienst's dual licensing model.

## History

The SwissEph perl module is based on earlier work up to 2008 by Rüdiger Plantiko, see
http://www.astrotexte.ch/sources/swe_perl.html (in German)

Dieter Koch at Astrodienst took over in 2008 and maintained the module for Astrodienst's internal use,
until 2020. It was made available for download since 2009, in https://www.astro.com/ftp/swisseph/src/

In July 2021, the module was migrated to Github by Alois Treindl, and it is now maintained on GitHub.

