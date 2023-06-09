import heapq
from heapdict import heapdict


class SpaceSaving:
    def __init__(self, num_of_counters):
        self.num_of_counters = num_of_counters
        self.heap = heapdict()

    def update_element(self, element):
        """
        Update the counter for the element if the element
        is in the heap. if the
        element is new, replace it in the heap with the
        least element if the heap is full, or add it to the heap
        if the heap is not full.
        :param element: the element to update
        :return:
        """
        if element in self.heap:
            self.heap[element] += 1
        elif len(self.heap) < self.num_of_counters:
            self.heap[element] = 1
        else:
            counter_value = self.heap.popitem()
            self.heap[element] = counter_value[1] + 1  # index 1 is the value and index 0 is the key

    def contains(self, element) -> bool:
        """
        Check if the element is in the heap.
        :param element: the element to check
        :return: True if the element is in the heap, False otherwise.
        """
        return element in self.heap

    def get_elements(self):
        """
        Get all the elements in the heap.
        :return: a list of all the elements in the heap.
        """
        return {element: self.heap[element] for element in self.heap.keys()}


if __name__ == '__main__':
    s = SpaceSaving(4)
    elements = ['a', 'a', 'a', 'a', 'a', 'a', 'b', 'b', 'b', 'b', 'c', 'c', 'd', 'd', 'e', 'e', 'b',
                'a', 'a', 'a', 'a', 'a', 'a', 'b', 'b', 'b', 'b', 'c', 'c', 'd', 'd', 'e', 'e', 'b']
    for element in elements:
        s.update_element(element)

    print(s.get_elements())
    # for element in s.get_elements():
    #     print(element, s.heap[element])
