
def heapSort(array)
	n = array.size  
	a = [nil] + array              
	(n / 2).downto(1) do |i|  
		down_heap(a, i, n)  
	end  
	while n > 1  
		a[1], a[n] = a[n], a[1]  
		n -= 1  
		down_heap(a, 1, n)  
	end  
	a.drop(1)     
end

def down_heap(a, parent, limit)  
	wk = a[parent]  
	while (child = 2 * parent) <= limit  
		child += 1  if child < limit and a[child] < a[child + 1]  
		break  if wk >= a[child]  
		a[parent] = a[child]  
		parent = child  
	end  
	a[parent] = wk  
end  

def radixSort(array)
  temp = []
  sorted_array = []

  array.each do |x|
    if temp[x] == nil
      temp[x] = 1
    else
      temp[x] = temp[x] + 1
    end
  end

  temp.each_with_index do |x, i|
    if (x)
      x.times do
        sorted_array << i
      end
    end
  end
  sorted_array
end

def quickSort(array, from=0, to=nil)
    if to == nil      
        to = array.count - 1
    end

    if from >= to   
        return
    end

    pivot = array[from]
    min = from
    max = to
    free = min

    while min < max
        if free == min 
            if array[max] <= pivot
                array[free] = array[max]
                min += 1
                free = max
            else
                max -= 1
            end
        elsif free == max 
            if array[min] >= pivot 
                array[free] = array[min]
                max -= 1
                free = min
            else
                min += 1
            end
        else
            raise "Inconsistent state"
        end
    end

    array[free] = pivot
    quickSort array, from, free - 1
    quickSort array, free + 1, to
end

def mergeSort(array)
	return array if array.size <= 1
	mid   = array.size / 2
	left  = array[0, mid]
	right = array[mid, array.size]
	merge(mergeSort(left), mergeSort(right))
end

def merge(left, right)
	sorted = []
  	until left.empty? || right.empty?
    	if left.first <= right.first
      		sorted << left.shift
    	else
    		sorted << right.shift
    	end
    end
    sorted.concat(left).concat(right)
end

def bubbleSort(array)
	return array if array.size <= 1
	swapped = true
	while swapped 
		swapped = false
		0.upto(array.size-2) do |i|
			if array[i] > array[i+1]
				array[i], array[i+1] = array[i+1], array[i]
				swapped = true
			end 
		end
	end
	return array
end

def selectionSort(array)
	lenD = array.size-1
	j = 0
	temp = 0
	0.upto(lenD) do |i|
		j = i
		i.upto(lenD) do |k|
			if array[j] > array[k]
				j = k;
			end
		end
		temp = array[i]
		array[i] = array[j]
		array[j] = temp
	end
	 return array
end	

def insertionSort(array)
	lenD = array.size-1
	key = 0
	i = 0
	1.upto(lenD) do |j|
		key, i = array[j], j-1
		while  i >= 0 and array[i] > key
			array[i+1], i, array[i+1] = array[i], i-1, key
		end
	end
	return array
end

def fill_in(array,size)
	1.upto(size) do |i|
		array << rand(100)
	end
end

Rsize = 1000

#1	
array1 = Array.new()
fill_in(array1,Rsize)
array1.shuffle
#print "bubbleSort not sort\n "
#puts array1.inspect

#2
array2 = Array.new()
fill_in(array2,Rsize)
array2.shuffle
#print "SelectionSort not sort\n "
#puts array2.inspect

#3
array3 = Array.new()
fill_in(array3,Rsize)
array3.shuffle
#print "InsertionSort not sort\n "
#puts array3.inspect

#4
array4 = Array.new()
fill_in(array4,Rsize)
array4.shuffle
#print "MergeSort not sort\n "
#puts array4.inspect

#5
array5 = Array.new()
fill_in(array5,Rsize)
array5.shuffle
#print "QuickSort not sort\n "
#puts array5.inspect

#6
array6 = Array.new()
fill_in(array6, Rsize)
array6.shuffle
#print "RadicSort not sort\n "
#puts array6.inspect

#7
array7 = Array.new()
fill_in(array7, Rsize)
array7.shuffle
#print "HeapSort not sort\n "
#puts array7.inspect


print"________________________________________________________\n"

require 'benchmark'
#benchmark me ayuda a simular el corrido de 10 veces por cada uno :)

#1
bubble_sort_timing = Benchmark.measure {10.times {bubbleSort(array1)}}
#start = Time.now
#array1 = bubbleSort(array1)
#finish = Time.now
#diff = finish - start

#2
insertion_sort_timing = Benchmark.measure {10.times {insertionSort(array3)}}
#start2 = Time.now
#array3 = insertionSort(array3)
#finish2 = Time.now
#diff2 = finish2- start2

#3
selection_sort_timing = Benchmark.measure {10.times {selectionSort(array2)}}
#start1 = Time.now
#array2 = selectionSort(array2)
#finish1 = Time.now
#diff1 = finish1 - start1

#4

radix_sort_timing = Benchmark.measure {10.times {radixSort(array6)}}
#start5 = Time.now
#array6 = array6.radix_sort
#finish5 = Time.now
#diff5 = finish5 - start5

#5
heap_sort_timing = Benchmark.measure {10.times {heapSort(array7)}}
#start6 = Time.now
#array7 = heapSort(array7)
#finish6 = Time.now
#diff6 = finish6 - start6

#6
quick_sort_timing = Benchmark.measure {10.times {quickSort(array5)}}
#start4 = Time.now
#array5 = quickSort(array5)
#finish4 = Time.now
#diff4 = finish4- start4

#7
merge_sort_timing = Benchmark.measure {10.times {mergeSort(array4)}}
#start3 = Time.now
#array4 = mergeSort(array4)
#finish3 = Time.now
#diff3 = finish3- start3

print "\tTamaño del array #{Rsize}\n"
#1
print "\t\t\t\t\t\t    User      System\t  Total\t      Real\n"
#print "\tBubbleSort manual withTime-> #{diff}\n "
print "\tBubbleSort bechmarking withTime-> \t#{bubble_sort_timing}\n "
#puts "\t #{array1.inspect}"

#2
#print "\tInsertionSort manual withTime-> #{diff2}\n "
print "\tInsertionSort bechmarking withTime-> \t#{insertion_sort_timing}\n "
#puts "\t #{array3.inspect}"

#3
#print "\tSelectionSort manual withTime-> #{diff1}\n "
print "\tSelectionSort bechmarking withTime-> \t#{selection_sort_timing}\n "
#puts "\t #{array2.inspect}"

#4
#print "\tRadixSort manual withTime-> #{diff5}\n "
print "\tRadixSort bechmarking withTime-> \t#{radix_sort_timing}\n "
#puts "\t #{array6.inspect}"


#5
#print "\tHeapSort manual withTime-> #{diff6}\n "
print "\tHeapSort bechmarking withTime-> \t#{heap_sort_timing}\n "
#puts "\t #{array7.inspect}"

#6
#print "\tQuickSort manual withTime-> #{diff4}\n "
print "\tQuickSort bechmarking withTime-> \t#{quick_sort_timing}\n "
#puts "\t #{array5.inspect}"

#7
#print "\tMergeSort manual withTime-> #{diff3}\n "
print "\tMergeSort bechmarking withTime-> \t#{merge_sort_timing}\n "
#puts "\t #{array4.inspect}"

print"________________________________________________________\n"


#con cada sort voy a correrlo 10 veces y saco el promedio con el input