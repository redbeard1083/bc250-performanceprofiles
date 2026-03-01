#!/bin/bash

SCRIPT_DIR="./scripts"

if [ ! -d "$SCRIPT_DIR" ]; then
    echo "Directory $SCRIPT_DIR does not exist."
    exit 1
fi

mapfile -t scripts < <(
    find "$SCRIPT_DIR" -maxdepth 1 -type f -executable -printf "%f\n" \
    | sort
)

if [ ${#scripts[@]} -eq 0 ]; then
    echo "No executable scripts found in $SCRIPT_DIR"
    exit 1
fi

echo "Performance Options:"
echo

for i in "${!scripts[@]}"; do
    name="${scripts[$i]}"

    # Trim first 3 and last 3 characters for display
    display_name="${name:3:${#name}-6}"

    # Get first line
    first_line="$(head -n 1 "$SCRIPT_DIR/$name")"

    # Remove leading "# "
    descriptor="${first_line#\# }"

    # Remove leading "echo "
    descriptor="${descriptor#echo }"

    # Trim surrounding quotes (single or double)
    descriptor="${descriptor%\"}"
    descriptor="${descriptor#\"}"
    descriptor="${descriptor%\'}"
    descriptor="${descriptor#\'}"

    printf "%2d) %-20s - %s\n" "$((i+1))" "$display_name" "$descriptor"
done

echo
read -p "Enter the number of the performance profile to apply (or 0 to exit): " choice

if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
    echo "Invalid input."
    exit 1
fi

if [ "$choice" -eq 0 ]; then
    echo "Exiting."
    exit 0
fi

if [ "$choice" -lt 1 ] || [ "$choice" -gt "${#scripts[@]}" ]; then
    echo "Invalid selection."
    exit 1
fi

selected_script="$SCRIPT_DIR/${scripts[$((choice-1))]}"
echo
echo "Running ${scripts[$((choice-1))]:3:${#scripts[$((choice-1))]}-6}..."
echo
bash "$selected_script"
