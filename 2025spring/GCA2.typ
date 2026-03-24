#import "../book.typ": book-page
#import "@preview/dvdtyp:1.0.1": *
#show: book-page.with(title: "GCA2")

#show: dvdtyp.with(
  title: "The 2nd GEOS-Chem Asia Meeting (GCA2) Quick notes",
  author: "Otto Deng"
)
#outline()


= Running GEOS-Chem with WRF (WRF-GC)
fuzm\@sustech.edu.cn

#definition()[
  WRF + GEOS-Chem
  
  pyisical options, atm chem 
]
== Why using WRF-GC?
- Online two-way coupling mmeteorology-chemistry model
- Regional atmospheric chem and air quality modeling

Rapidly capture the reginal patterns. 

- Easier than WRF-Chem: Pre-defined chemistry options

== Installation

=== Environment Configuration
- Compliler: `Fortran`
- MPI Library: `OpenMPI`,`MVAPICH`
- NetCDF: `NetCDF4`

=== Downloading 
```shell 
wrf-gc/
  - WRF/

```

=== Compling WRF-GC
*Configuring WRF compile*

Go to the `WRF` folder:
```
./configure
```

Installing the GEOS-Chem species into WRF

Go to the `WRF/chem` folder and run `make install_registry`.

It should look like this:
  ```shell 
WRF/chem$ ls
chem_driver.F           Makefile                gc              config
wrfgc_convert_state_mod.F ...
  ```

*Compiling WRF-GC*

Go back to the `wrf-gc` folder and run:
```
./compile em_real
```

Wait patiently. The process may take up to 2 - 4 hours depending on your system. 

When successful, you should see the following message:
```shell
==========================================================================
build started:   Sun Apr 15 12:00:00 CST 2018
build completed: Sun Apr 15 13:00:00 CST 2018
--->                  Executables successfully built                  <---
-rwxrwxr-x 1 hplin hplin 63670720 Apr 15 05:34 main/ndown.exe
-rwxrwxr-x 1 hplin hplin 63753008 Apr 15 05:35 main/real.exe
-rwxrwxr-x 1 hplin hplin 62683008 Apr 15 05:34 main/tc.exe
-rwxrwxr-x 1 hplin hplin 71153896 Apr 15 05:34 main/wrf.exe
==========================================================================
```

*Compiling WPS*
+ Go one level up and then into the `WPS` folder.
+ Run `./configure`.
+ Run `./compile`.

```
./make_mozbc
```

Running WPS

Configuring WRF-GC input

`HEMCO_Config.rc` 

`geochem_config.yml`

`namelist.input`

Running WRF-GC

```

```

= Working with the high-performance GEOS-Chem (GCHP)

== Introduction to GCHP
- GGCHP can be run on muktiple nodes
- GCHP has good scaalability


#definition("Gube-sphere grid")[
  The globe is divided into 6 faces, like a cube

  The resolution is decribed as CN.
]
Feature: grid-stretching

- Target long $T_theta$
- Target lat $T_phi$
- Stretch factor $S$

The finnest resolution is $"CN" times S$

The coarsest resolution is $"CN"/S$

A good alternative to nested-grid simulation by GC classic

= Usage of GCHP
Build the Environment with Spack(simiilar to conda)




= Working with the GEOS-Chem adjoint

== When to use an adjoint model?
+ 


= Running GC within CESM 