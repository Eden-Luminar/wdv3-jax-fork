#reuire for venv
sudo apt install python3.10-venv

#!/usr/bin/env bash
set -euo pipefail

# get the folder this script is in and make sure we're in it
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
cd "${script_dir}"

# make venv if not exist
if [[ ! -d .venv ]]; then
    echo "Creating virtual environment..."
    python3.10 -m venv .venv
fi

# activate the venv
source .venv/bin/activate

# upgrade pip
python -m pip install -U pip setuptools wheel

# install requirements
python -m pip install -r requirements.txt

#fixing bug from "python -m pip install -r requirements.txt", missing simple-parsing and einops
pip install simple-parsing
pip install einops

echo "Setup complete. Run 'source .venv/bin/activate' to enter the virtual environment."
exit 0
