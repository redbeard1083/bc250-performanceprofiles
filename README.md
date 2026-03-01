# bc250-performanceprofiles
Easy way to change performance profiles for CPU and GPU overclocking on the BC-250.

Dislaimer:  I am not responsible for any harm caused by these scripts and you use them at your own risk.

Requirements:
CPU overclock already installed: https://github.com/bc250-collective/bc250_smu_oc/
GPU overclock already installed: https://github.com/NexGen-3D-Printing/SteamMachine

Installaion:
Download repoistory as zip, extract and copy folder to home directory, set all script files executable.

To Run:
./oc.sh

This is a simple script to adjust CPU and GPU overclock settings as quickly as possible.

Full disclosure: I did use chatgpt to produce the menu script.# bc250-performanceprofiles
Easy way to change performance profiles for CPU and GPU overclocking on the BC-250

Runnign the script from command line will present the following menu:

Performance Options:

 1) High                 - CPU 4ghz, GPU 2350mhz, 90C Max Overclock
 2) Medium High          - CPU 3.85ghz, GPU 2100mhz, 80C Moderate Overclock
 3) Medium Low           - CPU 3.5ghz (stock), GPU 2100mhz, 80C Balanced Overclock
 4) Low                  - CPU 3.5ghz (stock), GPU 2000mhz, 80C Quiet GPU Overclock

Enter the number of the performance profile to apply (or 0 to exit):
