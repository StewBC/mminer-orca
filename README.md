# Manic Miner - Orca/M version

This is the exact same version as the mminer-apple2 version (https://github.com/StewBC/mminer-apple2), except this has been changed to compile with the Orca/M assembler.  Orca/M is an assembler that runs on Apple II hardware (I am using the Apple IIgs version, even though I am targeting the Apple II).  I am also using this software on Windows - see below.

To learn more about Orca/M, see https://juiced.gs/store/opus-ii-software/

## Building

The Makefile is for GNU Make and I am using it on a Windows PC.  It needs a few environment variables to be set.  These are:

1. AWK and SED which turns the linker symbol output into a form usable with AppleWin.  This can be commented out as it is not at all esential - it's only good for seeing the labels in the AppleWin debugger.  If you use PowerShell on Windows, the below will set the AWK and SED environment variables:

$env:AWK="`"C:/Program Files/Git/usr/bin/gawk.exe`""
$env:SED="`"C:/Program Files/Git/usr/bin/sed.exe`""

(Notice the back-tick quoting of the inner quotes so PowerShell doesn't freak out)

2. I use Cadius (https://www.brutaldeluxe.fr/products/crossdevtools/cadius/) to add the executable to a disk image.  I also formatted the code using Cadius.  The following is where I have cadius installed:

$env:CADIUS="C:/Users/swessels/Apps/bin/Cadius.exe"

Cadius uses a hidden file called _FileInformation.txt to store meta information about the files it manipulates in the image.  The most important bits are MMINER=Type(06),AuxType(4000) which says the file MMINER should be given the Binary type and Auxiliary data of $4000.

3. Lastly, I use Orca with GoldenGate to compile on a Windows PC.  To learn more about GoldenGate, look at https://juiced.gs/store/golden-gate/

$env:ORACInclude="C:/ProgramData/GoldenGate/Libraries/ORCAInclude"

Once all is set to go, the first step is:
make macros

If this doesn't work, make sure the file src/Macros/macros.s has LF line endings.  If it is CRLF then macgen is unhappy.

Then make will build or make dsk will build and generate mminer.po or make test which will make the disk and run it in an emulator (Configured for AppleWin).

make clean will delete intermediate files and make zap will delete intermediate files as well as remove the obj folder.

I think that's about it!
Stefan Wessels
swessels@email.com
18 August 2021
