class Clock {
    constructor() {
        this.date = new Date();
        this.hours = this.date.getHours();
        this.minutes = this.date.getMinutes();
        this.seconds = this.date.getSeconds();
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.
        setInterval(() => this._tick(), 1000)
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.

        console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
    }

    _tick() {
        // 1. Increment the time by one second.
        // 2. Call printTime.
        console.log(this)
        this.seconds = (this.seconds + 1) % 60
        if (!this.seconds) {
            this.minutes = (this.minutes + 1) % 60
            if (!this.minutes) {
                this.hours = (this.hours + 1) % 24
            }
        }
        this.printTime()
    }
}

const watch = new Clock();