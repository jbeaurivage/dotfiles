# Manjaro on Mac

This repo lists notes for setting up and installing Manjaro Linux on a MacBook Air (13-inch, Mid 2013).
The machine is running macOS Mojave 10.14.6 (18G1012) at time of instal.

## 1. Backing up OSX
Make sure to have a back up of OSX. Use Time Machine if necessary.

## 2. Partitioning the hard drive
First step is to create a partition for Linux to run on.
If Disk utility lists a large amount of purgeable data, try filling up the hard drive to almost full capacity by running

```dd if=/dev/random of=/my/large/file bs=32m```

and `cp`ing this file as necessary. OSX won't let the main drive be partitioned if Time Machine is running. Run

```tmutil disable```

as sudo, then partition the drive with Disk Utility. It may also be a good idea to remove the local Time Machine snapshots by running

```tmutil thinlocalsnapshots / 10000000000 1```

if Disk utility is stubborn and doesn't let the drive be partitioned.

Make sure to re-enable Time Machine with

```tmutil enable```

as sudo.
