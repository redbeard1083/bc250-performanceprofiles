echo "CPU 3.5ghz (stock), GPU 1500mhz, 80C Quiet GPU Overclock"
sudo cp cpu_undervolt_3.5ghz.conf /etc/bc250-smu-oc.conf
sudo systemctl restart bc250-smu-oc.service
sudo systemctl daemon-reload
sudo cp gpu_overclock_1500mhz.toml /etc/cyan-skillfish-governor-smu/config.toml
sudo systemctl restart cyan-skillfish-governor-smu.service
echo "Done!"
