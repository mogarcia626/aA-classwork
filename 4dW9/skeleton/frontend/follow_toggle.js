const { unfollowUser, followUser } = require("./api_util");

class FollowToggle {
    constructor (obj) {
        let $obj = $(obj);
        this.user_id = $obj.data('user-id');
        this.state = $obj.data('initial-follow-state');
        this.$obj = $obj;
        this.running = false
        this.render();
        this.$obj.click( (e) => {
            e.preventDefault()
            this.handleClick();
        })
    }

    render () {
        let text = (this.state) ? 'Unfollow' : 'Follow'
        this.$obj.text(text)
        if (this.running) {
            this.$obj.prop('disabled', true)
        } else {
            this.$obj.prop('disabled', false)
        }
    } 

    handleClick () {
        console.log("clicked")
        // debugger
        // $.ajax({
        //     url: `/users/${this.user_id}/follow`,
        //     type: this.state ? 'DELETE' : 'POST',
        //     success: () => {
        //         this.state = this.state ? false : true;
        //         this.render();
        //     },
        //     dataType: 'json'
        // })
        let p = new Promise((resolve, reject) => {
            this.running = true
            this.render()
            if (this.state) {
                let output = unfollowUser(this.user_id)
                resolve(output)
            } else {
                let output = followUser(this.user_id)
                resolve(output)
            }
        }).then(result => {
            this.running = false
            this.state = this.state ? false : true
            this.render();
        })
        
    }
}

module.exports = FollowToggle