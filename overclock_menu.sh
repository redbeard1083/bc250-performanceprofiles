#!/bin/bash

# ==============================================================================
# overclock_menu_combined.sh
#
# All CPU (.conf) and GPU (.toml) profiles are embedded as heredocs and written
# to temp files at runtime. Configs are installed to their real system paths
# and the appropriate systemd services are restarted automatically.
#
# Services managed:
#   CPU — bc250-smu-oc.service          → /etc/bc250-smu-oc.conf
#   GPU — cyan-skillfish-governor-smu   → /etc/cyan-skillfish-governor-smu/config.toml
# ==============================================================================

CPU_DEST="/etc/bc250-smu-oc.conf"
GPU_DEST="/etc/cyan-skillfish-governor-smu/config.toml"
CPU_SERVICE="bc250-smu-oc.service"
GPU_SERVICE="cyan-skillfish-governor-smu.service"

CPU_TMPFILE="$(mktemp /tmp/cpu_profile.XXXXXX)"
GPU_TMPFILE="$(mktemp /tmp/gpu_profile.XXXXXX)"
trap 'rm -f "$CPU_TMPFILE" "$GPU_TMPFILE"' EXIT

# ==============================================================================
# CPU PROFILE WRITERS
# ==============================================================================

write_cpu_undervolt_3_5ghz() {
    cat > "$CPU_TMPFILE" <<'EOF'
[overclock]
frequency = 3500
scale = -22
max_temperature = 90
EOF
}

write_cpu_overclock_3_85ghz() {
    cat > "$CPU_TMPFILE" <<'EOF'
[overclock]
frequency = 3850
scale = -30
max_temperature = 90
EOF
}

write_cpu_overclock_4ghz() {
    cat > "$CPU_TMPFILE" <<'EOF'
[overclock]
frequency = 4000
scale = -37
max_temperature = 90
EOF
}

# ==============================================================================
# GPU PROFILE WRITERS
# ==============================================================================

write_gpu_overclock_1500mhz() {
    cat > "$GPU_TMPFILE" <<'EOF'
# us
[timing.intervals]
sample = 500
adjust = 200_000

# MHz/ms
[timing.ramp-rates]
normal = 1
burst = 50

# number of samples
[timing]
burst-samples = 60
down-events = 5

# MHz
[frequency-thresholds]
adjust = 10

# %
[load-target]
upper = 0.60
lower = 0.40

#°C
[temperature]
throttling = 80
throttling_recovery = 75

[[safe-points]]
frequency = 350
voltage = 700

[[safe-points]]
frequency = 500
voltage = 700

[[safe-points]]
frequency = 1000
voltage = 800

[[safe-points]]
frequency = 1175
voltage = 850

[[safe-points]]
frequency = 1500
voltage = 900
EOF
}

write_gpu_overclock_2000mhz() {
    cat > "$GPU_TMPFILE" <<'EOF'
# us
[timing.intervals]
sample = 500
adjust = 200_000

# MHz/ms
[timing.ramp-rates]
normal = 1
burst = 50

# number of samples
[timing]
burst-samples = 60
down-events = 5

# MHz
[frequency-thresholds]
adjust = 10

# %
[load-target]
upper = 0.60
lower = 0.40

#°C
[temperature]
throttling = 80
throttling_recovery = 75

[[safe-points]]
frequency = 350
voltage = 700

[[safe-points]]
frequency = 500
voltage = 700

[[safe-points]]
frequency = 1000
voltage = 800

[[safe-points]]
frequency = 1175
voltage = 850

[[safe-points]]
frequency = 1500
voltage = 900

[[safe-points]]
frequency = 1600
voltage = 910

[[safe-points]]
frequency = 1700
voltage = 920

[[safe-points]]
frequency = 1850
voltage = 930

[[safe-points]]
frequency = 2000
voltage = 960
EOF
}

