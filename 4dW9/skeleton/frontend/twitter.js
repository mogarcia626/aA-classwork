const FollowToggle = require('./follow_toggle')

$(() => {
    $('.follow-toggle').each((idx, button) => {
        const a = new FollowToggle(button);
    })
    
})