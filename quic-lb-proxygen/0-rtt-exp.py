import json
import os
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

def plot_cdf(zerortt_time_difference, onertt_time_difference, output_file='0-rtt-cdf.png'):
    """
    Plot the CDF of the time differences of 0-RTT and 1-RTT
    """
    # sort the time differences
    zerortt_time_difference.sort()
    onertt_time_difference.sort()

    # get the number of time differences
    num_zerortt = len(zerortt_time_difference)
    num_onertt = len(onertt_time_difference)

    # get the x-axis values
    zerortt_x = np.linspace(0, 1, num_zerortt)
    onertt_x = np.linspace(0, 1, num_onertt)

    # plot the CDFs
    plt.plot(zerortt_time_difference, zerortt_x, label='0-RTT')
    plt.plot(onertt_time_difference, onertt_x, label='1-RTT')

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


def get_values_from_qlogs(qlogs_folder):
    configurations = ['0_rtt', '1_rtt']

    statistics = {c: None for c in configurations}
    for configuration in configurations:
        qlogs_folder = './quic-lb-proxygen/parallel-P5-C' + configuration
        print(configuration)
        stats = get_statistics(qlogs_folder)
        statistics[configuration] = stats


    # qlogs_folder = './quic-lb-proxygen/parallel-P5-C0_rtt'
    # print("0-RTT")
    # zerortt_time_difference = get_statistics(qlogs_folder)

    # qlogs_folder = './quic-lb-proxygen/parallel-P5-C1_rtt'
    # print("1-RTT")
    # onertt_time_difference = get_statistics(qlogs_folder)

    # save the time differences to a file
    df = pd.DataFrame(statistics)
    # df = pd.DataFrame({'0-RTT': zerortt_time_difference, '1-RTT': onertt_time_difference})
    df.to_csv('parallel-P5-time-differences.csv', index=False)
    return df["0_rtt"], df["1_rtt"]


def main():
    # get the time differences from the qlogs
    qlogs_folder = './quic-lb-proxygen/parallel-P5-C'
    # zerortt_time_difference, onertt_time_difference = get_values_from_qlogs(qlogs_folder)

    zerortt_time_difference, onertt_time_difference = get_values_from_file('sequential-time-differences.csv')

    # plot_cdf(zerortt_time_difference, onertt_time_difference, output_file='sequential-cdf.png')
    num_iterations = 1000000
    plot_cdf(zerortt_time_difference[-num_iterations:], onertt_time_difference[-num_iterations:], output_file='1M-sequential-cdf.png')


if __name__ == '__main__':
    main()