write_gpu_overclock_2100mhz() {
    cat > "$GPU_TMPFILE" <<'EOF'
# us
[timing.intervals]
sample = 500
adjust = 200_000

# MHz/ms
[timing.ramp-rates]
normal = 1
burst = 50

# number of samples
[timing]
burst-samples = 60
down-events = 5

# MHz
[frequency-thresholds]
adjust = 10

# %
[load-target]
upper = 0.60
lower = 0.40

#°C
[temperature]
throttling = 90
throttling_recovery = 85

[[safe-points]]
frequency = 350
voltage = 700

[[safe-points]]
frequency = 500
voltage = 700

[[safe-points]]
frequency = 1000
voltage = 800

[[safe-points]]
frequency = 1175
voltage = 850

[[safe-points]]
frequency = 1500
voltage = 900

[[safe-points]]
frequency = 1600
voltage = 910

[[safe-points]]
frequency = 1700
voltage = 920

[[safe-points]]
frequency = 1850
voltage = 930

[[safe-points]]
frequency = 2000
voltage = 960

[[safe-points]]
frequency = 2050
voltage = 980

[[safe-points]]
frequency = 2100
voltage = 1000
EOF
}

write_gpu_overclock_2300mhz() {
    cat > "$GPU_TMPFILE" <<'EOF'
# us
[timing.intervals]
sample = 500
adjust = 200_000

# MHz/ms
[timing.ramp-rates]
normal = 1
burst = 50

# number of samples
[timing]
burst-samples = 60
down-events = 5

# MHz
[frequency-thresholds]
adjust = 10

# %
[load-target]
upper = 0.60
lower = 0.40

#°C
[temperature]
throttling = 90
throttling_recovery = 85

[[safe-points]]
frequency = 350
voltage = 700

[[safe-points]]
frequency = 500
voltage = 700

[[safe-points]]
frequency = 1000
voltage = 800

[[safe-points]]
frequency = 1175
voltage = 850

[[safe-points]]
frequency = 1500
voltage = 900

[[safe-points]]
frequency = 1600
voltage = 910

[[safe-points]]
frequency = 1700
voltage = 920

[[safe-points]]
frequency = 1850
voltage = 930

[[safe-points]]
frequency = 2000
voltage = 960

[[safe-points]]
frequency = 2050
voltage = 980

[[safe-points]]
frequency = 2100
voltage = 1000

[[safe-points]]
frequency = 2125
voltage = 1020

[[safe-points]]
frequency = 2150
voltage = 1035

[[safe-points]]
frequency = 2200
voltage = 1050

[[safe-points]]
frequency = 2250
voltage = 1050

[[safe-points]]
frequency = 2300
voltage = 1075
EOF
}

write_gpu_overclock_2350mhz() {
    cat > "$GPU_TMPFILE" <<'EOF'
# us
[timing.intervals]
sample = 500
adjust = 200_000

# MHz/ms
[timing.ramp-rates]
normal = 1
burst = 50

# number of samples
[timing]
burst-samples = 60
down-events = 5

# MHz
[frequency-thresholds]
adjust = 10

# %
[load-target]
upper = 0.60
lower = 0.40

#°C
[temperature]
throttling = 90
throttling_recovery = 85

[[safe-points]]
frequency = 350
voltage = 700

[[safe-points]]
frequency = 500
voltage = 700

[[safe-points]]
frequency = 1000
voltage = 800

[[safe-points]]
frequency = 1175
voltage = 850

[[safe-points]]
frequency = 1500
voltage = 900

[[safe-points]]
frequency = 1600
voltage = 910

[[safe-points]]
frequency = 1700
voltage = 920

[[safe-points]]
frequency = 1850
voltage = 930

[[safe-points]]
frequency = 2000
voltage = 960

[[safe-points]]
frequency = 2050
voltage = 980

[[safe-points]]
frequency = 2100
voltage = 1000

[[safe-points]]
frequency = 2125
voltage = 1020

[[safe-points]]
frequency = 2150
voltage = 1035

[[safe-points]]
frequency = 2200
voltage = 1050

[[safe-points]]
frequency = 2250
voltage = 1050

[[safe-points]]
frequency = 2300
voltage = 1075

[[safe-points]]
frequency = 2350
voltage = 1100
EOF
}

# ==============================================================================
# INSTALL HELPERS
# ==============================================================================

