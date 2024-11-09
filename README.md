
# Cross-compile Mosquitto for ARM32 and ARM64 Architectures

Project to develop a Bash script on a Linux system to cross-compile "Mosquitto" for both ARM32 and ARM64 architectures with TLS support, utilizing the ARM toolchain.

## Project Setup

### 1. Setup ARM Toolchain

Download the ARM64 and ARM32 toolchains for x86-linux architecture and extract them from [ARM Downloads](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads).

Create directories:

```bash
sudo mkdir /opt/arm_64/
sudo mkdir /opt/arm_32/
```

Move the extracted folders into respective directories from `Downloads` and rename them to `arm`. The final paths should be:

- `/opt/arm_64/arm`
- `/opt/arm_32/arm`

Once completed, add these to the `PATH`:

```bash
export PATH=/opt/arm_64/arm/bin:$PATH
export PATH=/opt/arm_32/arm/bin:$PATH
```

Confirm the ARM compilers are in the `PATH`. The following commands should output the complete paths:

```bash
which aarch64-none-linux-gnu-gcc
which arm-none-linux-gnueabihf-gcc
```

### 2. Setup OpenSSL

Once the ARM toolchain setup is complete, download a suitable version of OpenSSL from [OpenSSL Source](https://openssl.org/source/). Extract it, enter the directory, and run the setup script `openssl_setup.sh` to cross-compile OpenSSL for ARM64 and ARM32.

```bash
chmod +x openssl_setup.sh
./openssl_setup.sh
```

Ensure you prepend the entire path of `openssl_setup.sh` while running the script.

### 3. Setup Mosquitto

Download the source code of Mosquitto (tar file) from [Mosquitto Download](https://mosquitto.org/download/) and extract it.

### 4. Cross-compile Mosquitto for ARM64 and ARM32

Run the compilation script:

```bash
chmod +x mosquitto_compile.sh
./mosquitto_compile.sh
```

**Note:**  
Inside the script, I have navigated to the extracted Mosquitto directory before running make:

```bash
cd ~/Downloads/mosquitto-2.0.20
```

Make necessary changes to this line of code as per your environment. We also create output directories using the following commands:

```bash
sudo mkdir /opt/arm_64/output
sudo mkdir /opt/arm_32/output
```

If you are re-running the script, comment out these commands if the directories were created during the initial run.

### 5. Output Confirmation

Once cross-compilation completes successfully, verify the output format. Run the following commands one by one:

```bash
file /opt/arm_64/output/usr/local/sbin/mosquitto
file /opt/arm_32/output/usr/local/sbin/mosquitto
```

The output should indicate the files are ARM executables:

- `ELF 64-bit LSB executable, ARM aarch64`
- `ELF 32-bit LSB executable, ARM`
