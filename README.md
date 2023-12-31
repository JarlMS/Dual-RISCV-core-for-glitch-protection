# Dual-RISCV-core-for-glitch-protection

This project is done in collaboration with Silicon Laboratories Norway AS and investigates a new way of doing glitch protection in RISC-V cores. For this purpose we introduce the CV32E40DC. This is a modified version of the CV32E40S core made by the [OpenHW group](https://docs.openhwgroup.org/projects/cv32e40s-user-manual/en/latest/intro.html) running a dual-core lockstep mechanism. We demonstrate how this core, while simple to implement, offers an increased system robustness and fault detection coverage. By replacing complex security features we are also potentially able to increase throughput. 

![CV32E40DC block diagram](https://github.com/JarlMS/Dual-RISCV-core-for-glitch-protection/blob/main/docs/images/dual_cores-block.png?raw=true)

## Testing and verification 

Testing and verifying of the CV32E40DC was done using the toolchain described in [core-v-verif](https://github.com/openhwgroup/core-v-verif).

## Results

The quality of the CV32E40DC is determined by comparing the power, performance and area to benchmarks set by the CV32E40S. After synthesis of the cores it was found that the CV32E40DC occupies $3.3%$ more area and uses $27.9%$ more power than the benchmark. The impact to performance was shown to be negligible as the execution time was only decreased by $0.05%$. This could not be improved as performance is limited by side-channel attack prevention features which can not be replaced by a dual-core lockstep mechanism. 

![CV32E40S vs CV32E40DC area and power consumtion](https://github.com/JarlMS/Dual-RISCV-core-for-glitch-protection/blob/main/docs/images/area_power_both_cores.png?raw=true)


In addition to this both cores were subjected to tests meant to simulate possible glitch attacks. From these tests we found that the CV32E40DC outperformed the CV32E40S and was able to detect all faults injected to the system. 

