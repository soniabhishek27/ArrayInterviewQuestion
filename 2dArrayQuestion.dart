import 'dart:convert';
import 'dart:io';

void main() {
  stdout.write("Enter the 2D array (e.g. [[1, 2, 3], [4, 5, 6], [7, 8, 9]]): ");
  String? input = stdin.readLineSync();
  List<List<int>> myArray = json.decode(input!);

  stdout.write("Enter the column index to sort: ");
  int? columnIndex;

  var inputColumn = stdin.readLineSync();
  if (int.tryParse(inputColumn!) == null) {
    stderr.writeln('Invalid input. Please enter an integer');
    exit(1);
  } else {
    columnIndex = int.parse(inputColumn);
  }

  int low = 0;
  int high = myArray.length - 1;

  sortColumn(myArray, columnIndex ?? 0, low, high);
  print(myArray);
}

// This is a custom solution with time complexity of
// O(Nlogn)
// solution

void sortColumn(List<List<int>> arr, int columnIndex, int low, int high) {
  if (low < high) {
    int pivot = partition(arr, columnIndex, low, high);
    sortColumn(arr, columnIndex, low, pivot);
    sortColumn(arr, columnIndex, pivot + 1, high);
  }
}

int partition(List<List<int>> arr, int columnIndex, int low, int high) {
  int pivot = arr[high][columnIndex];
  int i = low - 1;
  for (int j = low; j <= high - 1; j++) {
    if (arr[j][columnIndex] < pivot) {
      i++;
      var temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  var temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  return i + 1;
}

// void sortColumn(List<List<int>> arr, int columnIndex) {
//   arr.sort((a, b) => a[columnIndex].compareTo(b[columnIndex]));
// }
//
// As an alternate solution we can also use dart library to sort. this has the time complexity of O(N)L
