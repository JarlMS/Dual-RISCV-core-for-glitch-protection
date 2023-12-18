import pandas as pd 
import argparse as arg 
import matplotlib.pyplot as plt
import numpy as np

dual_core = {
    "area": 65214.732,
    "power[uW]": 144.482
    # "instr_skip": 2790,
    # "cov_test": 3123
}

core = {
    "area": 63121.093,
    "power[uW]": 113.007
    # "insr_skip": 2799,
    # "cov_test": 3132
}

dual_core_area = {
    # "cell count" : 29351,
    "cell area" : 97142.022,
    "net area" : 43445.210,
    "total area": 140587.232
}

core_area = {
    # "cell count" : 13525,
    "cell area" : 42548.220,
    "net area" : 20572.873,
    "total area": 63121.093
}

dual_core_power = {
    "Leakage": 5.90822e-06,
    "Internal": 1.96720e-03,
    "Switching": 1.29662e-03
    #"total": 3.26973e-03
}

core_power = {
    "Leakage": 2.57559e-06,
    "Internal": 5.08823e-04,
    "Switching": 6.18671e-04
    #"total": 1.13007e-03
}


def plot_pie(data1, data2):
    labels = data1.keys()
    values1 = list(data1.values())
    values2 = list(data2.values())

    # Calculate the percentage difference between values1 and values2
    percentage_diff = [(v1 - v2) / v2 * 100 if v2 != 0 else 0 for v1, v2 in zip(values1, values2)]

    # Create subplots with 1 row and 2 columns
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 5))

    # Plot pie chart for dual_core
    ax1.pie(values1, labels=labels, autopct=lambda p: '{:.2f}%\n({:.2e}W)'.format(p, p * sum(values1) / 100),
            startangle=90, colors=['red', 'green', 'blue'], textprops=dict(color="w",fontsize=20))
    ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
    ax1.set_title(f'CV32E40S - Total {sum(values1):.2e}W', fontsize=20)

    # Plot pie chart for core
    ax2.pie(values2, labels=labels, autopct=lambda p: '{:.2f}%\n({:.2e}W)'.format(p, p * sum(values2) / 100), 
            startangle=90, colors=['red', 'green', 'blue'],
            textprops=dict(color="w",fontsize=20))
    ax2.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
    ax2.set_title(f'CV32E40DC - Total {sum(values2):.2e}W', fontsize=20)

    plt.legend(fontsize=15)
    plt.show()

def plot_power(core, dual_core):
    # Extracting keys and values
    labels = ["Leakage", "Internal", "Switching", "Total"]
    dual_core_values = [dual_core["leakage"], dual_core["internal"], dual_core["switching"], dual_core["total"]]
    core_values = [core["leakage"], core["internal"], core["switching"], core["total"]]

    # Bar width
    bar_width = 0.35

    # Bar positions
    bar_positions = np.arange(len(labels))

    # Creating bar plots
    plt.bar(bar_positions - bar_width / 2, dual_core_values, bar_width, label='CV32E40DC', color='blue')
    plt.bar(bar_positions + bar_width / 2, core_values, bar_width, label='CV32E40S', color='red')

    # Adding labels, title, and legend
    plt.xlabel('Categories')
    plt.ylabel('Power [$W$]')
    plt.title('Power consumption comparison between CV32E40S and CV32E40DC')
    plt.xticks(bar_positions, labels)
    plt.legend()

    plt.yticks(np.arange(0, max(max(core_values), max(dual_core_values)), step=0.0003))

    # Display the plot

    # Display the plot
    plt.show()

def plot_area(core, dual_core):
    # Extracting keys and values
    labels = ["Cell Area", "Net Area", "Total Area"]
    dual_core_values = [dual_core["cell area"], dual_core["net area"], dual_core["total area"]]
    core_values = [core["cell area"], core["net area"], core["total area"]]

    # Bar width
    bar_width = 0.35

    # Bar positions
    bar_positions = np.arange(len(labels))

    # Creating bar plots
    plt.bar(bar_positions - bar_width / 2, dual_core_values, bar_width, label='CV32E40DC', color='blue')
    plt.bar(bar_positions + bar_width / 2, core_values, bar_width, label='CV32E40S', color='red')

    # Adding labels, title, and legend
    plt.xlabel('Categories')
    plt.ylabel('Area [$pm^2$]')
    plt.title('Area comparison between CV32E40S and CV32E40DC')
    plt.xticks(bar_positions, labels)
    plt.legend()

    plt.yticks(np.arange(0, max(max(core_values), max(dual_core_values)+10000), step=10000))

    # # Calculate percentage difference and add text annotations
    for i, (core_val, dual_core_val) in enumerate(zip(core_values, dual_core_values)):
        percentage_diff = ((dual_core_val - core_val) / core_val) * 100
        plt.text(bar_positions[i] - bar_width / 2, dual_core_val + 5000, f'+{percentage_diff:.2f}%', ha='center', va='bottom', color='black', fontsize=15)

    # Display the plot
    plt.show()

def plot_total(core, dual_core):
    # Extracting keys and values
    labels = ["Area", "Power"]
    dual_core_values = [dual_core["area"], dual_core["power[uW]"]]
    core_values = [core["area"], core["power[uW]"]]

    # Bar width
    bar_width = 0.35

    # Bar positions
    bar_positions = np.arange(len(labels))

    # Creating the main axis
    fig, ax1 = plt.subplots()
   
    # Creating bar plots for area on the left y-axis
    ax1.bar(bar_positions, [dual_core["area"], core["area"]], bar_width, label='CV32E40S', color='blue')
    ax1.set_xlabel('Metrics')
    ax1.set_ylabel('Area [pm^2]', color='blue')
    ax1.tick_params(axis='y', labelcolor='blue')

    ax1.set_ylim(60000, ax1.get_ylim()[1])

    ax1.set_yticks(np.arange(ax1.get_yticks()[0], ax1.get_yticks()[-1], step=1000))


    # Creating a twin axis for power on the right y-axis
    ax2 = ax1.twinx()
    ax2.bar(bar_positions + bar_width, [dual_core["power[uW]"], core["power[uW]"]], bar_width, label='CV32E40DC', color='red')
    ax2.set_ylabel('Power [uW]', color='red')
    ax2.tick_params(axis='y', labelcolor='red')

    # Adding labels, title, and legend
    plt.title('Comparison of CV32E40S and CV32E40DC')
    plt.xticks(bar_positions + bar_width/2, labels)

    handles1, labels1 = ax1.get_legend_handles_labels()
    handles2, labels2 = ax2.get_legend_handles_labels()
    handles = handles1 + handles2
    labels = labels1 + labels2
    plt.legend(handles, labels)

    # Display the plot
    plt.show()


if __name__ == "__main__":
    plot_area(core_area, dual_core_area)

