import json
import os
import sys
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

def plot_cdf(differences, labels, output_file='0-rtt-cdf.png'):
    """
    Plot the CDF of the time differences of 0-RTT and 1-RTT
    """
    # sort the time differences
    [difference.sort() for difference in differences]
    # zerortt_time_difference.sort()
    # onertt_time_difference.sort()

    # get the number of time differences
    lengths = [len(difference) for difference in differences]
    # num_zerortt = len(zerortt_time_difference)
    # num_onertt = len(onertt_time_difference)

    # get the x-axis values
    x_axis_values = [np.linspace(0, 1, length) for length in lengths]
    # zerortt_x = np.linspace(0, 1, num_zerortt)
    # onertt_x = np.linspace(0, 1, num_onertt)

    # plot the CDFs
    for i, difference in enumerate(differences):
        plt.plot(difference, x_axis_values[i], linestyle='-', label=labels[i])

    # plt.plot(zerortt_time_difference, zerortt_x, linestyle='-', label='0-RTT')
    # plt.plot(onertt_time_difference, onertt_x, linestyle='-.', label='1-RTT')

    # set the title and labels
    # plt.title('CDF of time difference between first packet sent and first packet received')
    plt.xlabel('Time difference (ms)')
    plt.ylabel('CDF')

    # set the legend
    plt.legend()

    # save the plot
    plt.savefig(output_file)

    # show the plot
    plt.show()


def get_statistics(qlogs_folder):
    """
    go over the files in the qlogs folder (of extension .qlog),
    and for each file, read it as a json, and as a datapoint, store the
    difference between the time of the first packet sent and the time of the
    first packet received of type 1RTT.
    The packet type is under ["traces"][0]["events"][i]["packet_sent"]["packet_type"] and
    ["traces"][0]["events"][i]["packet_received"]["packet_type"], if the packet is sent or
    received.
    """
    # get all the files in the folder
    files = os.listdir(qlogs_folder)

    # store the time differences in a list
    time_differences = []

    for i, file in enumerate(files):
        # print("Reading file: " + file)
        # read the file as a json
        with open(qlogs_folder + '/' + file) as f:
            data = json.load(f)

        time_first_sent = None
        time_onertt_received = None
        # go over the events
        for event in data["traces"][0]["events"]:
            if "packet_sent" in event and time_first_sent is None:
                if "packet_type" in event[3]:
                    if event[3]["packet_type"] == "initial":
                        # get the time of the first initial packet sent by the client
                        time_first_sent = event[0]
            
            if "packet_received" in event and time_onertt_received is None:
                if "packet_type" in event[3]:
                    # if the packet is a 1RTT packet
                    if event[3]["packet_type"] == "1RTT":
                        # get the time of the first 1RTT packet received from the server
                        time_onertt_received = event[0]
        difference = int(time_onertt_received) - int(time_first_sent)
        assert difference > 0
        # store the time difference
        time_differences.append(difference)
        if i % 100000 == 0:
            print("Finished reading " + str(i) + " files")

    # get the mean and standard deviation of the time differences
    mean = np.mean(time_differences)
    std = np.std(time_differences)

    # print the statistics
    print("Mean: " + str(mean))
    print("Standard deviation: " + str(std))
    return time_differences


def get_values_from_file(filename):
    df = pd.read_csv(filename)
    zerortt_time_difference = df['0_rtt'].tolist()
    onertt_time_difference = df['1_rtt'].tolist()
    return zerortt_time_difference, onertt_time_difference


def get_values_from_qlogs(qlogs_folder, num_iterations):
    configurations = ['0_rtt', '1_rtt']
    min_length = 10000000
    statistics = {c: None for c in configurations}
    for configuration in configurations:
        folder = qlogs_folder + configuration
        print(configuration)
        stats = get_statistics(folder)
        statistics[configuration] = stats[-num_iterations:]
        min_length = min(min_length, len(statistics[configuration]))


    # qlogs_folder = './quic-lb-proxygen/parallel-P5-C0_rtt'
    # print("0-RTT")
    # zerortt_time_difference = get_statistics(qlogs_folder)

    # qlogs_folder = './quic-lb-proxygen/parallel-P5-C1_rtt'
    # print("1-RTT")
    # onertt_time_difference = get_statistics(qlogs_folder)

    # save the time differences to a file
    statistics = {c: statistics[c][:min_length] for c in configurations}
    df = pd.DataFrame(statistics)
    # df = pd.DataFrame({'0-RTT': zerortt_time_difference, '1-RTT': onertt_time_difference})
    df.to_csv(f'{qlogs_folder}.csv', index=False)
    return statistics["0_rtt"], statistics["1_rtt"]

