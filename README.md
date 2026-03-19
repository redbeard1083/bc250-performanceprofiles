# bc250-performanceprofiles
Easy way to change performance profiles for CPU and GPU overclocking on the BC-250.

This is a simple script to adjust CPU and GPU overclock settings as quickly as possible. (Full disclosure: I did use ChatGPT to produce the first iteration of this script and later Claude to combine them into a single script file)

Dislaimer:  I am not responsible for any harm caused by these scripts and you use them at your own risk.  The 4ghz settings will require adequate cooling.

Requirements:
CPU overclock already installed: https://github.com/bc250-collective/bc250_smu_oc/

GPU overclock already installed: https://github.com/filippor/cyan-skillfish-governor/tree/smu or https://github.com/NexGen-3D-Printing/SteamMachine

Installation:
Download script and place it in home folder.
Set executable in terminal with:
chmod +x overclock_menu.sh

To Run this, open a terminal and type:
./overclock_menu.sh

Running the script from command line will present the following menu:

Performance Options:

 1) High                 - CPU 4ghz, GPU 2350mhz, 90C Max Overclock
 2) Medium High          - CPU 3.85ghz, GPU 2100mhz, 80C Moderate Overclock
 3) Medium Low           - CPU 3.5ghz (stock), GPU 2100mhz, 80C Balanced Overclock
 4) Low                  - CPU 3.5ghz (stock), GPU 2000mhz, 80C Quiet GPU Overclock
 5) Very Low (Stock)     - CPU 3.5ghz (stock), GPU 1500mhz, 80C Quiet GPU Overclock

Enter the number of the performance profile to apply (or 0 to exit):


Optional:
The Decky Terminal plugin allows easy access to this script from game mode.
