const FollowToggle = require('./follow_toggle')
const UsersSearch = require('./users_search')
$(() => {
    $('.follow-toggle').each((idx, button) => {
        const a = new FollowToggle(button);
    })
    $('.user-search').each((idx, search) => {
        console.log("created search box")
        const a = new UsersSearch(search);
    })
    
})