def plot_all_mean(differences, labels, output_file):
    """
    for each difference in differences, calculate the mean. In the end,
    plot the means as a function of the number of processes, one line for 0-RTT
    and one line for 1-RTT.
    """
    means = [np.mean(difference) for difference in differences]
    
    # for each mean value, check if the corresponding label is 0-RTT or 1-RTT and plot accordingly
    # the x-axis values should be the number of processes
    x_axis_values = [int(label[7:]) for label in labels]
    print(x_axis_values)

    y_axis_0_rtt = [means[i] for i, label in enumerate(labels) if label.startswith('0-RTT')]
    x_axis_0_rtt_values = [x_axis_values[i] for i, label in enumerate(labels) if label.startswith('0-RTT')]
    y_axis_1_rtt = [means[i] for i, label in enumerate(labels) if label.startswith('1-RTT')]
    x_axis_1_rtt_values = [x_axis_values[i] for i, label in enumerate(labels) if label.startswith('1-RTT')]

    plt.plot(x_axis_0_rtt_values, y_axis_0_rtt, 'b-', label='0-RTT', marker='x')
    plt.plot(x_axis_1_rtt_values, y_axis_1_rtt, 'r-.', label='1-RTT', marker='o')
    # for i, label in enumerate(labels):
    #     if label.startswith('0-RTT'):
    #         plt.plot(x_axis_values[i], means[i], 'b-')
    #     else:
    #         plt.plot(x_axis_values[i], means[i], 'r-')
    


    # set the title and labels
    plt.legend()
    plt.xlabel('Number of processes')
    plt.ylabel('Mean time difference (ms)')

    # save the plot
    plt.savefig(output_file)




def combine_all_info():
    """
    draw cdf of multiple configurations on the same plot
    """
    processes = [1, 5, 15, 20, 30, 60, 100, 200]
    files = [f'parallel-P{p}-C.csv' for p in processes]
    differences, labels = [], []
    for file in files:
        print("Reading file: " + file)
        zerortt_time_difference, onertt_time_difference = get_values_from_file(file)
        differences.append(zerortt_time_difference)
        labels.append(f'0-RTT-P{file[10:-6]}')
        differences.append(onertt_time_difference)
        labels.append(f'1-RTT-P{file[10:-6]}')

    return differences, labels


def main():
    differences, labels = combine_all_info()

    # plot_cdf(differences, labels, output_file=f'all-cdf.png')
    plot_all_mean(differences, labels, output_file='all-mean.png')

    return
    # get the time differences from the qlogs
    exp = sys.argv[1]
    qlogs_folder = f'./{exp}'
    num_iterations = 1000000
    zerortt_time_difference, onertt_time_difference = get_values_from_qlogs(qlogs_folder, num_iterations)

    # zerortt_time_difference, onertt_time_difference = get_values_from_file('sequential-time-differences.csv')
    # zerortt_time_difference, onertt_time_difference = get_values_from_file(qlogs_folder + '.csv')

    # plot_cdf(zerortt_time_difference, onertt_time_difference, output_file='sequential-cdf.png')
    # plot_cdf(zerortt_time_difference[-num_iterations:], onertt_time_difference[-num_iterations:], output_file='1M-sequential-cdf.png')
    plot_cdf([zerortt_time_difference[-num_iterations:], onertt_time_difference[-num_iterations:]], ["0-RTT", "1-RTT"], output_file=f'1M-parallel-{qlogs_folder[2:]}-cdf.png')


 

if __name__ == '__main__':
    main()