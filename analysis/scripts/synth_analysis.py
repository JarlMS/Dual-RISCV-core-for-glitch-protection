import pandas as pd 
import argparse as arg 
import matplotlib.pyplot as plt
import numpy as np

dual_core = {
    "area": 140587.232,
    "power": 3.26973e-03
}

core = {
    "area": 63121.093,
    "power": 1.13007e-03
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
            startangle=90, colors=['darkviolet', 'lightsalmon', 'lightblue'], textprops=dict(color="w",fontsize=20))
    ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
    ax1.set_title(f'CV32E40S - Total {sum(values1):.2e}W', fontsize=20)

    # Plot pie chart for core
    ax2.pie(values2, labels=labels, autopct=lambda p: '{:.2f}%\n({:.2e}W)'.format(p, p * sum(values2) / 100), 
            startangle=90, colors=['darkviolet', 'lightsalmon', 'lightblue'],
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
    plt.bar(bar_positions - bar_width / 2, dual_core_values, bar_width, label='CV32E40DC', color='lightblue')
    plt.bar(bar_positions + bar_width / 2, core_values, bar_width, label='CV32E40S', color='lightsalmon')

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
    plt.bar(bar_positions - bar_width / 2, dual_core_values, bar_width, label='CV32E40DC', color='lightblue')
    plt.bar(bar_positions + bar_width / 2, core_values, bar_width, label='CV32E40S', color='lightsalmon')

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
    dual_core_values = [dual_core["area"], dual_core["power"]]
    core_values = [core["area"], core["power"]]

    # set width of bar 
    barWidth = 0.25
    fig, ax = plt.subplots(figsize=(12, 8))

    # Set position of bar on X axis 
    br1 = np.arange(len(core_values)) 
    br2 = [x + barWidth for x in br1] 
    
    # Make the plot for area and power on the left y-axis
    ax.bar(br1, core_values, color='lightblue', width=barWidth, edgecolor='cadetblue', label='CV32E40S')
    ax.bar(br2, dual_core_values, color='lightsalmon', width=barWidth, edgecolor='tomato', label='CV32E40DC')
    bars = ax.bar(br2, dual_core_values, color='lightsalmon', width=barWidth, edgecolor='tomato')

    ax.set_ylabel('Area [pm^2]', fontweight='bold', fontsize=15) 
    ax2 = ax.twinx()

    # Make the plot for power on the right y-axis
    ax2.bar(br1, [0, core["power"]], color='lightblue', width=barWidth, edgecolor='cadetblue', label='CV32E40S')
    ax2.bar(br2, [0, dual_core["power"]], color='lightsalmon', width=barWidth, edgecolor='tomato', label='CV32E40DC')
    bars2 = ax2.bar(br2, [dual_core["power"]], color='lightsalmon', width=barWidth, edgecolor='tomato')

    ax2.set_ylabel('Power [W]', fontweight='bold', fontsize=15)

    # Adding Xticks 
    ax.set_xticks([r + barWidth/2 for r in range(len(core_values))])
    ax.set_xticklabels(['Area', 'Power'])
    
    # Combine legends from both axes
    # lines, labels = ax.get_legend_handles_labels()
    # lines2, labels2 = ax2.get_legend_handles_labels()
    # ax.legend(lines + lines2, labels + labels2, loc='upper left')
    ax.legend(loc='upper left')
    # Adding percentage difference inside the bars for dual_core
    for bar, bar2, value_core, value_dual_core in zip(bars, bars2, core_values, dual_core_values):
        percentage_difference = ((value_dual_core - value_core) / value_core) * 100
        yval = bar.get_height()
        yval2 = bar2.get_height()
        ax.text(bar.get_x() + bar.get_width()/2, yval, f'+{percentage_difference:.2f}%', ha='center', va='bottom')
        ax2.text(bar2.get_x() + bar2.get_width()/2, yval2, f'+{percentage_difference:.2f}%', ha='center', va='bottom')

    plt.show()

if __name__ == "__main__":
    plot_total(core, dual_core)
    plot_pie(core_power, dual_core_power)