install_cpu() {
    sudo cp "$CPU_TMPFILE" "$CPU_DEST"
    sudo systemctl daemon-reload
    sudo systemctl restart "$CPU_SERVICE"
}

install_gpu() {
    sudo cp "$GPU_TMPFILE" "$GPU_DEST"
    sudo systemctl restart "$GPU_SERVICE"
}

# ==============================================================================
# PERFORMANCE PRESET DEFINITIONS
# Each preset pairs a CPU writer and a GPU writer, matching the original scripts.
# ==============================================================================

PRESET_NAMES=(
    "High"
    "Medium-High"
    "Medium-Low"
    "Low"
    "Very Low (Stock)"
)
PRESET_DESCS=(
    "CPU 4 GHz, GPU 2350 MHz — 90°C max overclock"
    "CPU 3.85 GHz, GPU 2100 MHz — 90°C moderate overclock"
    "CPU 3.5 GHz (stock), GPU 2100 MHz — 80°C balanced"
    "CPU 3.5 GHz (stock), GPU 2000 MHz — 80°C quiet GPU overclock"
    "CPU 3.5 GHz (stock), GPU 1500 MHz — 80°C quiet GPU overclock"
)
PRESET_CPU_WRITERS=(
    write_cpu_overclock_4ghz
    write_cpu_overclock_3_85ghz
    write_cpu_undervolt_3_5ghz
    write_cpu_undervolt_3_5ghz
    write_cpu_undervolt_3_5ghz
)
PRESET_GPU_WRITERS=(
    write_gpu_overclock_2350mhz
    write_gpu_overclock_2100mhz
    write_gpu_overclock_2100mhz
    write_gpu_overclock_2000mhz
    write_gpu_overclock_1500mhz
)

# ==============================================================================
# CPU / GPU INDIVIDUAL PROFILE TABLES  (used by custom mix-and-match)
# ==============================================================================

CPU_NAMES=(
    "Undervolt 3.5 GHz (stock)"
    "Overclock 3.85 GHz"
    "Overclock 4 GHz"
)
CPU_DESCS=(
    "3500 MHz, scale -22, max 90°C"
    "3850 MHz, scale -30, max 90°C"
    "4000 MHz, scale -37, max 90°C"
)
CPU_WRITERS=(
    write_cpu_undervolt_3_5ghz
    write_cpu_overclock_3_85ghz
    write_cpu_overclock_4ghz
)

GPU_NAMES=(
    "Overclock 1500 MHz"
    "Overclock 2000 MHz"
    "Overclock 2100 MHz"
    "Overclock 2300 MHz"
    "Overclock 2350 MHz"
)
GPU_DESCS=(
    "1500 MHz max, throttle 80°C — conservative"
    "2000 MHz max, throttle 80°C — moderate"
    "2100 MHz max, throttle 90°C — moderate-high"
    "2300 MHz max, throttle 90°C — high"
    "2350 MHz max, throttle 90°C — aggressive"
)
GPU_WRITERS=(
    write_gpu_overclock_1500mhz
    write_gpu_overclock_2000mhz
    write_gpu_overclock_2100mhz
    write_gpu_overclock_2300mhz
    write_gpu_overclock_2350mhz
)

# ==============================================================================
# MENU
# ==============================================================================

show_main_menu() {
    echo
    echo "========================================================"
    echo "             Performance Profile Menu                   "
    echo "========================================================"
    echo
    echo "  Performance Presets (CPU + GPU)"
    echo "  --------------------------------------------------------"
    for i in "${!PRESET_NAMES[@]}"; do
        printf "  %2d) %-22s — %s\n" \
            "$((i + 1))" \
            "${PRESET_NAMES[$i]}" \
            "${PRESET_DESCS[$i]}"
    done
    echo
    printf "  %2d) %-22s — %s\n" \
        "$((${#PRESET_NAMES[@]} + 1))" \
        "Custom" \
        "Mix and match CPU and GPU profiles independently"
    echo
    echo "   0) Exit"
    echo
}

