class FollowToggle {
    constructor (obj) {
        let $obj = $(obj);
        this.user_id = $obj.data('user-id');
        this.state = $obj.data('initial-follow-state');
        this.$obj = $obj;
        this.render();
        this.$obj.click( (e) => {
            e.preventDefault()
            this.handleClick();
        })
    }

    render () {
        let text = (this.state) ? 'Unfollow' : 'Follow'
        this.$obj.text(text)

    } 

    handleClick () {
        // debugger
        $.ajax({
            url: `/users/${this.user_id}/follow`,
            type: this.state ? 'DELETE' : 'POST',
            success: () => {
                this.state = this.state ? false : true;
                this.render();
            },
            dataType: 'json'
        })
        
    }
}

module.exports = FollowToggle