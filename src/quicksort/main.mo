import Array "mo:base/Array";
import Int "mo:base/Int";
import Order "mo:base/Order";
import Debug "mo:base/Debug";

actor Main {

  type Order = Order.Order;

  // Sort the elements of an array using the given comparison function.
  func Quicksort(xs : [Int]) : [Int] {
      let n = xs.size();
      if (n < 2) {
          xs;
      } else {
          let result: [var Int] = Array.thaw(xs); //transform xs to a mutable array
          QuicksortHelper(result, 0, n - 1);
          Array.freeze(result); //transform result to an immutable array
      };
  };

  func QuicksortHelper(
      xs : [var Int],
      l : Int,
      r : Int
  ) {
      if (l < r) {
          var i = l;
          var j = r;
          var swap  = xs[0];
          let pivot = xs[Int.abs(l + r) / 2];
          while (i <= j) {
              while (xs[Int.abs(i)] < pivot) {
                  i := i + 1;
              };
                while (xs[Int.abs(j)] > pivot) {
                  j := j - 1;
              };
              if (i <= j) {
                  swap := xs[Int.abs(i)];
                  xs[Int.abs(i)] := xs[Int.abs(j)];
                  xs[Int.abs(j)] := swap;
                  i := i + 1;
                  j := j - 1;
              };
          };
          if (l < j) {
              QuicksortHelper(xs, l, j);
          };
          if (i < r) {
              QuicksortHelper(xs, i, r);
          };
      };
  };

  // debugging ...
  let a = [-10,15,23,133,22,15];
  let b = Quicksort(a);
  var i = 0;

  while ( i < b.size()) {
    Debug.print(Int.toText(b[i]));
    i += 1;
  };
  
  
  // Sort an array of integers.
  public func qsort(xs : [Int]) : async [Int] {
    Quicksort(xs);
  };

};