show_cpu_menu() {
    echo
    echo "  CPU Profiles"
    echo "  --------------------------------------------------------"
    for i in "${!CPU_NAMES[@]}"; do
        printf "  %2d) %-28s — %s\n" \
            "$((i + 1))" \
            "${CPU_NAMES[$i]}" \
            "${CPU_DESCS[$i]}"
    done
    echo
}

show_gpu_menu() {
    echo
    echo "  GPU Profiles"
    echo "  --------------------------------------------------------"
    for i in "${!GPU_NAMES[@]}"; do
        printf "  %2d) %-28s — %s\n" \
            "$((i + 1))" \
            "${GPU_NAMES[$i]}" \
            "${GPU_DESCS[$i]}"
    done
    echo
}

# ==============================================================================
# APPLY
# ==============================================================================

apply_preset() {
    local idx=$(( $1 - 1 ))
    local name="${PRESET_NAMES[$idx]}"
    local cpu_writer="${PRESET_CPU_WRITERS[$idx]}"
    local gpu_writer="${PRESET_GPU_WRITERS[$idx]}"

    echo
    echo "Applying: $name"
    echo "${PRESET_DESCS[$idx]}"
    echo

    echo "  Writing CPU config..."
    "$cpu_writer"
    echo "  Installing to $CPU_DEST and restarting $CPU_SERVICE..."
    install_cpu

    echo "  Writing GPU config..."
    "$gpu_writer"
    echo "  Installing to $GPU_DEST and restarting $GPU_SERVICE..."
    install_gpu

    echo
    echo "Done!"
}

# Prompt for a temperature value between 60 and 100.
# Usage: prompt_temperature <label> <default>
# Sets global TEMP_RESULT, or returns 1 on cancel.
prompt_temperature() {
    local label="$1"
    local default="$2"
    while true; do
        read -rp "  Enter $label temperature in °C (60–100, default ${default}, or 0 to cancel): " t
        if ! [[ "$t" =~ ^[0-9]+$ ]]; then
            echo "  Invalid input — please enter a whole number."
            continue
        fi
        if [[ "$t" -eq 0 ]]; then
            return 1
        fi
        if (( t < 60 || t > 100 )); then
            echo "  Out of range — must be between 60 and 100°C."
            continue
        fi
        TEMP_RESULT="$t"
        return 0
    done
}

