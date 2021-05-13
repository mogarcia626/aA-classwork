const {searchUsers} = require('./api_util')
const FollowToggle = require('./follow_toggle')

class UsersSearch {
    constructor(obj) {
        let $obj = $(obj)
        this.$obj = $obj
        console.log($obj)
        this.$input = $('.user-search input')
        this.$ul = $('.user-search .users')
        console.log(this.$input)
        this.$input.on('input', (e) => {
            e.preventDefault()
            this.handleInput(e.target.value);
        })
    }

    renderResults(users) {
        this.$ul.empty()
        users.forEach((el) => {
            let $li = $(`<li><a href='/users/${el.id}'>${el.username}</a></li>`)
            let button = `<button class='follow-toggle' data-user-id = ${el.id} data-initial-follow-state = '${el.followed}'></button>`
            $li.append(button)
            console.log($li)
            this.$ul.append($li)
            
            // const a = new FollowToggle(button);
            // this.$ul.append(`<li><a href='/users/${el.id}'>${el.username}</a><button class='follow-toggle' data-user-id = ${el.id} data-initial-follow-state = '${el.followed}'></button></li>`)
        })
        $('.follow-toggle').each((idx, button) => {
            const a = new FollowToggle(button);
        })
    }

    handleInput(query) {
        let p = new Promise((resolve, reject) => {
            let output = searchUsers(query)
            resolve(output)
        }).then(result => {
            console.log(result)
            this.renderResults(result)
        })
    }

}

module.exports = UsersSearch