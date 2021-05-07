// class Clock {
//     constructor() {
//         this.date = new Date();
//         this.hours = this.date.getHours();
//         this.minutes = this.date.getMinutes();
//         this.seconds = this.date.getSeconds();
//         // 2. Store the hours, minutes, and seconds.
//         // 3. Call printTime.
//         // 4. Schedule the tick at 1 second intervals.
//         setInterval(() => this._tick(), 1000)
//     }

//     printTime() {
//         // Format the time in HH:MM:SS
//         // Use console.log to print it.

//         console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
//     }

//     _tick() {
//         // 1. Increment the time by one second.
//         // 2. Call printTime.
//         console.log(this)
//         this.seconds = (this.seconds + 1) % 60
//         if (!this.seconds) {
//             this.minutes = (this.minutes + 1) % 60
//             if (!this.minutes) {
//                 this.hours = (this.hours + 1) % 24
//             }
//         }
//         this.printTime()
//     }
// }

// const watch = new Clock();

// const readline = require('readline');

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// })


// function addNumbers(sum, numsLeft, completionCallback) {

//   if (!numsLeft) {
//     completionCallback(sum);
//   }

//   if (numsLeft > 0) {

//     reader.question('Number to add?', (input) => {
//       sum += parseInt(input);
//       console.log("current sum", sum)
      
//       addNumbers(sum, --numsLeft, completionCallback)
//     })

//     console.log('HELLOLO')
//   }

// }


// addNumbers(0, 3, (sum) => {
//   console.log(`TOTAL IS: ${sum}`)
// })


const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question(`${el1} > ${el2}?`,(ans) => callback(ans === "yes".trim()));
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.

    if (i === arr.length - 1) {
      outerBubbleSortLoop(madeAnySwaps);
    }
    else {
        // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
      askIfGreaterThan(arr[i], arr[i+1], (swap) => {
        if (swap) {
          const temp = arr[i];
          arr[i] = arr[i+1];
          arr[i+1] = temp;
          madeAnySwaps = true
        }

        innerBubbleSortLoop(arr, ++i, madeAnySwaps, outerBubbleSortLoop)
        
      })
      
    }
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {

  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
    } else {
      sortCompletionCallback(arr)
    }
    // Begin an inner loop if you made any swaps. Otherwise, call
    // innerBubbleSortLoop(arr, 0, )
    // `sortCompletionCallback`.
  }
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});