apply_custom() {
    # --- CPU selection ---
    show_cpu_menu
    read -rp "  Select CPU profile (or 0 to cancel): " cpu_choice

    if ! [[ "$cpu_choice" =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Returning to main menu."
        return 1
    fi
    if [[ "$cpu_choice" -eq 0 ]]; then
        echo "Cancelled."
        return 0
    fi
    if (( cpu_choice < 1 || cpu_choice > ${#CPU_NAMES[@]} )); then
        echo "Invalid selection. Returning to main menu."
        return 1
    fi

    # --- GPU selection ---
    show_gpu_menu
    read -rp "  Select GPU profile (or 0 to cancel): " gpu_choice

    if ! [[ "$gpu_choice" =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Returning to main menu."
        return 1
    fi
    if [[ "$gpu_choice" -eq 0 ]]; then
        echo "Cancelled."
        return 0
    fi
    if (( gpu_choice < 1 || gpu_choice > ${#GPU_NAMES[@]} )); then
        echo "Invalid selection. Returning to main menu."
        return 1
    fi

    local cpu_idx=$(( cpu_choice - 1 ))
    local gpu_idx=$(( gpu_choice - 1 ))
    local cpu_writer="${CPU_WRITERS[$cpu_idx]}"
    local gpu_writer="${GPU_WRITERS[$gpu_idx]}"

    # --- CPU temperature override ---
    echo
    echo "  CPU profile default max temperature: 90°C"
    read -rp "  Override CPU max temperature? [y/N]: " cpu_temp_override
    local custom_cpu_temp=""
    if [[ "$cpu_temp_override" =~ ^[Yy]$ ]]; then
        if ! prompt_temperature "CPU max" 90; then
            echo "Cancelled."
            return 0
        fi
        custom_cpu_temp="$TEMP_RESULT"
    fi

    # --- GPU temperature override ---
    echo
    # Determine the default throttling temp from the selected GPU profile's name
    local gpu_default_temp=80
    if (( gpu_idx >= 2 )); then
        gpu_default_temp=90
    fi
    echo "  GPU profile default throttling temperature: ${gpu_default_temp}°C"
    read -rp "  Override GPU throttling temperature? [y/N]: " gpu_temp_override
    local custom_gpu_throttle=""
    local custom_gpu_recovery=""
    if [[ "$gpu_temp_override" =~ ^[Yy]$ ]]; then
        echo "  (Throttling temperature — the point at which the GPU begins to reduce clocks)"
        if ! prompt_temperature "GPU throttling" "$gpu_default_temp"; then
            echo "Cancelled."
            return 0
        fi
        custom_gpu_throttle="$TEMP_RESULT"

        echo
        echo "  (Recovery temperature — must be between 60°C and one degree below throttling temperature)"
        local recovery_max=$(( custom_gpu_throttle - 1 ))
        local recovery_default=$(( custom_gpu_throttle - 5 ))
        while true; do
            read -rp "  Enter GPU throttling_recovery temperature in °C (60–${recovery_max}, default ${recovery_default}, or 0 to cancel): " t
            if ! [[ "$t" =~ ^[0-9]+$ ]]; then
                echo "  Invalid input — please enter a whole number."
                continue
            fi
            if [[ "$t" -eq 0 ]]; then
                echo "Cancelled."
                return 0
            fi
            if (( t < 60 || t >= custom_gpu_throttle )); then
                echo "  Out of range — must be between 60 and ${recovery_max}°C."
                continue
            fi
            custom_gpu_recovery="$t"
            break
        done
    fi

    # --- Summary ---
    echo
    echo "Applying custom profile:"
    echo "  CPU : ${CPU_NAMES[$cpu_idx]} — ${CPU_DESCS[$cpu_idx]}"
    if [[ -n "$custom_cpu_temp" ]]; then
        echo "          ↳ max temperature overridden to ${custom_cpu_temp}°C"
    fi
    echo "  GPU : ${GPU_NAMES[$gpu_idx]} — ${GPU_DESCS[$gpu_idx]}"
    if [[ -n "$custom_gpu_throttle" ]]; then
        echo "          ↳ throttling overridden to ${custom_gpu_throttle}°C, recovery to ${custom_gpu_recovery}°C"
    fi
    echo

    # --- Write and patch CPU config ---
    echo "  Writing CPU config..."
    "$cpu_writer"
    if [[ -n "$custom_cpu_temp" ]]; then
        sed -i "s/^max_temperature = .*/max_temperature = ${custom_cpu_temp}/" "$CPU_TMPFILE"
    fi
    echo "  Installing to $CPU_DEST and restarting $CPU_SERVICE..."
    install_cpu

    # --- Write and patch GPU config ---
    echo "  Writing GPU config..."
    "$gpu_writer"
    if [[ -n "$custom_gpu_throttle" ]]; then
        sed -i "s/^throttling = .*/throttling = ${custom_gpu_throttle}/" "$GPU_TMPFILE"
        sed -i "s/^throttling_recovery = .*/throttling_recovery = ${custom_gpu_recovery}/" "$GPU_TMPFILE"
    fi
    echo "  Installing to $GPU_DEST and restarting $GPU_SERVICE..."
    install_gpu

    echo
    echo "Done!"
}

# ==============================================================================
# MAIN
# ==============================================================================

show_main_menu
read -rp "Enter selection (or 0 to exit): " choice

if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Exiting."
    exit 1
fi

if [[ "$choice" -eq 0 ]]; then
    echo "Exiting."
    exit 0
fi

custom_option=$(( ${#PRESET_NAMES[@]} + 1 ))

if [[ "$choice" -eq "$custom_option" ]]; then
    apply_custom
elif (( choice >= 1 && choice <= ${#PRESET_NAMES[@]} )); then
    apply_preset "$choice"
else
    echo "Invalid selection. Exiting."
    exit 1
fi
